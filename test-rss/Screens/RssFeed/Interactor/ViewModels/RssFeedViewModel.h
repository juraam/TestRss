//
//  RssFeedViewModel.h
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RssFeedItem;

NS_ASSUME_NONNULL_BEGIN

@interface RssFeedViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSString *idObject;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSDate *date;

- (instancetype)initWithRssFeedItem: (RssFeedItem *)rssFeedItem;

@end

NS_ASSUME_NONNULL_END
