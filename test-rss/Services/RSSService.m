//
//  RSSService.m
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//
#import <Realm/Realm.h>

#import "RSSService.h"
#import "RssItem.h"

@interface RSSService ()

@end

@implementation RSSService

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
    NSArray *results = [RssItem allObjects];
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

@end
