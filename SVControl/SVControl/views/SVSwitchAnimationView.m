//
//  SVSwitchAnimationView.m
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVSwitchAnimationView.h"
@interface SVSwitchAnimationView()

@end

@implementation SVSwitchAnimationView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.switchView = [[UISwitch alloc]  initWithFrame:CGRectZero];
        [self.switchView addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.switchView];
        
        self.label = [[UILabel alloc]  initWithFrame:CGRectMake(0, 0, 20, 20)];
        //[self.label addTarget:self action:@selector(actionSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.label];
    }
    return self;
}

#pragma mark - Action

-(void)action:(UISwitch*)sender{
    [self.delegate actionSwitchChanged:sender];
}

@end
