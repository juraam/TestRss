//
//  RssFeedCell.h
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RssFeedViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface RssFeedCell : UITableViewCell

- (void)updateWithViewModel: (RssFeedViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
