//
//  MainViewController.m
//  GeometryViewController
//
//  Created by Viktor Siedov on 27.07.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property(weak, nonatomic)UIView *viewGame;

@end

@implementation MainViewController


#pragma mark - loadView 

-(void)loadView{
    [super loadView];
    
    [self createViewsChess:self.view borderWindth:2];
    self.viewGame = self.view.subviews[0];
    //self.viewGame.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

-(void)createViewsChess:(UIView *)mainView borderWindth:(CGFloat)borderWindth{
    NSInteger maxRectView = 8;
    UIColor *blackColor = [UIColor blackColor];
    UIColor *whiteColor = [UIColor whiteColor];
    NSInteger sizeRect =  mainView.frame.size.width/maxRectView;
    
    UIView *viewChess = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (sizeRect * maxRectView) + borderWindth, (sizeRect * maxRectView) + borderWindth)];
    viewChess.layer.borderColor = blackColor.CGColor;
    viewChess.layer.borderWidth = borderWindth;
    [mainView addSubview:viewChess];
    
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



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}


@end
