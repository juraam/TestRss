//
//  RssFeedRouter.m
//	test-rss
//

#import "RssFeedRouter.h"
#import "RssFeedPresenter.h"

@interface RssFeedRouter ()

@end

@implementation RssFeedRouter

- (void)presentRssFeedModuleFromNavigationController:(UINavigationController *)nc
{
    [nc pushViewController:self.viewController animated:YES];
}

@end
