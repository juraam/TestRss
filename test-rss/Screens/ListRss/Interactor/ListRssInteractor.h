//
//  ListRssInteractor.h
//	pricetags
//

#import "ListRssInteractorInput.h"
@protocol ListRssInteractorOutput;

@interface ListRssInteractor : NSObject <ListRssInteractorInput>

@property (nonatomic, weak) id<ListRssInteractorOutput> output;

@end

