//
//  AddRssAssembly.m
//	test-rss
//

#import "AddRssAssembly.h"
#import "AddRssVC.h"
#import "AddRssInteractor.h"
#import "AddRssPresenter.h"
#import "AddRssRouter.h"
#import "UIViewController+Storyboard.h"

@implementation AddRssAssembly

+ (id <AddRssModuleInput>)createModule
{
    AddRssVC *view = (AddRssVC *)[UIViewController viewControllerWithStoryboardId:@"AddRss"];
    AddRssInteractor *interactor = [AddRssInteractor new];
    AddRssPresenter *presenter = [AddRssPresenter new];
    AddRssRouter *router = [AddRssRouter new];
    
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
