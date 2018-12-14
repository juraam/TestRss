//
//  ListRssVC.h
//	pricetags
//

#import "ListRssViewInput.h"

@protocol ListRssViewOutput;

@interface ListRssVC : UIViewController <ListRssViewInput>

@property (nonatomic, strong) id<ListRssViewOutput> output;

@end
