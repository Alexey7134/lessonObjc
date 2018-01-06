//
//  SVMainViewController.m
//  SVAutoLayoutCodeConstraint
//
//  Created by Viktor Siedov on 11.11.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"

@interface SVMainViewController ()

@property(strong, nonatomic)UIView *view1;
@property(strong, nonatomic)UIView *view2;

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    
    self.view1.backgroundColor = [UIColor redColor];
    self.view2.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view1.translatesAutoresizingMaskIntoConstraints = NO;
    self.view2.translatesAutoresizingMaskIntoConstraints = NO;
    //[self makeConstraint];
    
    //[self makeConstraintWithVFL];
    if([[[UIDevice currentDevice] systemVersion] floatValue] <= 9.0){
      [self makeConstraint];
    }else{
      //[self makeConstraintWithAnchor];
        [self createConstraintsAnim];
    }
    
}
#pragma mark - AutoLayout

-(void)makeConstraintWithAnchor{
    [self.view1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.view1.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.view1.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.view1.bottomAnchor constraintEqualToAnchor:self.view2.topAnchor].active = YES;

    [self.view2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.view2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.view2.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    //[self.view2.heightAnchor constraintEqualToAnchor:self.view2.widthAnchor].active = YES;
    [self.view2.heightAnchor constraintEqualToConstant:100].active = YES;
}

-(void)createConstraintsAnim{
    NSMutableArray *verticalConstraintsArray = [NSMutableArray array];
    [verticalConstraintsArray addObject:[self.view1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]];
    [verticalConstraintsArray addObject:[self.view1.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]];
    [verticalConstraintsArray addObject:[self.view1.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [verticalConstraintsArray addObject:[self.view1.bottomAnchor constraintEqualToAnchor:self.view2.topAnchor]];
    
    [verticalConstraintsArray addObject:[self.view2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]];
    [verticalConstraintsArray addObject:[self.view2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]];
    [verticalConstraintsArray addObject:[self.view2.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]];
    [verticalConstraintsArray addObject:[self.view2.heightAnchor constraintEqualToConstant:100]];
    
    [NSLayoutConstraint activateConstraints:verticalConstraintsArray];
    
    NSMutableArray *horizontalCOnstraintsArray = [NSMutableArray array];
    [horizontalCOnstraintsArray addObject:[self.view1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view1.trailingAnchor constraintEqualToAnchor:self.view2.leadingAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view1.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view1.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]];
    
    [horizontalCOnstraintsArray addObject:[self.view2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view2.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view2.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]];
    [horizontalCOnstraintsArray addObject:[self.view2.widthAnchor constraintEqualToConstant:100]];
    
    [self animLayoutFirst:verticalConstraintsArray second:horizontalCOnstraintsArray];
    
    //[NSLayoutConstraint activateConstraints:verticalConstraintsArray];
}

-(void)animLayoutFirst:(NSArray *)firstArray second:(NSArray *)secondArray{
    [UIView animateWithDuration:5
                     animations:^{
                         [NSLayoutConstraint deactivateConstraints:firstArray];
                         [NSLayoutConstraint activateConstraints:secondArray];
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         [self animLayoutFirst:secondArray second:firstArray];
                     }];
}


-(void)makeConstraintWithVFL{
    NSDictionary *views = @{@"view1":self.view1,@"view2":self.view2};
    NSDictionary *metrics = @{@"space":@(20)};
    NSArray* horisontalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view1]-0-|" options:0 metrics:nil views:views];
    NSArray* horisontalConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[view2]-0-|" options:0 metrics:nil views:views];
    NSArray* verticalConstraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view1]-space-[view2(100)]-0-|" options:0 metrics:metrics views:views];
    
    [self.view addConstraints:horisontalConstraints1];
    [self.view addConstraints:horisontalConstraints2];
    [self.view addConstraints:verticalConstraints1];
    
}


-(void)makeConstraint{
    
    [NSLayoutConstraint constraintWithItem:self.view1
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view1
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view1
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view1
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view2
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.view2
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view2
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTrailing
                                multiplier:1.0
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:self.view2
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:self.view2
//                                 attribute:NSLayoutAttributeHeight
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:nil
//                                 attribute:NSLayoutAttributeNotAnAttribute
//                                multiplier:1.0
//                                  constant:100].active = YES;
   
    
    NSLayoutConstraint *costraintWidthRatio = [NSLayoutConstraint constraintWithItem:self.view2
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view2
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1.0
                                                                            constant:0];
    costraintWidthRatio.active = YES;
    costraintWidthRatio.priority = UILayoutPriorityDefaultLow;
    
    
    
}
@end
