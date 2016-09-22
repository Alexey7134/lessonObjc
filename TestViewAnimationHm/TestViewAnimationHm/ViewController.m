//
//  ViewController.m
//  TestViewAnimationHm
//
//  Created by Viktor Siedov on 15.09.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "ViewController.h"

NSString *const VIEW_COLOR_KEY = @"color";
NSString *const VIEW_OBJECT_KEY = @"view";
NSString *const VIEW_POINT_KEY = @"point";
NSString *const VIEW_INDEX_KEY = @"index";
NSString *const VIEW_ROTATION_KEY = @"rotation";

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *arrOldPosViews;
@property(nonatomic,strong)NSDictionary *tempDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrOldPosViews = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 4; i++) {
        
        CGPoint point = [self randomPos:self.view childViewSize:CGSizeMake(100, 100)];
        UIView *viewTesting = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 100, 100)];
        viewTesting.backgroundColor = [self randomColor];
        [self.view addSubview:viewTesting];
        
        UIColor *colorView = [self randomColor];
        
        point = [self randomPos:self.view childViewSize:CGSizeMake(100, 100)];
        NSValue *val = [NSValue valueWithCGPoint:point];
        
        CGFloat rotation = [self randomRotaion];
        
        NSDictionary *dicOption = [NSDictionary dictionaryWithObjectsAndKeys:
                                   colorView,VIEW_COLOR_KEY,
                                   @(i), VIEW_INDEX_KEY,
                                   val,VIEW_POINT_KEY,
                                   viewTesting, VIEW_OBJECT_KEY,
                                   @(rotation), VIEW_ROTATION_KEY,
                                   nil];
        
        [self.arrOldPosViews addObject:dicOption];
        
        [self viewChangeAnimWihtDictionary:dicOption];
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

-(CGPoint)randomPos:(UIView *)parentView childViewSize:(CGSize)childViewSize{
    
    CGFloat x = (CGFloat)(arc4random() % (int)(CGRectGetMaxX(parentView.frame) - childViewSize.width)) + childViewSize.width/2;
    CGFloat y = (CGFloat)(arc4random() % (int)(CGRectGetMaxY(parentView.frame) - childViewSize.height)) + childViewSize.height/2;
    
    CGPoint newPoint = CGPointMake(x,y);
    
    //NSLog(@"newPoint %@", NSStringFromCGPoint(newPoint));
    
    return newPoint;
}

-(CGFloat)randomRotaion{
    return (CGFloat)(arc4random() % (NSInteger)(M_PI *2 * 10000)) / 10000 - M_PI;
}

-(void)viewChangeAnimWihtDictionary:(NSDictionary *)dic{
    
    UIView *view = [dic objectForKey:VIEW_OBJECT_KEY];
    
    NSNumber *num = [dic objectForKey:VIEW_INDEX_KEY];
    NSInteger animOption = [num integerValue];
    
    NSValue *val = [dic objectForKey:VIEW_POINT_KEY];
    CGPoint newPoint = [val CGPointValue];
    
    UIColor *color = [dic objectForKey:VIEW_COLOR_KEY];
    
    num = [dic objectForKey:VIEW_ROTATION_KEY];
    CGFloat rotation = [num floatValue];
    
    [UIView animateWithDuration:4
                          delay:0
                        options:animOption << 16// | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         //UIView *oldView = animOption != 3 ?
                         
                         view.center = newPoint;
                         view.backgroundColor = color;
                         
                         CGAffineTransform transform = CGAffineTransformMakeRotation(rotation);
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         //NSLog(@"finish anim");
                         __weak UIView *viewNewAnim = view;
                         
                         if(animOption == 0)self.tempDic = self.arrOldPosViews[0];
                         
                         NSInteger newIndex = animOption != 3 ? animOption + 1 : 0;
                         
                         NSDictionary *dicNext = animOption == 0 ? self.tempDic : self.arrOldPosViews[newIndex];
                         
                        NSDictionary *dicOption = [NSDictionary dictionaryWithObjectsAndKeys:
                                                        [dicNext objectForKey:VIEW_COLOR_KEY],VIEW_COLOR_KEY,
                                                        @(newIndex), VIEW_INDEX_KEY,
                                                        [dicNext objectForKey:VIEW_POINT_KEY],VIEW_POINT_KEY,
                                                        viewNewAnim, VIEW_OBJECT_KEY,
                                                        [dicNext objectForKey:VIEW_ROTATION_KEY], VIEW_ROTATION_KEY,
                                                        nil];
                         
                         self.arrOldPosViews[newIndex] = dicOption;
                         
                         [self viewChangeAnimWihtDictionary:dicOption];
                     }];

}


@end
