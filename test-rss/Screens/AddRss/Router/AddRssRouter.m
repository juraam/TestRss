//
//  AddRssRouter.m
//	test-rss
//

#import "AddRssRouter.h"
#import "AddRssPresenter.h"

@interface AddRssRouter ()

@end

@implementation AddRssRouter

- (void)dismiss
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentModuleFromController: (UIViewController *)viewController
{
    [viewController presentViewController:self.viewController animated:YES completion:nil];
}

@end
