//
//  SVPensionPerson.m
//  TestNotification
//
//  Created by Viktor Siedov on 07.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVPensionPerson.h"
#import "SVGovernment.h"
@import UIKit;


@implementation SVPensionPerson

#pragma mark - initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pension = 0.f;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pensionNotification:) name:SVGovernmentPensionNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(priceNotification:) name:SVGovernmentPriceNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationWillTerminateNotification object:nil];
    }
    return self;
}

#pragma mark - NSNotification SVGovernment

-(void)pensionNotification:(NSNotification *)notification{
    NSNumber *number = [(NSDictionary *)notification.userInfo objectForKey:SVGovernmentPensionUserInfoKey];
    CGFloat pension = number.floatValue;
    
    _pension = pension;
    [self calcStandartOfLiving:_pension outcome:_price];
}

-(void)priceNotification:(NSNotification *)notification{
    NSNumber *number = [(NSDictionary *)notification.userInfo objectForKey:SVGovernmentPriceUserInfoKey];
    CGFloat price = number.floatValue;
    _influention = [self calcInfluentionStartPrice:_price nextPrice:price];
    _price = price;
    [self calcStandartOfLiving:_pension outcome:_price];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification{
    NSLog(@"Pension go to sleep");
}

#pragma mark - calculate function

-(CGFloat)calcInfluentionStartPrice:(CGFloat)startPrice nextPrice:(CGFloat)nextPrice{
    if (startPrice == 0 ||
        nextPrice == 0) {
        return 0;
    }
    CGFloat influentioin = ((startPrice - nextPrice)/nextPrice) *100;
   // NSLog(@"%@ = %f%%", influentioin < 0 ? @"influention" : @"deinfluention",influentioin);
    return influentioin;
}

-(void)calcStandartOfLiving:(CGFloat)income outcome:(CGFloat)outcome{
    if (income == 0 ||
        outcome == 0) {
        return;
    }
    CGFloat difference = income - outcome;
    NSLog(@"%@ = %f", difference < 0 ? @"Pension: We unhappy and strike. We don't have money! (borrow)" : @"Pension: We happy and spend much money. (lend)",difference);
}

#pragma mark - dealloc

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
