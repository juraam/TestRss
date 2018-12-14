//
//  ListRssViewOutput.h
//	pricetags
//

@protocol ListRssViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)deleteRssItemWithId: (NSString *)idObject;

@end
