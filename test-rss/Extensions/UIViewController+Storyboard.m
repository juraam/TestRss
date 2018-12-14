//
//  UIViewController+Storyboard.m
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (UIViewController *)viewControllerWithStoryboardId: (NSString *)idController
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:idController];
    return vc;
}

@end
