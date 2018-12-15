//
//  RssFeedVC.m
//	test-rss
//

#import "RssFeedVC.h"
#import "RssFeedViewOutput.h"
#import "RssFeedCell.h"
#import "RssFeedViewModel.h"
#import "ProgressHUD.h"

@interface RssFeedVC () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RssFeedVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - <ViewInput>

- (void)configureView
{
    
}

- (void)setupInitialState
{
}

- (void)showError:(NSError *)error
{
    [ProgressHUD showError:@"Что-то пошло не так..." Interaction:YES];
}

- (void)showLoadingIndicator
{
    [ProgressHUD show];
}

- (void)hideLoadingIndicator
{
    [ProgressHUD dismiss];
}

- (void)updateItems:(NSArray *)items
{
    self.items = items;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RssFeedCell *cell = (RssFeedCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell updateWithViewModel:[self.items objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
