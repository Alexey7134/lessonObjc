//
//  SVSwitchAnimationView.m
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVSwitchAnimationView.h"
@interface SVSwitchAnimationView()

@end

@implementation SVSwitchAnimationView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.switchView = [[UISwitch alloc]  initWithFrame:CGRectZero];
        [self.switchView addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.switchView];
        
        self.label = [[UILabel alloc]  initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.label.text = @"Example Switch";
        [self addSubview:self.label];
        
        [self makeLayout];
    }
    return self;
}

#pragma mark - Autolayout
-(void)makeLayout{
    
    CGFloat offSet = 5;
    self.switchView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.switchView.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.leadingAnchor].active = YES;
    [self.switchView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-offSet].active = YES;
    [self.switchView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.switchView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5].active = YES;
    [self.label.trailingAnchor constraintGreaterThanOrEqualToAnchor:self.trailingAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}

#pragma mark - Action

-(void)action:(UISwitch*)sender{
    [self.delegate actionSwitchChanged:sender];
}

#pragma mark - Private function

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.f;
}

@end
