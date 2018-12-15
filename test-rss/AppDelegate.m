//
//  AppDelegate.m
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "AppDelegate.h"
#import "ListRssAssembly.h"
#import "ListRssModuleInput.h"
#import "RSSService.h"
#import "NetworkStatus.h"

static NSString *const kAddedTemplateItems = @"kAddedTemplateItems";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect rect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:rect];
    [self addTemplateRssItemsIfNeed];
    [NetworkStatus instance];
    NSObject <ListRssModuleInput> *input = [ListRssAssembly createModule];
    [input presentRootNavigationModuleFromWindow: self.window];
    // Override point for customization after application launch.
    return YES;
}

- (void)addTemplateRssItemsIfNeed
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:kAddedTemplateItems] == nil) {
        [defaults setBool:YES forKey:kAddedTemplateItems];
        [RSSService addRssItemWithUrl:@"https://www.yahoo.com/news/rss/sports" name:@"Yahoo sport"];
        [RSSService addRssItemWithUrl:@"http://www.nba.com/rss/nba_rss.xml" name:@"NBA sport"];
        [RSSService addRssItemWithUrl:@"http://www.nfl.com/rss/rsslanding?searchString=home" name:@"NFL sport"];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
