//
//  SVBusinesPerson.m
//  TestNotification
//
//  Created by Viktor Siedov on 07.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVBusinesPerson.h"
#import "SVGovernment.h"
@import UIKit;

@implementation SVBusinesPerson

#pragma mark - initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tax = 0.f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(taxNotification:) name:SVGovernmentTaxNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(priceNotification:) name:SVGovernmentPriceNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    return self;
}

#pragma mark - NSNotification SVGovernment

-(void)taxNotification:(NSNotification *)notification{
    NSNumber *number = [(NSDictionary *)notification.userInfo objectForKey:SVGovernmentTaxUserInfoKey];
    CGFloat tax = number.floatValue;
    _tax = tax;
    [self calcStandartOfLiving:_price outcome:_tax];
}

-(void)priceNotification:(NSNotification *)notification{
    NSNumber *number = [(NSDictionary *)notification.userInfo objectForKey:SVGovernmentPriceUserInfoKey];
    CGFloat price = number.floatValue;
    _price = price;
    [self calcStandartOfLiving:_price outcome:_tax];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification{
    NSLog(@"Business man go to sleep");
}

-(void)applicationWillEnterForeground:(NSNotification *)notification{
    NSLog(@"Business man go to work");
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
    NSLog(@"%@ = %f", difference < 0 ? @"Busines: We unhappy and strike. We don't have money! (borrow)" : @"Busines: We happy and spend much money. (lend)",difference);
}

#pragma mark - dealloc

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
