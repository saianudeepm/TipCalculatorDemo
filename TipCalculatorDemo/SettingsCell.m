//
//  SettingsCell.m
//  TipCalculatorDemo
//
//  Created by Sai Anudeep Machavarapu on 1/27/15.
//  Copyright (c) 2015 salome. All rights reserved.
//

#import "SettingsCell.h"

@implementation SettingsCell{

    NSInteger selectedIndex;
}


- (IBAction)onTipChanged:(id)sender {
    
    NSLog(@"tip changed to %ld",(long)self.defaultTipControl.selectedSegmentIndex);
     selectedIndex= self.defaultTipControl.selectedSegmentIndex;
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     [defaults setInteger:selectedIndex forKey:@"default_tip_percent"];
     [defaults synchronize];
    
}

- (void)awakeFromNib {
    // Initialization code
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    selectedIndex = [defaults integerForKey:@"default_tip_percent"];
    [self.defaultTipControl setSelectedSegmentIndex:selectedIndex];
    NSLog(@"Default selection for tip percent was %ld",selectedIndex);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
