//
//  AddRssViewOutput.h
//	test-rss
//

@protocol AddRssViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)addRssWithName: (NSString *)name url: (NSString *)url;

@end
