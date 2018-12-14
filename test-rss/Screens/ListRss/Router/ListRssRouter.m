//
//  ListRssRouter.m
//	pricetags
//

#import "ListRssRouter.h"
#import "ListRssPresenter.h"

@interface ListRssRouter ()

@end

@implementation ListRssRouter

//- (void)presentListRssModuleFromNavigationController:(UINavigationController *)nc
//{
//    self.presentedController = nc;
//    nc.viewControllers = @[self.viewController];
//}
//
- (void)presentRootNavigationModuleFromWindow:(UIWindow *)window
{
    [window setRootViewController:self.viewController.navigationController];
    [window makeKeyAndVisible];
}

@end
