//
//  SVMainViewController.m
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"



const NSInteger SVSwitchesMaxCount = 3;
const NSInteger SVRectDefault = 20;

@interface SVMainViewController (){
    CGRect _rectForMove;
    CGFloat _speed;
}

@property(strong, nonatomic)SVSwitchAnimationView *rotationSwitchView;
@property(strong, nonatomic)SVSwitchAnimationView *scaleSwitchView;
@property(strong, nonatomic)SVSwitchAnimationView *translationSwitchView;
@property(strong, nonatomic)SVSliderSpeedView *sliderView;
@property(strong, nonatomic)UISegmentedControl *segmentedControl;
@property(strong, nonatomic)UIView *settingsView;
@property(strong, nonatomic)UIImageView *imageView;

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _rectForMove = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    
    self.settingsView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    //[self.settingsView  setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:self.settingsView];
    
    self.imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    [self.imageView  setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.imageView];
    
    //Create slider View
    self.sliderView = [[SVSliderSpeedView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    _speed = self.sliderView.sliderView.value;
    self.sliderView.delegate = self;
    [self.settingsView addSubview:self.sliderView];
    
    //Create switches View
    self.rotationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.rotationSwitchView.delegate = self;
    self.rotationSwitchView.label.text = @"Enable rotation";
    self.rotationSwitchView.switchView.on = YES;
    [self.settingsView addSubview:self.rotationSwitchView];
    self.scaleSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.scaleSwitchView.delegate = self;
    self.scaleSwitchView.label.text = @"Enable scale";
    self.scaleSwitchView.switchView.on = YES;
    [self.settingsView addSubview:self.scaleSwitchView];
    self.translationSwitchView = [[SVSwitchAnimationView alloc] initWithFrame:CGRectMake(0, 0, SVRectDefault, SVRectDefault)];
    self.translationSwitchView.delegate = self;
    self.translationSwitchView.label.text = @"Enable translation";
    self.translationSwitchView.switchView.on = YES;
    [self.settingsView addSubview:self.translationSwitchView];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"first",@"second", @"third",@"four"]];
    self.segmentedControl.frame = CGRectMake(0, 0, SVRectDefault, SVRectDefault);
    [self.segmentedControl addTarget:self action:@selector(actionSegmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.settingsView addSubview:self.segmentedControl];
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%li",self.segmentedControl.selectedSegmentIndex]];
    
    [self disableMask:self.view];
    [self makeLayout];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self moveView:self.imageView withRectForMove:_rectForMove speedAnimation:_speed];
    
}

-(void)stopAnimation:(NSString *)animName{
    [self.imageView.layer needsDisplay];
    [self.imageView.layer removeAnimationForKey:@""];
}

#pragma mark - Layout

-(void)makeLayout{
    UILayoutGuide *margin = self.view.layoutMarginsGuide;

    [self.settingsView.topAnchor constraintEqualToAnchor:margin.topAnchor constant:CGRectGetHeight(margin.layoutFrame)/2].active = YES;
    [self.settingsView.bottomAnchor constraintEqualToAnchor:margin.bottomAnchor].active = YES;
    [self.settingsView.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
    [self.settingsView.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
    
    //add slider layout
    //self.sliderView.backgroundColor = [UIColor yellowColor];
    [self.sliderView.topAnchor constraintEqualToAnchor:self.settingsView.topAnchor].active = YES;
    [self.sliderView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.sliderView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche rotation
    //self.rotationSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.rotationSwitchView.topAnchor constraintEqualToAnchor:self.sliderView.bottomAnchor].active = YES;
    [self.rotationSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.rotationSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche scale
    //self.scaleSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.scaleSwitchView.topAnchor constraintEqualToAnchor:self.rotationSwitchView.bottomAnchor].active = YES;
    [self.scaleSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.scaleSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add switche translation
    //self.translationSwitchView.backgroundColor = [UIColor lightGrayColor];
    [self.translationSwitchView.topAnchor constraintEqualToAnchor:self.scaleSwitchView.bottomAnchor].active = YES;
    [self.translationSwitchView.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.translationSwitchView.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
    
    //add view change
    [self.imageView.centerXAnchor constraintEqualToAnchor:margin.centerXAnchor].active = YES;
    [self.imageView.heightAnchor constraintEqualToConstant:100].active = YES;
    [self.imageView.widthAnchor constraintEqualToConstant:120].active = YES;
   // [self.imageView.widthAnchor constraintEqualToAnchor:self.imageView.heightAnchor].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:margin.topAnchor constant:100].active = YES;
    
    //add segmented control
    //self.segmentedControl.backgroundColor = [UIColor whiteColor];
    [self.segmentedControl.topAnchor constraintEqualToAnchor:self.translationSwitchView.bottomAnchor].active = YES;
    [self.segmentedControl.leadingAnchor constraintEqualToAnchor:self.settingsView.leadingAnchor].active = YES;
    [self.segmentedControl.trailingAnchor constraintEqualToAnchor:self.settingsView.trailingAnchor].active = YES;
}

#pragma mark - Private functions

-(void)disableMask:(UIView *)view{
    for (UIView *childView in view.subviews) {
        childView.translatesAutoresizingMaskIntoConstraints = NO;
        if ([childView.subviews count] > 0 &&
            ![childView isKindOfClass:[UISwitch class]]&&
            ![childView isKindOfClass:[UISegmentedControl class]]) {
            [self disableMask:childView];
        }
    }
}

-(void) moveView:(UIView *)view withRectForMove:(CGRect)rectMove speedAnimation:(CGFloat)speed {
    
    CGRect rect = CGRectMake(0, 0, CGRectGetWidth(rectMove), CGRectGetHeight(rectMove)/2);
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    

    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMidX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMidY(rect);
    //if(self.translationSwitchView.switchView.isOn)
    
    CGFloat s = (float)(arc4random() % 25) /100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI *2 * 10000)) / 10000 - M_PI;
    
    CGFloat d = (float)((arc4random() % 20001) / 10000 + 2) / speed;
    
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         view.center = CGPointMake(x, y);
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"view frame = %@ \n view boundce = %@", NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* v = view;
                         [self moveView:v withRectForMove:rectMove speedAnimation:speed];
                     }];
    
    
    
}

#pragma mark - Animations CALayer

#pragma mark - Actions

-(void)actionSliderChanged:(UISlider *)sender{
    _speed = sender.value;
    
}

-(void)actionSwitchChanged:(UISwitch *)sender{
    
}

-(void)actionSegmentedControlChanged:(UISegmentedControl *)sender{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%li",sender.selectedSegmentIndex]];
}

@end
