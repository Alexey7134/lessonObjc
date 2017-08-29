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
    
    self.viewTest = [[SVView alloc] init];
    [self.view addSubview:self.viewTest];
}

#pragma mark - Orientation -

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSLog(@"ayayaya");
    [self.viewTest setNeedsDisplay];
    
    
//    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait){
//        newColor = [UIColor blackColor];
//    }else if([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft){
//        
//    }
    
}


@end
