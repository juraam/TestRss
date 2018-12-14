//
//  AddRssInteractor.m
//	test-rss
//

#import "AddRssInteractor.h"
#import "AddRssInteractorOutput.h"
#import "RSSService.h"

@implementation AddRssInteractor

#pragma mark - <InteractorInput>

- (void)addRssWithName:(NSString *)name url:(NSString *)url
{
    [RSSService addRssItemWithUrl:url name:name];
    [self.output didAddedRssItem];
}

@end
