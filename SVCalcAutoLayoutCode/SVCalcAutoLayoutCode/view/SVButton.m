//
//  SVButton.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 14.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVButton.h"

@implementation SVButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        //[self buttonCornerRadius];
    }
    return self;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    UIGraphicsBeginImageContext(self.frame.size);
    CGRect buttonRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, buttonRect);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self setBackgroundImage:image forState:state];
    [self setHighlighted:YES];
}

@end
