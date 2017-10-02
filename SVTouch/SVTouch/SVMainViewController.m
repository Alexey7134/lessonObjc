//
//  SVMainViewController.m
//  SVTouch
//
//  Created by Viktor Siedov on 02.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"

@interface SVMainViewController ()

@property (strong, nonatomic)UIView *viewTest;
@property (strong, nonatomic)UILabel *labelWeigh;

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewTest = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 100, 100)];
    self.viewTest.backgroundColor = [UIColor redColor];
    self.viewTest.userInteractionEnabled = YES;
    [self.view addSubview:self.viewTest];
    self.labelWeigh = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 200, CGRectGetWidth(self.view.frame), 100)];
    [self.view addSubview:self.labelWeigh];
    self.labelWeigh.textAlignment = NSTextAlignmentCenter;
    self.labelWeigh.text = @"0.00 gramm";
    self.labelWeigh.backgroundColor = [UIColor whiteColor];
}


#pragma mark Help function

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
//    NSLog(@"touches count : %lu", allTouches.count);
    
    UITouch *touch = [[allTouches allObjects] firstObject];
    if (touch) {
//        NSLog(@"touch count:%lu", touch.tapCount);
        CGPoint currentPoint = [touch locationInView:self.view];
        self.viewTest.center = currentPoint;
        
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesMoved");
    NSSet *allTouches = [event allTouches];
//    NSLog(@"touches count : %lu", allTouches.count);
    
    UITouch *touch = [[allTouches allObjects] firstObject];
    if (touch) {
        //        NSLog(@"touch count:%lu", touch.tapCount);
        CGPoint currentPoint = [touch locationInView:self.view];
        self.viewTest.center = currentPoint;
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            CGFloat force = touch.force/touch.maximumPossibleForce;
            self.view.backgroundColor = [self changeHueInColor:self.viewTest.backgroundColor withForce:force];
            NSLog(@"force: %1.2f ", force);
            CGFloat weigh = force * 385;
            self.labelWeigh.text = [NSString stringWithFormat:@"%1.2f gramms", weigh];
        }
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesEnded");
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelWeigh.text = @"0.00 gramm";
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesCancelled");
}



@end
