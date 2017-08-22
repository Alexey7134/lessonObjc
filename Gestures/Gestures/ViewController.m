//
//  ViewController.m
//  Gestures
//
//  Created by Viktor Siedov on 03.06.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

CGFloat const PERSON_WIDTH = 123.f;
CGFloat const PERSON_HEIGHT = 108.f;
CGFloat const PERSON_RUN_DURATION = 0.6f;
NSString *const PERSON_IMAGE_NAME =@"person";
NSInteger const PERSON_IMAGES_COUNT = 9;
NSInteger const PERSON_IMAGE_INDEX_START = 1;


@interface ViewController () <UIGestureRecognizerDelegate>

@property(strong, nonatomic)TestView *viewTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    CGSize size= CGSizeMake(PERSON_WIDTH, PERSON_HEIGHT);
    self.viewTest = [self getView:size];
    
    self.viewTest.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",PERSON_IMAGE_NAME,1]];

    NSArray *arrayImages = @[];
    for (NSInteger i=PERSON_IMAGE_INDEX_START; i<PERSON_IMAGES_COUNT; i++) {
        arrayImages = [arrayImages arrayByAddingObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",PERSON_IMAGE_NAME,i]]];
    }
    self.viewTest.animationImages = arrayImages;
    
    [self.view addSubview:self.viewTest];
    self.viewTest.animationDuration = PERSON_RUN_DURATION;
    [self.viewTest startAnimating];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(handleSwipeRight:)];
    [self.view addGestureRecognizer:swipeRightGesture];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRightGesture.delegate = self;
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(handleSwipeLeft:)];
    [self.view addGestureRecognizer:swipeLeftGesture];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeftGesture.delegate = self;
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchGesture];
    pinchGesture.delegate = self;
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                                    action:@selector(handleRotation:)];
    [self.view addGestureRecognizer:rotationGesture];
    rotationGesture.delegate = self;
    
    
    
//    UITapGestureRecognizer *tapDoubleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                                       action:@selector(handleTapDoubleFingersOne:)];
//    tapDoubleGesture.numberOfTapsRequired =2;
//    [self.view addGestureRecognizer:tapDoubleGesture];
    
    UITapGestureRecognizer *tapDoubleFingerTwoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapDoubleFingersTwo:)];
    tapDoubleFingerTwoGesture.numberOfTapsRequired =2;
    tapDoubleFingerTwoGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:tapDoubleFingerTwoGesture];
    //tapDoubleFingerTwoGesture.delegate = self;
    


}

#pragma marks help functions

-(UIColor*)getColor{
    
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
    return color;
}

-(TestView *)getView:(CGSize)size{
    CGFloat x = (float)(arc4random() % 100);
    CGFloat y = (float)(arc4random() % 100);
    //CGFloat w = (float)(arc4random() % 100) + 50;
    //CGFloat h = (float)(arc4random() % 100) + 50;
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(x, y, size.width, size.height)];
    view.scale = 1.f;
    view.angle = 0;
    return view;
}

-(void)animation:(TestView *) view{
    //transform = CGAffineTransformScale(, 0.8f, 0.8f)
    //view.transform = CGAffineTransformMakeScale(0.8f, 0.8f);
    
    //view.scale = view.transform;
}

#pragma marks Gestures


-(void)handleTap:(UITapGestureRecognizer *)tap{
    //self.viewTest.backgroundColor = [self getColor];
    [self.viewTest startAnimating];
    [UIImageView animateWithDuration:2 animations:^{
         self.viewTest.center = [tap locationInView:self.view];
    }];
}

-(void)handleTapDoubleFingersOne:(UITapGestureRecognizer *)tap{
    //NSLog(@"tap double fingers one :%@", NSStringFromCGPoint([tap locationInView:self.view]));
    //[self animation:self.viewTest];
//    self.viewTest.transform = CGAffineTransformScale(self.viewTest.transform, 1.2f, 1.2f);
}

-(void)handleTapDoubleFingersTwo:(UITapGestureRecognizer *)tap{
    if(self.viewTest.animating){
        [self.viewTest stopAnimating];
    }
}
-(void)handleSwipeRight:(UISwipeGestureRecognizer *)swipe{
    [UIImageView animateWithDuration:2 animations:^{
        self.viewTest.transform = CGAffineTransformRotate(self.viewTest.transform, M_PI);
    }];
}

-(void)handleSwipeLeft:(UISwipeGestureRecognizer *)swipe{
    [UIImageView animateWithDuration:2 animations:^{
        self.viewTest.transform = CGAffineTransformRotate(self.viewTest.transform, -M_PI);
    }];
}

-(void)handlePinch:(UIPinchGestureRecognizer *)recognize{
    NSLog(@"pinch ");
    if (recognize.state == UIGestureRecognizerStateBegan) {
        self.viewTest.scale = 1.f;
    }
    self.viewTest.transform = CGAffineTransformScale(self.viewTest.transform, 1.f + recognize.scale - self.viewTest.scale, 1.f + recognize.scale - self.viewTest.scale);
    self.viewTest.scale = recognize.scale;
}


-(void)handleRotation:(UIRotationGestureRecognizer *)recognize{
    NSLog(@"rotation ");
    if (recognize.state == UIGestureRecognizerStateBegan) {
        self.viewTest.angle = 0;
    }
    self.viewTest.transform = CGAffineTransformRotate(self.viewTest.transform, recognize.rotation - self.viewTest.angle);
    self.viewTest.angle = recognize.rotation;
    NSLog(@"recognize.rotation = %f",recognize.rotation);
     NSLog(@"recognize.rotation - self.viewTest.angle = %f",(recognize.rotation - self.viewTest.angle));
}

#pragma mark - UIGestureRecognizerDelegate -

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    return [gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
//}

@end
