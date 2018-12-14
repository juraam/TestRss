//
//  ListRssInteractor.m
//	pricetags
//

#import "ListRssInteractor.h"
#import "ListRssInteractorOutput.h"

#import "RSSService.h"
#import "RssItem.h"
#import "ListRssViewModel.h"

@implementation ListRssInteractor

#pragma mark <InteractorInput>

- (void)loadRssList
{
    NSArray *listModels = [RSSService listRssItems];
    NSMutableArray *list = [NSMutableArray array];
    for (RssItem *item in listModels) {
        [list addObject:[[ListRssViewModel alloc] initWithRssItem:item]];
    }
    [self.output didRssListLoaded:list];
}

- (void)deleteRssItemWithId:(NSString *)idObject
{
    [RSSService deleteRssItemWithId:idObject];
}

@end
