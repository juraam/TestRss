//
//  ListRssVC.h
//	pricetags
//

#import "ListRssViewInput.h"

@protocol ListRssViewOutput;

@interface ListRssVC : UIViewController <ListRssViewInput>

@property (nonatomic, weak) id<ListRssViewOutput> output;

@end
