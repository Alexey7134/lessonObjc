//
//  MainViewController.m
//  GeometryViewController
//
//  Created by Viktor Siedov on 27.07.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
    UIColor *colorChessRect;
}

@property(weak, nonatomic)UIView *viewGame;

@end

@implementation MainViewController


#pragma mark - loadView 

-(void)loadView{
    [super loadView];
    
    colorChessRect = [UIColor blackColor];//default
    
    
    [self createViewsChess:self.view borderWindth:2];
    self.viewGame = self.view.subviews[0];
    
//    UIColor *newColor = [self randomColor];
//    [self changeColorInViews:self.view.subviews newColour:newColor oldColor:colorChessRect];
//    colorChessRect = [UIColor yellowColor];
}

-(void)createViewsChess:(UIView *)mainView borderWindth:(CGFloat)borderWindth{
    NSInteger maxRectView = 8;
    UIColor *blackColor = [UIColor blackColor];
    UIColor *whiteColor = [UIColor whiteColor];
    NSInteger sizeRect =  mainView.frame.size.width/maxRectView;
    
    UIView *viewChess = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (sizeRect * maxRectView) + borderWindth, (sizeRect * maxRectView) + borderWindth)];
    viewChess.layer.borderColor = blackColor.CGColor;
    viewChess.layer.borderWidth = borderWindth;
    //[mainView addSubview:viewChess];
    
    NSInteger centerPos = mainView.frame.size.height/2 - mainView.frame.size.width/2;

    for (NSInteger i = 0; i < maxRectView; i++) {
        for (NSInteger j = 0; j < maxRectView; j++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(sizeRect*i,centerPos + sizeRect*j, sizeRect, sizeRect)];
            [view setBackgroundColor:((i+j)%2 == 0) ? blackColor : whiteColor];
            view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                                    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [mainView addSubview:view];
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

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIColor *newColor = [self randomColor];
    [self changeColorInViews:self.view.subviews newColour:newColor oldColor:colorChessRect];
    colorChessRect = newColor;
}


@end
