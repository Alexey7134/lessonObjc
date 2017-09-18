//
//  SVViewController.m
//  SVDrowings
//
//  Created by Viktor Siedov on 05.08.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVViewController.h"
#import "SVView.h"

@interface SVViewController () <UIGestureRecognizerDelegate>

@property(strong,nonatomic)SVView *viewTest;
@property(strong,nonatomic)UIImageView *imageViewPaint;

@end

@implementation SVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
    self.viewTest = [[SVView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    
    
    [self.view addSubview:self.viewTest];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognizerHandler:)];
    [self.viewTest addGestureRecognizer:panRecognizer];

    self.imageViewPaint = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.view addSubview:self.imageViewPaint];

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
    NSLog(@"panRecognizerHandler");
    CGPoint currentPoint = CGPointMake([recognizer locationInView:self.viewTest].x, [recognizer locationInView:self.viewTest].y);
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.imageViewPaint.image drawInRect:self.viewTest.bounds];
//    //self.lastPoint = currentPoint
    CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextStrokePath(context);
    self.imageViewPaint.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
