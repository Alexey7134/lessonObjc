//
//  SVMainViewController.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 10.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"
#import "SVButton.h"
#import "SVLogicCalc.h"

@interface SVMainViewController ()

@property(strong,nonatomic)SVButtonsView *viewButtons;
@property(strong,nonatomic)UILabel *labelScreen;
@property(strong,nonatomic)SVLogicCalc *logicCalc;

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.logicCalc = [[SVLogicCalc alloc] init];
    self.logicCalc.delegate = self;
    
    CGRect rectLabel = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 100);
    CGRect rectWithInsets = UIEdgeInsetsInsetRect(rectLabel, UIEdgeInsetsMake(0, 10, 0, 10));
    self.labelScreen = [[UILabel alloc] initWithFrame:rectWithInsets];
    self.labelScreen.backgroundColor = [UIColor blackColor];
    self.labelScreen.textColor = [UIColor whiteColor];
    self.labelScreen.textAlignment = NSTextAlignmentRight;
    self.labelScreen.font = [self.labelScreen.font fontWithSize:50];
    [self.view addSubview:self.labelScreen];
    
    [self.logicCalc chooseFuncTag:ButtonTagSettingsAC];
    
    self.viewButtons = [[SVButtonsView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 100)];
    [self.view addSubview:self.viewButtons ];
    self.viewButtons.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        [self makeAutoLayoutWithAnchors];
    }else{
        [self makeAutoLAyoutWithConstrains];
    }
    
}

-(void)makeAutoLayoutWithAnchors{
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelScreen.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewButtons.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide *margineGuide = self.view.layoutMarginsGuide;
    [self.labelScreen.leadingAnchor constraintEqualToAnchor:margineGuide.leadingAnchor].active = YES;
    [self.labelScreen.trailingAnchor constraintEqualToAnchor:margineGuide.trailingAnchor].active = YES;
    [self.labelScreen.topAnchor constraintEqualToAnchor:margineGuide.topAnchor].active = YES;
    [self.labelScreen.bottomAnchor constraintEqualToAnchor:self.viewButtons.topAnchor].active = YES;
    
    [self.viewButtons.leadingAnchor constraintEqualToAnchor:margineGuide.leadingAnchor].active = YES;
    [self.viewButtons.trailingAnchor constraintEqualToAnchor:margineGuide.trailingAnchor].active = YES;
    [self.viewButtons.bottomAnchor constraintEqualToAnchor:margineGuide.bottomAnchor constant:-20].active = YES;
    [self.viewButtons.heightAnchor constraintEqualToConstant:CGRectGetWidth(self.view.frame)+40].active = YES;
}

-(void)makeAutoLAyoutWithConstrains{
    
}


-(void)setLabelDisplayText:(NSString *)str{
    self.labelScreen.text = str;
}

#pragma mark - SVButton action
- (void)buttonAction:(SVButton *)button {
    [self.logicCalc chooseFuncTag:button.tag];
}

@end
