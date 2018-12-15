//
//  RssFeedViewOutput.h
//	test-rss
//

@protocol RssFeedViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)didSelectViewModel: (id)viewModel;

@end
