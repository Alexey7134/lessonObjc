//
//  SVButton.h
//  SVButton
//
//  Created by Viktor Siedov on 20.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVButton : UIButton

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
-(void)buttonCornerRadius;

@end
