//
//  RssFeedPresenter.h
//	test-rss
//

#import "RssFeedViewOutput.h"
#import "RssFeedInteractorOutput.h"
#import "RssFeedModuleInput.h"

@protocol RssFeedViewInput;
@protocol RssFeedInteractorInput;
@protocol RssFeedRouterInput;
@protocol RssFeedModuleOutput;

@interface RssFeedPresenter : NSObject <RssFeedInteractorOutput, RssFeedModuleInput, RssFeedViewOutput>

@property (nonatomic, weak) id <RssFeedViewInput> view;
@property (nonatomic, strong) id <RssFeedInteractorInput> interactor;
@property (nonatomic, strong) id <RssFeedRouterInput> router;
@property (nonatomic, weak) id <RssFeedModuleOutput> output;

- (void)configureModule;

@end
