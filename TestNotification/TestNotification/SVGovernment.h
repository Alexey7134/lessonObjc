//
//  SVGovernment.h
//  TestNotification
//
//  Created by Viktor Siedov on 06.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

extern NSString *const SVGovernmentTaxNotification;
extern NSString *const SVGovernmentSalaryNotification;
extern NSString *const SVGovernmentPensionNotification;
extern NSString *const SVGovernmentPriceNotification;
extern NSString *const SVGovernmentInflationNotification;

extern NSString *const SVGovernmentTaxUserInfoKey;
extern NSString *const SVGovernmentSalaryUserInfoKey;
extern NSString *const SVGovernmentPensionUserInfoKey;
extern NSString *const SVGovernmentPriceUserInfoKey;
extern NSString *const SVGovernmentInflationUserInfoKey;

@interface SVGovernment : NSObject

@property(assign, nonatomic)CGFloat tax;
@property(assign, nonatomic)CGFloat salary;
@property(assign, nonatomic)CGFloat pension;
@property(assign, nonatomic)CGFloat price;
@property(assign, nonatomic)CGFloat inflation;


@end
