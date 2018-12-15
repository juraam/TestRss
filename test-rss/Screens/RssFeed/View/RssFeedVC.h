//
//  RssFeedVC.h
//	test-rss
//

#import "RssFeedViewInput.h"
@protocol RssFeedViewOutput;

@interface RssFeedVC : UIViewController <RssFeedViewInput>

@property (nonatomic, strong) id<RssFeedViewOutput> output;

@end
