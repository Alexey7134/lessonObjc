//
//  SVButton.m
//  SVButton
//
//  Created by Viktor Siedov on 20.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVButton.h"

@implementation SVButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = CGRectGetHeight(self.frame)/2;
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
