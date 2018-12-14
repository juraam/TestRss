//
//  ListRssInteractorInput.h
//	pricetags
//

@protocol ListRssInteractorInput <NSObject>

- (void)loadRssList;

- (void)deleteRssItemWithId:(NSString *)idObject;

@end
