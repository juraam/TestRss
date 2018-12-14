//
//  ListRssViewModel.m
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "ListRssViewModel.h"
#import "RssItem.h"

@implementation ListRssViewModel

- (instancetype)initWithRssItem:(RssItem *)rssItem
{
    self = [super init];
    if (self) {
        self.title = rssItem.title;
        self.url = rssItem.url;
        self.idObject = rssItem.idObject;
    }
    return self;
}

@end
