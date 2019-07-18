//
//  SOMMSViewController.m
//  FooLib
//
//  Created by S0MMS on 07/17/2019.
//  Copyright (c) 2019 S0MMS. All rights reserved.
//

#import "SOMMSViewController.h"

//#import <FooLib/FooUtility.h>
//#import <FooLib/BarUtility.h>
@import FooLib;

@interface SOMMSViewController ()

@end

@implementation SOMMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // objc stuff
    [FooUtility classMethod];
    FooUtility *f = [[FooUtility alloc] init];
    [f instanceMethod];
    
    [BarUtility classMethod];
    BarUtility *b = [[BarUtility alloc] init];
    [b instanceMethod];
    
    // swift stuff
    [BazUtility classSlamStuff];
    BazUtility *baz = [[BazUtility alloc] init];
    [baz instantCramStuff];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
