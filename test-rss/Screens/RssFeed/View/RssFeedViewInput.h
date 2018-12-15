//
//  RssFeedViewInput.h
//	test-rss
//

@protocol RssFeedViewInput <NSObject>

- (void)configureView;

- (void)setupInitialState;

- (void)showLoadingIndicator;

- (void)showError: (NSError *)error;

- (void)hideLoadingIndicator;

- (void)updateItems: (NSArray *)items;

- (UIViewController *)controller;

@end
