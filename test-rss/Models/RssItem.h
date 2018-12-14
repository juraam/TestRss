//
//  RssItem.h
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

@interface RssItem : RLMObject

@property NSString *title;
@property NSString *url;
@property NSString *idObject;

@end

NS_ASSUME_NONNULL_END
