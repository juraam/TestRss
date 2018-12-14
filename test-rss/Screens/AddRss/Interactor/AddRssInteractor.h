//
//  AddRssInteractor.h
//	test-rss
//

#import "AddRssInteractorInput.h"
@protocol AddRssInteractorOutput;

@interface AddRssInteractor : NSObject <AddRssInteractorInput>

@property (nonatomic, weak) id<AddRssInteractorOutput> output;

@end

