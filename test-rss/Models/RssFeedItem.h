//
//  RssFeedItem.h
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface RssFeedItem : RLMObject

@property NSString *title;
@property NSString *idObject;
@property NSString *content;
@property NSString *summary;
@property NSDate *date;
@property NSString *urlRss;
@property NSString *link;

@end

NS_ASSUME_NONNULL_END
