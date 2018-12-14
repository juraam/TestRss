//
//  ListRssVC.m
//	pricetags
//

#import "ListRssVC.h"
#import "ListRssViewOutput.h"
#import "RssItemCell.h"
#import "ListRssViewModel.h"

@interface ListRssVC () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *viewModels;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListRssVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.output didViewAppear];
}

#pragma mark - IBActions

- (IBAction)addAction:(id)sender
{
    [self.output addAction];
}


#pragma mark - <ViewInput>

- (UIViewController *)controller
{
    return self;
}

- (void)configureView
{
    
}

- (void)setupInitialState
{
}

- (void)didRssListLoaded:(NSArray *)rssList
{
    self.viewModels = [NSMutableArray arrayWithArray:rssList];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RssItemCell *cell = (RssItemCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLabel.text = [[self.viewModels objectAtIndex:indexPath.row] title];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ListRssViewModel *viewModel = [self.viewModels objectAtIndex:indexPath.row];
        [self.output deleteRssItemWithId:viewModel.idObject];
        [self.viewModels removeObject:viewModel];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
