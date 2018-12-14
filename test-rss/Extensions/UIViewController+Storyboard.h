//
//  UIViewController+Storyboard.h
//  test-rss
//
//  Created by Jura Moshkov on 14/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Storyboard)

+ (UIViewController*)viewControllerWithStoryboardId: (NSString *)idController;

@end

NS_ASSUME_NONNULL_END
