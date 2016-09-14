//
//  ViewController.m
//  TestViewAnimation
//
//  Created by Viktor Siedov on 14.09.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(weak, nonatomic) UIView* testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.testView = view;
    
}

-(UIColor*) randomColor{
    CGFloat r = (CGFloat)(arc4random() % 256)/255;
    CGFloat g = (CGFloat)(arc4random() % 256)/255;
    CGFloat b = (CGFloat)(arc4random() % 256)/255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

-(void) moveView:(UIView *)view {
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMidX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMidY(rect);
    
    CGFloat s = (float)(arc4random() % 151) /100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI *2 * 10000)) / 10000 - M_PI;
    
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"view frame = %@ \n view boundce = %@", NSStringFromCGRect(view.frame),NSStringFromCGRect(view.bounds));
                         
                         __weak UIView* v = view;
                         [self moveView:v];
                     }];
    
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    /*
    [UIView animateWithDuration:5
                     animations:^{
                         
                         self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.view.frame)/2, 150);
                         
                     }];
     */
    
    /*
    [UIView animateWithDuration:10
                          delay:1
                        options:UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.view.frame)/2, 150);
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                     }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.testView.layer removeAllAnimations];
        
        [UIView animateWithDuration:4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             
                             self.testView.center = CGPointMake(500, 500);
                             
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"animation finished! %d", finished);
                         }];
    });
    */
    
   /*
    [UIView animateWithDuration:10
                          delay:1
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.view.frame)/2, 150);
                         self.testView.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(2, 0.5);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(-M_PI);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         self.testView.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                     }];
    */
    
    [self moveView:self.testView];

    
}




@end
