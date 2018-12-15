//
//  RSSService.h
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSService : NSObject

+ (void)addRssItemWithUrl: (NSString *)url name: (NSString *)name;

+ (void)deleteRssItemWithId: (NSString *)idObject;

+ (NSArray *)listRssItems;

+ (void)loadRssFeed: (NSString *)url completion: (void (^)(NSArray *rssFeedItems, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
