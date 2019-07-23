//
//  AnalyticsProvider.h
//  REI
//
//  Created by Chat fai geoffrey Mak on 3/20/17.
//  Copyright © 2017 REI. All rights reserved.
//

#ifndef AnalyticsProvider_h
#define AnalyticsProvider_h

//@class REICart, REIWishlist;

@protocol AnalyticsProvider
- (void)configureAnalytics;
- (void)clearAnalytics;
- (NSDictionary * _Nullable)getAnalyticsContextData;
// CKS: analytics cocoapod tweaks
//- (NSDictionary<NSString *, NSString *>* _Nonnull)getCartContextDataWithCart:(REICart* _Nullable)cart;
//- (NSDictionary<NSString *, NSString *>* _Nonnull)getSavedForLaterContextDataWithWishlist:(REIWishlist* _Nullable)s4l;
- (void)setAnalyticsChannel:(NSString * _Nonnull)channel;
- (void)setAnalyticsPageName:(NSString * _Nonnull)pageName;
- (void)setAnalyticsSubSection1:(NSString * _Nonnull)subSection1;
- (void)setAnalyticsSubSection2:(NSString * _Nonnull)subSection2;
- (void)setAnalyticsProductString:(NSString * _Nonnull)productString;
- (void)setAnalyticsTemplateType:(NSString * _Nonnull)templateType;
- (void)setAdditionalAnalyticsContextData:(NSDictionary<NSString*, NSString*>* _Nonnull)contextData;
- (void)updateAnalyticsWithDictionary:(NSDictionary<NSString *, NSString *> * _Nonnull)dictionary;
- (void)dispatchAnalyticsEvent;
- (void)dispatchAnalyticsEvent:(NSString * _Nonnull)eventName;
- (void)dispatchAnalyticsEvent:(NSString * _Nonnull)eventName contextData:(NSDictionary * _Nullable)contextData;
@end

#endif /* AnalyticsProvider_h */
