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
    
    self.changeView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    [self.changeView  setBackgroundColor:[UIColor redColor]];
    
    self.rotationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.rotationSwitchView.delegate = self;
    self.scaleSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.scaleSwitchView.delegate = self;
    self.translationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.translationSwitchView.delegate = self;
    
    self.sliderView = [[SVSliderSpeedView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    
    
    
    
    
    
    
//    changedView.layer.borderColor = [UIColor grayColor].CGColor;
//    changedView.layer.borderWidth = 1.f;
    
//     UIView *changeView = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 100, 100)];
//    [changeView setBackgroundColor:[UIColor orangeColor]];
//    [self.view addSubview:changeView];
//    [dictionary setObject:changeView forKey:@"changeView"];
//
//    UIView *settingsView = [[UIView alloc] initWithFrame:CGRectMake(40, 200, 100, 100)];
//    [settingsView setBackgroundColor:[UIColor brownColor]];
//    [self.view addSubview:settingsView];
//    [dictionary setObject:settingsView forKey:@"settingsView"];
//
//    UIView *switchesView = [[UIView alloc] initWithFrame:CGRectMake(40, 300, 100, 100)];
//    [switchesView setBackgroundColor:[UIColor blueColor]];
//    [settingsView addSubview:switchesView];
//    [dictionary setObject:switchesView forKey:@"switchesView"];
//
//    self.viewsDictionary = dictionary;
//
//    [self createSwitches:switchesView];
//    [self createSlider:settingsView];
    
    [self disableMask:self.view];
    [self makeLayout];
}
//-(void)createSlider:(UIView *)parentView{
//    self.speedSlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 300, 250, 50)];
//    [self.speedSlider addTarget:self action:@selector(actionSliderSpeedChanged:) forControlEvents:UIControlEventValueChanged];
//    self.speedSlider.minimumValue = 0.5f;
//    self.speedSlider.maximumValue = 2.f;
//    self.speedSlider.value = 1.f;
//    [parentView addSubview:self.speedSlider];
//}

//-(void)createSwitches:(UIView *)parentView{
//    self.rotationSwitch = [[UISwitch alloc]  initWithFrame:CGRectZero];
//    [self.rotationSwitch addTarget:self action:@selector(actionSwitchChanged:) forControlEvents:UIControlEventValueChanged];
//    [parentView addSubview:self.rotationSwitch];
//
//    self.scaleSwitch = [[UISwitch alloc]  initWithFrame:CGRectZero];
//    [self.scaleSwitch addTarget:self action:@selector(actionSwitchChanged:) forControlEvents:UIControlEventValueChanged];
//    [parentView addSubview:self.scaleSwitch];
//
//    self.translationSwitch = [[UISwitch alloc]  initWithFrame:CGRectZero];
//    [self.translationSwitch addTarget:self action:@selector(actionSwitchChanged:) forControlEvents:UIControlEventValueChanged];
//    [parentView addSubview:self.translationSwitch];
//}

#pragma mark - Layout

-(void)makeLayout{
    UILayoutGuide *margin = self.view.layoutMarginsGuide;
    
    //UIView *settingsView = [self.viewsSetter valueForKey:@"settingsView"];
//    UIView *settingsView = [self ]
//    [settingsView.topAnchor constraintEqualToAnchor:margin.topAnchor constant:CGRectGetHeight(margin.layoutFrame)/2].active = YES;
//    [settingsView.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
//    [settingsView.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
//    [settingsView.bottomAnchor constraintEqualToAnchor:margin.bottomAnchor].active = YES;
    
    //layout in settingsView
//    UIView *switchesView = [self.viewsSetter valueForKey:@"switchesView"];
//    [switchesView.topAnchor constraintGreaterThanOrEqualToAnchor:settingsView.topAnchor constant:0].active = YES;
//    [switchesView.leadingAnchor constraintEqualToAnchor:settingsView.leadingAnchor].active = YES;
//    [switchesView.trailingAnchor constraintEqualToAnchor:settingsView.trailingAnchor].active = YES;
//    [switchesView.bottomAnchor constraintEqualToAnchor:self.speedSlider.topAnchor constant:-20].active = YES;
//    [switchesView.heightAnchor constraintEqualToConstant:CGRectGetHeight(self.rotationSwitch.frame)].active = YES;
   
    

   // [self.speedSlider.topAnchor constraintEqualToAnchor:self.switchesView.bottomAnchor constant:40].active = YES;
//    [self.speedSlider.leadingAnchor constraintEqualToAnchor:settingsView.leadingAnchor].active = YES;
//    [self.speedSlider.trailingAnchor constraintEqualToAnchor:settingsView.trailingAnchor].active = YES;
//    [self.speedSlider.bottomAnchor constraintEqualToAnchor:settingsView.bottomAnchor constant:-40].active = YES;
    
//    //layout in switchesView
//    [self.rotationSwitch.leadingAnchor constraintEqualToAnchor:switchesView.leadingAnchor].active = YES;
//    [self.rotationSwitch.topAnchor constraintEqualToAnchor:switchesView.topAnchor].active = YES;
//    [self.rotationSwitch.bottomAnchor constraintEqualToAnchor:switchesView.bottomAnchor].active = YES;
//    [self.rotationSwitch.trailingAnchor constraintGreaterThanOrEqualToAnchor:self.scaleSwitch.leadingAnchor].active = YES;
//
//
//   // [self.scaleSwitch.leadingAnchor constraintEqualToAnchor:self.switchesView.leadingAnchor].active = YES;
//    [self.scaleSwitch.topAnchor constraintEqualToAnchor:switchesView.topAnchor].active = YES;
//    [self.scaleSwitch.centerXAnchor constraintEqualToAnchor:switchesView.centerXAnchor].active = YES;
//    [self.scaleSwitch.bottomAnchor constraintEqualToAnchor:switchesView.bottomAnchor].active = YES;
//
//    [self.translationSwitch.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.scaleSwitch.trailingAnchor].active = YES;
//    [self.translationSwitch.trailingAnchor constraintEqualToAnchor:switchesView.trailingAnchor].active = YES;
//    [self.translationSwitch.topAnchor constraintEqualToAnchor:switchesView.topAnchor].active = YES;
//    [self.translationSwitch.bottomAnchor constraintEqualToAnchor:switchesView.bottomAnchor].active = YES;
    
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
