//
//  RssFeedAssembly.h
//	test-rss
//

#import "RssFeedModuleInput.h"

@interface RssFeedAssembly : NSObject

+ (id <RssFeedModuleInput>)createModuleWithUrl: (NSString *)url;

@end
