//
//  RssFeedViewModel.m
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "RssFeedViewModel.h"
#import "RssFeedItem.h"

@implementation RssFeedViewModel

- (instancetype)initWithRssFeedItem: (RssFeedItem *)rssFeedItem
{
    self = [super init];
    if (self) {
        self.title = rssFeedItem.title;
        self.content = rssFeedItem.content;
        self.idObject = rssFeedItem.idObject;
        self.summary = rssFeedItem.summary;
        self.link = rssFeedItem.link;
        self.date = rssFeedItem.date;
    }
    return self;
}

@end
