//
//  ListRssPresenter.h
//	pricetags
//

#import "ListRssViewOutput.h"
#import "ListRssInteractorOutput.h"
#import "ListRssModuleInput.h"

@protocol ListRssViewInput;
@protocol ListRssInteractorInput;
@protocol ListRssRouterInput;
@protocol ListRssModuleOutput;

@interface ListRssPresenter : NSObject <ListRssInteractorOutput, ListRssModuleInput, ListRssViewOutput>

@property (nonatomic, strong) id <ListRssViewInput> view;
@property (nonatomic, strong) id <ListRssInteractorInput> interactor;
@property (nonatomic, strong) id <ListRssRouterInput> router;
@property (nonatomic, weak) id <ListRssModuleOutput> output;

- (void)configureModule;

@end
