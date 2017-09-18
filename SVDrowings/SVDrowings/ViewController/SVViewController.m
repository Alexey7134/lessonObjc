//
//  SVViewController.m
//  SVDrowings
//
//  Created by Viktor Siedov on 05.08.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVViewController.h"
#import "SVView.h"

@interface SVViewController ()

@property(strong,nonatomic)SVView *viewTest;

@end

@implementation SVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
    self.viewTest = [[SVView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    
    
    [self.view addSubview:self.viewTest];
}

#pragma mark - Orientation -

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [self.viewTest setNeedsDisplay];
}


@end
