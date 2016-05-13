//
//  SVdoctor.m
//  TestNotification
//
//  Created by Viktor Siedov on 07.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVdoctor.h"
#import "SVGovernment.h"

@implementation SVdoctor

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
        _salary = 0.f;
        _price = 0.f;
    }
    return self;
}

-(void)initialization{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(salaryNotification:) name:SVGovernmentSalaryNotification object:nil];
    [nc addObserver:self selector:@selector(priceNotification:) name:SVGovernmentPriceNotification object:nil];
}

#pragma mark - Notification

-(void)salaryNotification:(NSNotification *)notification{
    
    NSDictionary *dictionary = notification.userInfo;
    
    CGFloat salary = [(NSNumber *)[dictionary objectForKey:SVGovernmentSalaryUserInfoKey] floatValue];
    
    _salary = salary;
    
    [self calcStandartOfLiving:_salary outcome:_price];
}

-(void)priceNotification:(NSNotification *)notification{
    NSDictionary *dictionary = notification.userInfo;
    CGFloat price = [(NSNumber *)[dictionary objectForKey:SVGovernmentPriceUserInfoKey] floatValue];
    _influention = [self calcInfluentionStartPrice:_price nextPrice:price];
    _price = price;
    
    [self calcStandartOfLiving:_salary outcome:_price];
}

#pragma mark - calculate function
-(CGFloat)calcInfluentionStartPrice:(CGFloat)startPrice nextPrice:(CGFloat)nextPrice{
    if (startPrice == 0 ||
        nextPrice == 0) {
        return 0;
    }
    CGFloat influentioin = ((startPrice - nextPrice)/nextPrice) *100;
    NSLog(@"%@ = %f%%", influentioin < 0 ? @"influention" : @"deinfluention",influentioin);
    return influentioin;
}

-(void)calcStandartOfLiving:(CGFloat)income outcome:(CGFloat)outcome{
    if (income == 0 ||
        outcome == 0) {
        return;
    }
    CGFloat difference = income - outcome;
    NSLog(@"%@ = %f", difference < 0 ? @"Doctor: We unhappy and strike. We don't have money! (borrow)" : @"Doctor: We happy and spend much money. (lend)",difference);
}

#pragma mark - dealloc

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
