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
    
    //self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelScreen.translatesAutoresizingMaskIntoConstraints = NO;
    self.viewButtons.translatesAutoresizingMaskIntoConstraints = NO;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        [self makeAutoLayoutWithAnchors];
    }else{
        [self makeAutoLAyoutWithConstrains];
        //[self makeAutoLayoutWithVFL];
    }
    
}

-(void)makeAutoLayoutWithAnchors{
    UILayoutGuide *margineGuide = self.view.layoutMarginsGuide;
    [self.labelScreen.leadingAnchor constraintEqualToAnchor:margineGuide.leadingAnchor].active = YES;
    [self.labelScreen.trailingAnchor constraintEqualToAnchor:margineGuide.trailingAnchor].active = YES;
    [self.labelScreen.topAnchor constraintEqualToAnchor:margineGuide.topAnchor].active = YES;
    [self.labelScreen.bottomAnchor constraintEqualToAnchor:self.viewButtons.topAnchor].active = YES;
    
    [self.viewButtons.leadingAnchor constraintEqualToAnchor:margineGuide.leadingAnchor].active = YES;
    [self.viewButtons.trailingAnchor constraintEqualToAnchor:margineGuide.trailingAnchor].active = YES;
    [self.viewButtons.bottomAnchor constraintEqualToAnchor:margineGuide.bottomAnchor constant:-20].active = YES;
    [self.viewButtons.heightAnchor constraintEqualToConstant:CGRectGetWidth(self.view.frame)+45].active = YES;
}

-(void)makeAutoLayoutWithVFL{
    NSDictionary *viewsDictionary = @{@"viewButtons":self.viewButtons,
                                      @"labelScreen":self.labelScreen};
    NSDictionary *metrics = @{@"space":@(20),
                              @"sizeViewHeight":@(CGRectGetWidth(self.view.frame)+35)};
    NSArray *horizontalConstrains1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelScreen]-20-|" options:0 metrics:nil views:viewsDictionary];
    NSArray *horizontalConstrains2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[viewButtons]-20-|" options:0 metrics:nil views:viewsDictionary];
    NSArray *verticalConstrains1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[labelScreen]-0-[viewButtons(sizeViewHeight)]-space-|" options:0 metrics:metrics views:viewsDictionary];
    [self.view addConstraints:horizontalConstrains1];
    [self.view addConstraints:horizontalConstrains2];
    [self.view addConstraints:verticalConstrains1];
    //but if need change multiplier, you will need add Constraint with this parametr
}

-(void)makeAutoLAyoutWithConstrains{
    [NSLayoutConstraint constraintWithItem:self.labelScreen
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.labelScreen
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.labelScreen
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1
                                  constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.labelScreen
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.viewButtons
                                 attribute:NSLayoutAttributeTop
                                multiplier:1
                                  constant:0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.viewButtons
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1
                                  constant:20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.viewButtons
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1
                                  constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.viewButtons
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.viewButtons
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1
                                  constant:CGRectGetWidth(self.view.frame)+35].active = YES;
    
}


-(void)setLabelDisplayText:(NSString *)str{
    self.labelScreen.text = str;
}

#pragma mark -Orientation
- (BOOL) shouldAutorotate
{
    return NO;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

#pragma mark - SVButton action
- (void)buttonAction:(SVButton *)button {
    [self.logicCalc chooseFuncTag:button.tag];
}

@end
