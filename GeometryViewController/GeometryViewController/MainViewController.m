//
//  MainViewController.m
//  GeometryViewController
//
//  Created by Viktor Siedov on 27.07.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

NSInteger const MAX_RECT_VIEW = 8;

@interface MainViewController (){
    UIColor *colorChessRect;
}

@end

@implementation MainViewController


#pragma mark - loadView -

-(void)loadView{
    [super loadView];
    
    colorChessRect = [UIColor blackColor];//default
    
    [self createViewsChess:self.view borderWindth:2];
}

-(void)createViewsChess:(UIView *)mainView borderWindth:(CGFloat)borderWindth{
    UIColor *blackColor = [UIColor blackColor];
    UIColor *whiteColor = [UIColor whiteColor];
    
    NSInteger sizeGameChess = MIN(mainView.bounds.size.height, mainView.bounds.size.width);
    NSInteger align = MAX(mainView.bounds.size.height, mainView.bounds.size.height);
    
    NSInteger heightChessPos = align/2 - sizeGameChess/2;
    
    UIView *viewChess = [[UIView alloc] initWithFrame:CGRectMake(0, heightChessPos, sizeGameChess, sizeGameChess)];
    viewChess.layer.borderColor = blackColor.CGColor;
    viewChess.layer.borderWidth = borderWindth;
    viewChess.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [mainView addSubview:viewChess];
    
    NSInteger sizeRect =  sizeGameChess/MAX_RECT_VIEW;
    
    for (NSInteger i = 0; i < MAX_RECT_VIEW; i++) {
        for (NSInteger j = 0; j < MAX_RECT_VIEW; j++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(sizeRect*i,sizeRect*j, sizeRect, sizeRect)];
            [view setBackgroundColor:((i+j)%2 == 0) ? blackColor : whiteColor];
            [viewChess addSubview:view];
        }
    }
}

-(void)changeColorInViews:(NSArray *)arrayViews newColour:(UIColor *)color oldColor:(UIColor *)oldColor{
    for (UIView *view in arrayViews) {
        if (CGColorEqualToColor(view.backgroundColor.CGColor, oldColor.CGColor))[view setBackgroundColor:color];
    }
}

-(UIColor *)randomColor{
    return [UIColor colorWithRed:((arc4random()%10 +3)*.1f)
                           green:((arc4random()%10 +3)*.1f)
                            blue:((arc4random()%10 +3)*.1f)
                           alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - Orientation -

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIColor *newColor = [self randomColor];
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait){
        newColor = [UIColor blackColor];
    }else if([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft){
        
    }
    
    UIView * viewChess = self.view.subviews[0];
    [self changeColorInViews:viewChess.subviews newColour:newColor oldColor:colorChessRect];
    viewChess.layer.borderColor = newColor.CGColor;
    colorChessRect = newColor;
}


@end
