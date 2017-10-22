//
//  SVSliderSpeedView.h
//  SVControl
//
//  Created by Viktor Siedov on 22.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVSliderSpeedViewDelegate;

@interface SVSliderSpeedView : UIView

@property(strong, nonatomic)id<SVSliderSpeedViewDelegate> delegate;
@property(strong, nonatomic)UISlider *sliderView;
@property(strong, nonatomic)UILabel *label;

@end

@protocol SVSliderSpeedViewDelegate <NSObject>
-(void)actionSliderChanged:(UISlider *)sender;
@end
