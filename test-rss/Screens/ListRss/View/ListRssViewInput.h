//
//  ListRssViewInput.h
//	pricetags
//

@protocol ListRssViewInput <NSObject>

- (void)configureView;

- (void)setupInitialState;

- (void)didRssListLoaded: (NSArray *)rssList;

@end
