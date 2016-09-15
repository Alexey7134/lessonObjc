//
//  ViewController.m
//  TestViewAnimationHm
//
//  Created by Viktor Siedov on 15.09.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *viewTesting = [[UIView alloc] initWithFrame:CGRectMake(100, 100 * i + 10 *i, 100, 100)];
        [self.view addSubview:viewTesting];
        viewTesting.backgroundColor = [self randomColor];
        [self viewChancgeAnim:viewTesting animOption:i];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


-(UIColor*) randomColor{
    CGFloat r = (CGFloat)(arc4random() % 256)/255;
    CGFloat g = (CGFloat)(arc4random() % 256)/255;
    CGFloat b = (CGFloat)(arc4random() % 256)/255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

-(void)viewChancgeAnim:(UIView *)view animOption:(UIViewAnimationOptions)animOption{
    
    [UIView animateWithDuration:4
                          delay:0
                        options:animOption << 16 | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         view.center = CGPointMake(600,CGRectGetMinX(view.frame) + CGRectGetWidth(view.bounds)*animOption + animOption *10);
                         view.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         //NSLog(@"finish anim");
                         //__weak UIView *viewNewAnim = view;
                         //[self viewChancgeAnim:viewNewAnim animOption:animOption];
                     }];

}


@end
