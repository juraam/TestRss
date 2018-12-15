//
//  RssFeedInteractor.m
//	test-rss
//

#import "RssFeedInteractor.h"
#import "RssFeedInteractorOutput.h"
#import "RSSService.h"
#import "RssFeedViewModel.h"
#import "RssFeedItem.h"

@implementation RssFeedInteractor

#pragma mark - <InteractorInput>

- (void)loadRssFeed
{
    [RSSService loadRssFeed:self.url completion:^(NSArray * _Nonnull rssFeedItems, NSError * _Nonnull error) {
        if (error != nil) {
            [self.output didLoadWithError:error];
        }
        NSMutableArray *res = [NSMutableArray array];
        for (RssFeedItem *item in rssFeedItems) {
            RssFeedViewModel *viewModel = [[RssFeedViewModel alloc] initWithRssFeedItem:item];
            [res addObject:viewModel];
        }
        [self.output didLoadItems:res];
    }];
}

@end
