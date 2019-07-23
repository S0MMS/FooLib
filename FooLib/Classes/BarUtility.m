//
//  BarUtility.m
//  Expecta
//
//  Created by chris1 on 7/17/19.
//

#import "BarUtility.h"

#import <NewRelicAgent/NewRelic.h>

#import "ACPCore.h"
#import "ACPAnalytics.h"
#import "ACPIdentity.h"

@implementation BarUtility

- (void) instanceMethod {
    NSLog(@"instance");
}

+ (void) classMethod {
    NSLog(@"classssss method");
    [NewRelicAgent startWithApplicationToken:@"AA20f451bc102b114645689092c95bb597146165c4"];
}

+ (void) setupNewRelic {
    [NewRelicAgent startWithApplicationToken:@"AA20f451bc102b114645689092c95bb597146165c4"];
}

+ (void) dispatchNewRelicAnalytics
{
    [NewRelic startInteractionWithName:@"bams!"];
}

+ (void) configureAdobe {
    [ACPCore configureWithAppId:@"yourAppId"];
    [ACPAnalytics registerExtension];
    [ACPIdentity registerExtension];
    [ACPCore start:nil];
}

+ (void) diespatchAdobeAnalytics
{
    //create a context data dictionary
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    
    // add products, a purchase id, a purchase context data key, and any other data you want to collect.
    // Note the special syntax for products
    [contextData setObject:@";Running Shoes;1;69.95,;Running Socks;10;29.99" forKey:@"&&products"];
    [contextData setObject:@"1234567890" forKey:@"m.purchaseid"];
    [contextData setObject:@"1" forKey:@"m.purchase"];
    
    // send the tracking call - use either a trackAction or TrackState call.
    // trackAction example:
    [ACPCore trackAction:@"purchase" data:contextData];
    // trackState example:
    [ACPCore trackState:@"Order Confirmation" data:contextData];
    
    NSLog(@"analytics sent");
}


@end
