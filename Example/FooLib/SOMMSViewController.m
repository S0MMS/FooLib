//
//  SOMMSViewController.m
//  FooLib
//
//  Created by S0MMS on 07/17/2019.
//  Copyright (c) 2019 S0MMS. All rights reserved.
//

#import "SOMMSViewController.h"

#import <FooLib/FooUtility.h>
#import <FooLib/BarUtility.h>

@interface SOMMSViewController ()

@end

@implementation SOMMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [FooUtility classMethod];
    FooUtility *f = [[FooUtility alloc] init];
    [f instanceMethod];
    
    
    [BarUtility classMethod];
    BarUtility *b = [[BarUtility alloc] init];
    [b instanceMethod];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
