//
//  AddRssPresenter.h
//	test-rss
//

#import "AddRssViewOutput.h"
#import "AddRssInteractorOutput.h"
#import "AddRssModuleInput.h"

@protocol AddRssViewInput;
@protocol AddRssInteractorInput;
@protocol AddRssRouterInput;
@protocol AddRssModuleOutput;

@interface AddRssPresenter : NSObject <AddRssInteractorOutput, AddRssModuleInput, AddRssViewOutput>

@property (nonatomic, weak) id <AddRssViewInput> view;
@property (nonatomic, strong) id <AddRssInteractorInput> interactor;
@property (nonatomic, strong) id <AddRssRouterInput> router;
@property (nonatomic, weak) id <AddRssModuleOutput> output;

- (void)configureModule;

@end
