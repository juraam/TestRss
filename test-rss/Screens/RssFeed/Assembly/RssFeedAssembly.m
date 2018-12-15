//
//  RssFeedAssembly.m
//	test-rss
//

#import "RssFeedAssembly.h"
#import "RssFeedVC.h"
#import "RssFeedInteractor.h"
#import "RssFeedPresenter.h"
#import "RssFeedRouter.h"
#import "UIViewController+Storyboard.h"

@implementation RssFeedAssembly

+ (id<RssFeedModuleInput>)createModuleWithUrl:(NSString *)url
{
    RssFeedVC *view = (RssFeedVC *)[UIViewController viewControllerWithStoryboardId:@"RssFeed"];
    RssFeedInteractor *interactor = [RssFeedInteractor new];
    interactor.url = url;
    RssFeedPresenter *presenter = [RssFeedPresenter new];
    RssFeedRouter *router = [RssFeedRouter new];
    
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
