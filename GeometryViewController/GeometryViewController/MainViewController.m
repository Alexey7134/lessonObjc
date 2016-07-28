//
//  MainViewController.m
//  GeometryViewController
//
//  Created by Viktor Siedov on 27.07.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

NSInteger const MAX_RECT_VIEW = 8;
NSInteger const MAX_RECT_BLACK = MAX_RECT_VIEW/2 * MAX_RECT_VIEW;
NSInteger const MAX_CHECKERS = MAX_RECT_VIEW/2 * 6;

NSString const *CHECKER_BLACK_KEY = @"checkerBlackColor";
NSString const *CHECKER_WHITE_KEY = @"checkerWhiteColor";
NSString const *RECT_BLACK_KEY = @"rectBlackColor";
NSString const *RECT_WHITE_KEY = @"rectWhiteColor";


@interface MainViewController (){
    NSDictionary *dicStartColors;
    UIColor *colorChessRect;
}

@end

@implementation MainViewController


#pragma mark - loadView -

-(void)loadView{
    [super loadView];
    
    colorChessRect = [UIColor blackColor];//default
    
    //set colors
    dicStartColors = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor redColor],CHECKER_BLACK_KEY,
                                    [UIColor whiteColor],CHECKER_WHITE_KEY,
                                    [UIColor blackColor],RECT_BLACK_KEY,
                                    [UIColor whiteColor],RECT_WHITE_KEY,
                                    nil];
    
    [self createViewsChess:self.view];
}


-(void)createViewsChess:(UIView *)mainView{
    
    NSInteger sizeGameChess = MIN(mainView.bounds.size.height, mainView.bounds.size.width);
    NSInteger align = MAX(mainView.bounds.size.height, mainView.bounds.size.height);
    
    NSInteger heightChessPos = align/2 - sizeGameChess/2;
    
    UIView *viewChess = [[UIView alloc] initWithFrame:CGRectMake(0, heightChessPos, sizeGameChess, sizeGameChess)];
    viewChess.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [mainView addSubview:viewChess];
    
    [self createViewsRectField:viewChess
                 sizeGameChess:sizeGameChess
                    colorBlack:[dicStartColors objectForKey:RECT_BLACK_KEY]
                    colorWhite:[dicStartColors objectForKey:RECT_WHITE_KEY]];
    
    [self createCheckers:viewChess
           sizeGameChess:sizeGameChess
              colorBlack:[dicStartColors objectForKey:CHECKER_BLACK_KEY]
              colorWhite:[dicStartColors objectForKey:CHECKER_WHITE_KEY]];
}

-(void)createViewsRectField:(UIView *)viewChess
              sizeGameChess:(NSInteger)sizeGameChess
                 colorBlack:(UIColor *)colorBlack
                 colorWhite:(UIColor *)colorWhite{
    
    UIView *viewRectField = [[UIView alloc] initWithFrame:CGRectMake(viewChess.bounds.origin.x, viewChess.bounds.origin.y, sizeGameChess, sizeGameChess)];
    viewRectField.layer.borderColor = colorBlack.CGColor;
    viewRectField.layer.borderWidth = 2;
    [viewChess addSubview:viewRectField];
    
    NSInteger sizeRect =  sizeGameChess/MAX_RECT_VIEW;
    for (NSInteger i = 0; i < MAX_RECT_VIEW; i++) {
        for (NSInteger j = 0; j < MAX_RECT_VIEW; j++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(sizeRect*i,sizeRect*j, sizeRect, sizeRect)];
            [view setBackgroundColor:((i+j)%2 == 0) ? colorBlack : colorWhite];
            [viewRectField addSubview:view];
        }
    }
}

-(void)createCheckers:(UIView *)viewChess
        sizeGameChess:(NSInteger)sizeGameChess
           colorBlack:(UIColor *)colorBlack
           colorWhite:(UIColor *)colorWhite{
    
    UIView *viewCheckers = [[UIView alloc] initWithFrame:CGRectMake(viewChess.bounds.origin.x, viewChess.bounds.origin.y, sizeGameChess, sizeGameChess)];
    [viewChess addSubview:viewCheckers];
    
    NSMutableArray *arrayBlackRect = [NSMutableArray array];
    UIView *viewRectsField = [self getViewFieldRects:viewChess.superview];
    for (UIView *view in viewRectsField.subviews) {
        if (!CGColorEqualToColor(colorWhite.CGColor, view.backgroundColor.CGColor)){
            [arrayBlackRect addObject:view];
        }
    }
    
    NSInteger sizeRect =  sizeGameChess/MAX_RECT_VIEW;
    for (NSInteger i = 0; i < MAX_CHECKERS; i++) {
        UIView *viewRect = [arrayBlackRect objectAtIndex:i];
        UIView *viewChecker = [[UIView alloc] initWithFrame:CGRectMake(viewRect.frame.origin.x,viewRect.frame.origin.y, sizeRect, sizeRect)];
        viewChecker.layer.cornerRadius = viewChecker.bounds.size.width/2;
        viewChecker.layer.masksToBounds = YES;
        viewChecker.backgroundColor = i < MAX_CHECKERS/2 ? colorBlack : colorWhite;
        [viewCheckers addSubview:viewChecker];
    }
}

-(void)changeColorInViews:(NSArray *)arrayViews
                newColour:(UIColor *)color
                 oldColor:(UIColor *)oldColor{
    
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

-(UIView *)getViewFieldRects:(UIView *)view{
    UIView *viewRects = [[UIView alloc] init];
    for (UIView *chessView in view.subviews) {
        for (UIView *subView in chessView.subviews) {
            if([subView.subviews count] > MAX_CHECKERS){
                viewRects = subView;
            }
        }
    }
    return viewRects;
}

-(UIView *)getViewCheckers:(UIView *)view{
    UIView *viewRects = [[UIView alloc] init];
    for (UIView *chessView in view.subviews) {
        for (UIView *subView in chessView.subviews) {
            if([subView.subviews count] == MAX_CHECKERS)viewRects = subView;
        }
    }
    return viewRects;
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
    
    UIView * viewChess = [self getViewFieldRects:self.view];
    [self changeColorInViews:viewChess.subviews newColour:newColor oldColor:colorChessRect];
    viewChess.layer.borderColor = newColor.CGColor;
    colorChessRect = newColor;
}


@end
