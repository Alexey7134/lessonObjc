//
//  SVViewController.m
//  SVDrowings
//
//  Created by Viktor Siedov on 05.08.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVViewController.h"
#import "SVView.h"
#import "SVPaint.h"

@interface SVViewController () <UIGestureRecognizerDelegate>

@property(strong,nonatomic)SVView *viewTest;
@property(strong,nonatomic)SVPaint *paintView;

@end

@implementation SVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.viewTest = [[SVView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.view addSubview:self.viewTest];
    
    self.paintView = [[SVPaint alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.view addSubview:self.paintView];
    [self.paintView setUserInteractionEnabled:YES];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognizerHandler:)];
    [self.paintView addGestureRecognizer:panRecognizer];
}

#pragma mark - Orientation -

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [self.viewTest setNeedsDisplay];
}

#pragma mark - Gesture handlers -

-(void)panRecognizerHandler:(UIPanGestureRecognizer *)recognizer{
    CGPoint currentPoint = CGPointMake([recognizer locationInView:self.paintView].x, [recognizer locationInView:self.paintView].y);
    if ([recognizer state] == UIGestureRecognizerStateBegan) {
        [self.paintView beganDrawLine:currentPoint];
    }else if ([recognizer state] == UIGestureRecognizerStateChanged){
        [self.paintView changedDrawLine:currentPoint];
    }else if ([recognizer state] == UIGestureRecognizerStateEnded){
        [self.paintView endDrawLine:currentPoint];
    }
}

@end
