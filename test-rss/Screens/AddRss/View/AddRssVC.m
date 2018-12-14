//
//  AddRssVC.m
//	test-rss
//

#import <SCViewShaker/UIView+Shake.h>

#import "AddRssVC.h"
#import "AddRssViewOutput.h"

@interface AddRssVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation AddRssVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - IBActions

- (IBAction)addAction:(id)sender
{
    if (self.nameTextField.text.length == 0 || self.urlTextField.text.length == 0) {
        [self.nameTextField shake];
        [self.urlTextField shake];
        return;
    }
    [self.output addRssWithName:self.nameTextField.text url:self.urlTextField.text];
}


#pragma mark - <ViewInput>

- (void)configureView
{
    
}

- (void)setupInitialState
{
}

@end
