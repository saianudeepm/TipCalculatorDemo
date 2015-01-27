//
//  TipViewController.m
//  TipCalculatorDemo
//
//  Created by Sai Anudeep Machavarapu on 1/20/15.
//  Copyright (c) 2015 salome. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipContorl;

- (IBAction)onTap:(id)sender;
- (void) updateValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger selectedIndex = [defaults integerForKey:@"default_tip_percent"];
    [self.tipContorl setSelectedSegmentIndex:selectedIndex];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)updateValues{

    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.2), @(0.3)];
    float tipAmount = billAmount * [tipValues[self.tipContorl.selectedSegmentIndex] floatValue];
    float total = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"%0.2f", total];
    
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
