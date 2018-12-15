//
//  RssFeedCell.m
//  test-rss
//
//  Created by Jura Moshkov on 15/12/2018.
//  Copyright © 2018 Jura Moshkov. All rights reserved.
//

#import "RssFeedCell.h"
#import "RssFeedViewModel.h"

@interface RssFeedCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation RssFeedCell

- (void)updateWithViewModel: (RssFeedViewModel *)viewModel
{
    self.titleLabel.text = viewModel.title;
    self.summaryLabel.text = viewModel.summary;
    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:viewModel.date
                                                         dateStyle:NSDateFormatterShortStyle
                                                         timeStyle:NSDateFormatterNoStyle];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
