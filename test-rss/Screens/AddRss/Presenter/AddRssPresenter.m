//
//  AddRssPresenter.m
//	test-rss
//

#import "AddRssPresenter.h"
#import "AddRssViewInput.h"
#import "AddRssInteractorInput.h"
#import "AddRssModuleOutput.h"
#import "AddRssRouterInput.h"

@interface AddRssPresenter ()

@end

@implementation AddRssPresenter

- (void)configureModule
{
    [self.view configureView];
}

#pragma mark - <ModuleInput>

- (void)presentModuleFromController:(UIViewController *)viewController
{
    [self.router presentModuleFromController:viewController];
}

#pragma mark - <ViewOutput>

- (void)didTriggerViewReadyEvent
{
    [self.view setupInitialState];
}

- (void)addRssWithName:(NSString *)name url:(NSString *)url
{
    [self.interactor addRssWithName:name url:url];
}

#pragma mark - <InteractorOutput>

- (void)didAddedRssItem
{
    [self.router dismiss];
}

@end
