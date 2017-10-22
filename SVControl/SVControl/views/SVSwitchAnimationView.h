//
//  SVSwitchAnimationView.h
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SVSwitchAnimationViewDelegate;

@interface SVSwitchAnimationView : UIView

@property(strong, nonatomic)id<SVSwitchAnimationViewDelegate> delegate;
@property(strong, nonatomic)UISwitch *switchView;
@property(strong, nonatomic)UILabel *label;

@end

@protocol SVSwitchAnimationViewDelegate <NSObject>
-(void)actionSwitchChanged:(UISwitch *)sender;
@end
