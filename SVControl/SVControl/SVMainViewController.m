//
//  SVMainViewController.m
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"
#import "SVSliderSpeedView.h"


const NSString *SVLabelName = @"label";
const NSString *SVSwitchName = @"switch";
const NSInteger SVSwitchesMaxCount = 3;
const NSInteger SVRectDefault = 20;

@interface SVMainViewController (){
    CGFloat _speed;
}

@property(strong, nonatomic)SVSwitchAnimationView *rotationSwitchView;
@property(strong, nonatomic)SVSwitchAnimationView *scaleSwitchView;
@property(strong, nonatomic)SVSwitchAnimationView *translationSwitchView;
@property(strong, nonatomic)SVSliderSpeedView *sliderView;
@property(strong, nonatomic)UIView *settingsView;
@property(strong, nonatomic)UIView *changeView;

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.settingsView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    [self.settingsView  setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:self.settingsView];
    
    self.changeView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    [self.changeView  setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.changeView];
    
    //Create slider View
    self.sliderView = [[SVSliderSpeedView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    [self.settingsView addSubview:self.sliderView];
    
    //Create switches View
    self.rotationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.rotationSwitchView.delegate = self;
    self.rotationSwitchView.label.text = @"Enable rotation";
    [self.settingsView addSubview:self.rotationSwitchView];
    self.scaleSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.scaleSwitchView.delegate = self;
    self.scaleSwitchView.label.text = @"Enable scale";
    [self.settingsView addSubview:self.scaleSwitchView];
    self.translationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.translationSwitchView.delegate = self;
    self.translationSwitchView.label.text = @"Enable translation";
    [self.settingsView addSubview:self.translationSwitchView];
    
    [self disableMask:self.view];
    [self makeLayout];
}

#pragma mark - Layout

-(void)makeLayout{
    UILayoutGuide *margin = self.view.layoutMarginsGuide;

    [self.settingsView.topAnchor constraintEqualToAnchor:margin.topAnchor constant:CGRectGetHeight(margin.layoutFrame)/2].active = YES;
    [self.settingsView.bottomAnchor constraintEqualToAnchor:margin.bottomAnchor].active = YES;
    [self.settingsView.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
    [self.settingsView.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
    
    //add slider layout
    self.sliderView.backgroundColor = [UIColor yellowColor];
    [self.sliderView.topAnchor constraintEqualToAnchor:self.settingsView.topAnchor].active = YES;
    [self.sliderView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.sliderView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche rotation
    self.rotationSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.rotationSwitchView.topAnchor constraintEqualToAnchor:self.sliderView.bottomAnchor].active = YES;
    [self.rotationSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.rotationSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche rotation
    self.scaleSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.scaleSwitchView.topAnchor constraintEqualToAnchor:self.rotationSwitchView.bottomAnchor].active = YES;
    [self.scaleSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.scaleSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche rotation
    self.translationSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.translationSwitchView.topAnchor constraintEqualToAnchor:self.scaleSwitchView.bottomAnchor].active = YES;
    [self.translationSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.translationSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
}

#pragma mark - Private functions

-(void)disableMask:(UIView *)view{
    for (UIView *childView in view.subviews) {
        childView.translatesAutoresizingMaskIntoConstraints = NO;
        if ([childView.subviews count] > 0 &&
            ![childView isKindOfClass:[UISwitch class]]) {
            [self disableMask:childView];
        }
    }
}

-(void)makeSettingViewsWithSwitchAndLabel{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (NSInteger index = 0; index < SVSwitchesMaxCount; index++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        [dictionary setObject:label forKey:[NSString stringWithFormat:@"label%li",index]];
    }
}


#pragma mark - Actions

-(void)actionSliderSpeedChanged:(UISlider *)sender{

    
}

-(void)actionSwitchChanged:(UISwitch *)sender{
    
}

@end
