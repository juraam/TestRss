//
//  ListRssViewModel.h
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RssItem;

NS_ASSUME_NONNULL_BEGIN

@interface ListRssViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *idObject;

- (instancetype)initWithRssItem: (RssItem *)rssItem;

@end

NS_ASSUME_NONNULL_END
