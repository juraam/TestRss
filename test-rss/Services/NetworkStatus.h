//
//  NetworkStatus.h
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkStatus : NSObject

@property (readonly, nonatomic) BOOL isConnected;

+ (instancetype)instance;

@end

NS_ASSUME_NONNULL_END
