//
//  SVViewController.m
//  TestGesture
//
//  Created by Viktor Siedov on 30.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVViewController.h"
#import "TestView.h"

@interface SVViewController ()

@property(nonatomic, strong)TestView *viewTest;


@end

@implementation SVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewTest = [[TestView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.viewTest.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.viewTest];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tapRecognizer.numberOfTapsRequired = 2;
    tapRecognizer.numberOfTouchesRequired =2;
    [self.view addGestureRecognizer:tapRecognizer];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchHndler:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    pinchRecognizer.delegate = self;
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationHandler:)];
    [self.view addGestureRecognizer:rotationRecognizer];
    rotationRecognizer.delegate = self;
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    [self.view addGestureRecognizer:panRecognizer];
    rotationRecognizer.delegate = self;
}

-(void)tapHandler:(UITapGestureRecognizer *)recognizer{
    NSLog(@"make tape");
    [UIView animateWithDuration:2 animations:^{
        self.viewTest.center = [recognizer locationInView:self.view];
    }];
}
-(void)pinchHndler:(UIPinchGestureRecognizer *)recognizer{
    NSLog(@"pinchHndler");
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.viewTest.scale = 1.f;
    }
    self.viewTest.transform = CGAffineTransformScale(self.viewTest.transform, 1 + recognizer.scale - self.viewTest.scale, 1 + recognizer.scale - self.viewTest.scale);
    
    self.viewTest.scale = recognizer.scale;
}

-(void)rotationHandler:(UIRotationGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.viewTest.angle = 0;
    }
    self.viewTest.transform  = CGAffineTransformRotate(self.viewTest.transform, recognizer.rotation - self.viewTest.angle);
    self.viewTest.angle = recognizer.rotation;
    NSLog(@"rotationHandler");
}
-(void)panHandler:(UIPanGestureRecognizer *)recognizer{
    NSLog(@"panHandler");
    self.viewTest.center = [recognizer locationInView:self.view];
}


#pragma mark - Gesture methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

@end
