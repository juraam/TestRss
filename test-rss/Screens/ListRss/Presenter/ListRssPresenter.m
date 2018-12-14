//
//  ListRssPresenter.m
//	pricetags
//

#import "ListRssPresenter.h"
#import "ListRssViewInput.h"
#import "ListRssInteractorInput.h"
#import "ListRssModuleOutput.h"
#import "ListRssRouterInput.h"

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

#pragma mark - <InteractorOutput>

- (void)didRssListLoaded:(NSArray *)rssList
{
    [self.view didRssListLoaded:rssList];
}



@end
