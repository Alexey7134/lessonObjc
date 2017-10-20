//
//  MainViewController.m
//  SVTestTouches
//
//  Created by Viktor Siedov on 03.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property(strong, nonatomic)UIView *viewTest;
@property(strong, nonatomic)UILabel *labelWeigh;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewTest = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.viewTest.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewTest];
    
    self.labelWeigh = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 200, CGRectGetWidth(self.view.frame), 100)];
    [self.view addSubview:self.labelWeigh];
    self.labelWeigh.textAlignment = NSTextAlignmentCenter;
    self.labelWeigh.text = @"0.0 gramm";
    self.labelWeigh.backgroundColor =[UIColor whiteColor];
     
    
    self.viewTest.userInteractionEnabled = YES;
}

#pragma mark My functions

-(UIColor *)changeHueInColor:(UIColor *)color withForce:(CGFloat)force{
    CGFloat hue = 0.0, saturation = 0.0, brightness = 0.0, alpha = 0.0;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    hue = force;
    color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return color;
}

#pragma mark Touches

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    NSSet *allTouches = [event allTouches];
//    NSLog(@"touches count :%lu", allTouches.count);
    
    UITouch *touch = [[allTouches allObjects] firstObject];
    if (touch) {
//        NSLog(@"touch tap count :%lu", touch.tapCount);
        
        CGPoint currentPoint = [touch locationInView:self.view];
        self.viewTest.center = currentPoint;

    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesMoved");
    NSSet *allTouches = [event allTouches];
    //    NSLog(@"touches count :%lu", allTouches.count);
    
    UITouch *touch = [[allTouches allObjects] firstObject];
    if (touch) {
        //        NSLog(@"touch tap count :%lu", touch.tapCount);
        
        CGPoint currentPoint = [touch locationInView:self.view];
        self.viewTest.center = currentPoint;
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            CGFloat force = touch.force/touch.maximumPossibleForce;
            NSLog(@"force : %1.2f", force);
            self.view.backgroundColor = [self changeHueInColor:self.viewTest.backgroundColor withForce:force];
            
            CGFloat weigh = force * 385;
            self.labelWeigh.text = [NSString stringWithFormat:@"%1.2f gramms", weigh];
            
        }
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesEnded");
    self.labelWeigh.text = @"0.0 gramms";
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesCancelled");
}

@end
