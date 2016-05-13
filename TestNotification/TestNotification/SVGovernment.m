//
//  SVGovernment.m
//  TestNotification
//
//  Created by Viktor Siedov on 06.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVGovernment.h"

NSString *const SVGovernmentTaxNotification = @"SVGovernmentTaxNotification";
NSString *const SVGovernmentSalaryNotification = @"SVGovernmentSalaryNotification";
NSString *const SVGovernmentPensionNotification = @"SVGovernmentPensionNotification";
NSString *const SVGovernmentPriceNotification = @"SVGovernmentPriceNotification";
NSString *const SVGovernmentInflationNotification = @"SVGovernmentInflationNotification";


NSString *const SVGovernmentTaxUserInfoKey = @"SVGovernmentTaxUserInfoKey";
NSString *const SVGovernmentSalaryUserInfoKey = @"SVGovernmentSalaryUserInfoKey";
NSString *const SVGovernmentPensionUserInfoKey = @"SVGovernmentPensionUserInfoKey";
NSString *const SVGovernmentPriceUserInfoKey = @"SVGovernmentPriceUserInfoKey";
NSString *const SVGovernmentInflationUserInfoKey = @"SVGovernmentInflationUserInfoKey";

@interface SVGovernment ()


@end

@implementation SVGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _salary = 1300.f;
        _tax = 600.f;
        _pension = 1100.f;
        _price = 500.f;
    }
    return self;
}

-(void)setTax:(CGFloat)tax{
    _tax = tax;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:tax] forKey:SVGovernmentTaxUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SVGovernmentTaxNotification object:nil userInfo:dictionary];
}

-(void)setSalary:(CGFloat)salary{
    _salary = salary;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:SVGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SVGovernmentSalaryNotification object:nil userInfo:dictionary];
}

-(void)setPension:(CGFloat)pension{
    _pension = pension;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:SVGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SVGovernmentPensionNotification object:nil userInfo:dictionary];
}

-(void)setPrice:(CGFloat)price{
    _price = price;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:price] forKey:SVGovernmentPriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SVGovernmentPriceNotification object:nil userInfo:dictionary];
}

@end
