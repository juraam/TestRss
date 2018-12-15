//
//  RssFeedPresenter.m
//	test-rss
//

#import "RssFeedPresenter.h"
#import "RssFeedViewInput.h"
#import "RssFeedInteractorInput.h"
#import "RssFeedModuleOutput.h"
#import "RssFeedRouterInput.h"

@interface RssFeedPresenter ()

@end

@implementation RssFeedPresenter

- (void)configureModule
{
    [self.view configureView];
}

#pragma mark - <ModuleInput>

- (void)presentRssFeedModuleFromNavigationController:(UINavigationController *)nc
{
    [self.router presentRssFeedModuleFromNavigationController:nc];
}

#pragma mark - <ViewOutput>

- (void)didTriggerViewReadyEvent
{
    [self.view setupInitialState];
    [self.view showLoadingIndicator];
    [self.interactor loadRssFeed];
}

#pragma mark - <InteractorOutput>

- (void)didLoadItems:(NSArray *)items
{
    [self.view hideLoadingIndicator];
    [self.view updateItems:items];
}

- (void)didLoadWithError:(NSError *)error
{
    [self.view hideLoadingIndicator];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.view showError:error];
    });
}



@end
