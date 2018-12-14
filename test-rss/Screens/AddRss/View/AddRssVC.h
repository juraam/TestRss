//
//  AddRssVC.h
//	test-rss
//

#import "AddRssViewInput.h"
@protocol AddRssViewOutput;

@interface AddRssVC : UIViewController <AddRssViewInput>

@property (nonatomic, strong) id<AddRssViewOutput> output;

@end
