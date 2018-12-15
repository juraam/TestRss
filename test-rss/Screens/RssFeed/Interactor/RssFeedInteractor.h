//
//  RssFeedInteractor.h
//	test-rss
//

#import "RssFeedInteractorInput.h"
@protocol RssFeedInteractorOutput;

@interface RssFeedInteractor : NSObject <RssFeedInteractorInput>

@property (nonatomic, weak) id<RssFeedInteractorOutput> output;
@property (strong, nonatomic) NSString *url;

@end

