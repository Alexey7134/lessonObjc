//
//  SVSliderSpeedView.m
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVSliderSpeedView.h"

@implementation SVSliderSpeedView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.sliderView = [[UISlider alloc]  initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self.sliderView addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
        self.sliderView.minimumValue = 0.5f;
        self.sliderView.maximumValue = 2.f;
        self.sliderView.value = 1.f;
        [self addSubview:self.sliderView];
        
        self.label = [[UILabel alloc]  initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.label.text = [NSString stringWithFormat:@"Speed Animation: %1.2f", self.sliderView.value];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.sliderView addSubview:self.label];
        
        [self makeLayout];
    }
    return self;
}

#pragma mark - Autolayout
-(void)makeLayout{
    CGFloat heightLabel = CGRectGetHeight(self.label.frame);
    CGFloat heightSlider = CGRectGetHeight(self.sliderView.frame);
    
    self.sliderView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat offSet = 5.f;//because when round shot edge super view happen error
    [self.sliderView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:offSet].active = YES;
    [self.sliderView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-offSet].active = YES;
    [self.sliderView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label.leadingAnchor constraintEqualToAnchor:self.sliderView.leadingAnchor].active = YES;
    [self.label.trailingAnchor constraintEqualToAnchor:self.sliderView.trailingAnchor].active = YES;
    [self.label.centerXAnchor constraintEqualToAnchor:self.sliderView.centerXAnchor].active = YES;
    [self.label.topAnchor constraintEqualToAnchor:self.sliderView.topAnchor].active = YES;
    [self.label.bottomAnchor constraintEqualToAnchor:self.sliderView.bottomAnchor constant:-heightSlider*2].active = YES;

    
    [self.sliderView.heightAnchor constraintEqualToConstant:heightLabel + heightSlider *2].active = YES;
    [self.heightAnchor constraintEqualToConstant:heightLabel + heightSlider *2].active = YES;
}

#pragma mark - Action

-(void)action:(UISlider*)sender{
    float floatValue = roundf(sender.value * 100)/100;
    self.label.text = [NSString stringWithFormat:@"Speed Animation: %1.2f", floatValue];
    [self.delegate actionSliderChanged:sender];
}

#pragma mark - Private function

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.f;
}


@end
