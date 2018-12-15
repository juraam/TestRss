//
//  RSSService.m
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//
#import <Realm/Realm.h>
#import <MWFeedParser.h>

#import "RSSService.h"
#import "RssItem.h"
#import "RssFeedItem.h"
#import "NetworkStatus.h"

@interface RSSService () <MWFeedParserDelegate>

@property (strong, nonatomic) MWFeedParser *parser;
@property (strong, nonatomic) NSMutableArray *currentItems;
@property (copy, nonatomic) void (^completionBlock)(NSArray *, NSError *);

@end

@implementation RSSService

+ (void)loadRssFeed:(NSString *)url completion:(void (^)(NSArray * _Nonnull, NSError * _Nonnull))completion
{
    [[self instance] loadRssFeed:url completion:completion];
}

+ (void)deleteRssItemWithId:(NSString *)idObject
{
    [[self instance] deleteRssItemWithId:idObject];
}

+ (NSArray *)listRssItems
{
    return [[self instance] listRssItems];
}

+ (void)addRssItemWithUrl:(NSString *)url name:(NSString *)name
{
    [[self instance] addRssItemWithUrl:url name:name];
}

#pragma mark - Private

+ (instancetype)instance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (void)loadRssFeed:(NSString *)url completion:(void (^)(NSArray * _Nonnull, NSError * _Nonnull))completion
{
    RLMResults *res = [RssFeedItem objectsWhere:@"self.urlRss=%@", url];
    self.currentItems = [NSMutableArray array];
    if (![[NetworkStatus instance] isConnected]) {
        for (RLMObject *object in res) {
            [self.currentItems addObject:object];
        }
        completion(self.currentItems, nil);
        return;
    }
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteObjects:res];
    }];
    self.parser = [[MWFeedParser alloc] initWithFeedURL:[NSURL URLWithString:url]];
    self.parser.connectionType = ConnectionTypeAsynchronously;
    self.parser.delegate = self;
    self.completionBlock = completion;
    [self.parser parse];
}

- (void)addRssItemWithUrl:(NSString *)url name:(NSString *)name
{
    RssItem *item = [RssItem new];
    item.idObject = [[NSUUID UUID] UUIDString];
    item.title = name;
    item.url = url;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:item];
    }];
}

- (NSArray *)listRssItems
{
    RLMResults *results = [RssItem allObjects];
    NSMutableArray *list = [NSMutableArray array];
    for (RLMObject *object in results) {
        [list addObject:object];
    }
    return list;
}

- (void)deleteRssItemWithId:(NSString *)idObject
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    RssItem *item = [RssItem objectForPrimaryKey:idObject];
    [realm transactionWithBlock:^{
        [realm deleteObject:item];
    }];
}

#pragma mark - <MWFeedParserDelegate>

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    self.completionBlock(self.currentItems, error);
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    self.completionBlock(self.currentItems, nil);
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    RssFeedItem *feedItem = [RssFeedItem new];
    feedItem.title = item.title;
    feedItem.content = item.content;
    feedItem.summary = item.summary;
    feedItem.date = item.date;
    feedItem.link = item.link;
    feedItem.idObject = [[NSUUID UUID] UUIDString];
    feedItem.urlRss = parser.url.absoluteString;
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:feedItem];
    }];
    [self.currentItems addObject:feedItem];
}

@end
