//
//  ListRssViewOutput.h
//	pricetags
//

@protocol ListRssViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)didViewAppear;

- (void)deleteRssItemWithId: (NSString *)idObject;

- (void)didSelectViewModelWithUrl: (NSString *)url;

- (void)addAction;

@end
