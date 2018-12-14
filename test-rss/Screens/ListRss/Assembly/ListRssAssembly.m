//
//  ListRssAssembly.m
//	pricetags
//

#import "ListRssAssembly.h"
#import "ListRssVC.h"
#import "ListRssInteractor.h"
#import "ListRssPresenter.h"
#import "ListRssRouter.h"
#import "UIViewController+Storyboard.h"

@implementation ListRssAssembly

+ (id <ListRssModuleInput>)createModule
{
    UINavigationController *navVC = (UINavigationController *)[UIViewController viewControllerWithStoryboardId:@"MainNavigation"];
    ListRssVC *view = navVC.viewControllers.firstObject;
    ListRssInteractor *interactor = [ListRssInteractor new];
    ListRssPresenter *presenter = [ListRssPresenter new];
    ListRssRouter *router = [ListRssRouter new];
    
    router.viewController = view;
    
    view.output = presenter;
    interactor.output = presenter;
    
    presenter.view = view;
    presenter.interactor = interactor;
    presenter.router = router;
    [presenter configureModule];
    
    return presenter;
}

@end
