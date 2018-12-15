//
//  RssFeedInteractorOutput.h
//	test-rss
//

@protocol RssFeedInteractorOutput <NSObject>

- (void)didLoadWithError: (NSError *)error;

- (void)didLoadItems: (NSArray *)items;

@end
