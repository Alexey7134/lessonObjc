//
//  MainViewController.m
//  GeometryViewController
//
//  Created by Viktor Siedov on 27.07.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


#pragma mark - loadView 

-(void)loadView{
    [super loadView];
    
    [self createViewsChess:self.view sizeRect:30 borderWindth:2];
    
}

-(void)createViewsChess:(UIView *)mainView sizeRect:(NSInteger)sizeRect borderWindth:(CGFloat)borderWindth{
    NSInteger maxCountView = 8;
    UIColor *blackColor = [UIColor blackColor];
    UIColor *whiteColor = [UIColor whiteColor];
    
    UIView *viewMain = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (sizeRect * maxCountView) + borderWindth, (sizeRect * maxCountView) + borderWindth)];
    viewMain.layer.borderColor = blackColor.CGColor;
    viewMain.layer.borderWidth = borderWindth;
    [mainView addSubview:viewMain];

    for (NSInteger i = 0; i < maxCountView; i++) {
        for (NSInteger j = 0; j < maxCountView; j++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(sizeRect*i, sizeRect*j, sizeRect, sizeRect)];
            [view setBackgroundColor:((i+j)%2 == 0) ? blackColor : whiteColor];
            [mainView addSubview:view];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


@end
