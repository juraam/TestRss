//
//  NetworkStatus.m
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <AFNetworking.h>

#import "NetworkStatus.h"

@interface NetworkStatus ()

@property (assign, nonatomic) BOOL networkStatus;

@end

@implementation NetworkStatus

+ (instancetype)instance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];
        [reachability setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    self.networkStatus = YES;
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    self.networkStatus = YES;
                    break;
                case AFNetworkReachabilityStatusUnknown:
                    self.networkStatus = NO;
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    self.networkStatus = NO;
                    break;
                default:
                    break;
            }
        }];
        [reachability startMonitoring];
    }
    return self;
}

- (BOOL)isConnected
{
    return self.networkStatus;
}

@end
