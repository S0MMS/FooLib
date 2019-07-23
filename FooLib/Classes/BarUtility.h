//
//  BarUtility.h
//  Expecta
//
//  Created by chris1 on 7/17/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BarUtility : NSObject
- (void) instanceMethod;
+ (void) classMethod;

+ (void) setupNewRelic;
+ (void) dispatchNewRelicAnalytics;


+ (void) configureAdobe;
+ (void) diespatchAdobeAnalytics;

@end

NS_ASSUME_NONNULL_END
