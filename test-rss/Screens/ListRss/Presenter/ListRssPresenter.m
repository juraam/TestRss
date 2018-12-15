//
//  ListRssPresenter.m
//	pricetags
//

#import "ListRssPresenter.h"
#import "ListRssViewInput.h"
#import "ListRssInteractorInput.h"
#import "ListRssModuleOutput.h"
#import "ListRssRouterInput.h"
#import "AddRssAssembly.h"
#import "RssFeedAssembly.h"

@interface ListRssPresenter ()

@end

@implementation ListRssPresenter

- (void)configureModule
{
    [self.view configureView];
}

#pragma mark - <ModuleInput>

- (void)presentRootNavigationModuleFromWindow:(UIWindow *)window
{
    [self.router presentRootNavigationModuleFromWindow:window];
}

#pragma mark - <ViewOutput>

- (void)deleteRssItemWithId:(NSString *)idObject
{
    [self.interactor deleteRssItemWithId:idObject];
}

- (void)didTriggerViewReadyEvent
{
    [self.view setupInitialState];
    [self.interactor loadRssList];
}

- (void)didSelectViewModelWithUrl:(NSString *)url
{
    NSObject<RssFeedModuleInput> *input = [RssFeedAssembly createModuleWithUrl: url];
    [input presentRssFeedModuleFromNavigationController:self.view.controller.navigationController];
}

- (void)didViewAppear
{
    [self.interactor loadRssList];
}

- (void)addAction
{
    NSObject<AddRssModuleInput> *input = [AddRssAssembly createModule];
    [input presentModuleFromController:self.view.controller];
}

#pragma mark - <InteractorOutput>

- (void)didRssListLoaded:(NSArray *)rssList
{
    [self.view didRssListLoaded:rssList];
}



@end
