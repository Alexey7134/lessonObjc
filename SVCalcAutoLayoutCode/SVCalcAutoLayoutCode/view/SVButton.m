//
//  SVButton.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 14.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVButton.h"

@interface SVButton(){
    BOOL _stateReady;//need state ready because after change size view start stack over flow! recurtion!
}

@end
@implementation SVButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if ([super initWithCoder:aDecoder]) {
        _stateReady = NO;
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

-(void)layoutSubviews{
    [super layoutSubviews];
    if (!_stateReady) {
        [self setBackgroundColor:self.backgroundColor forState:UIControlStateNormal];
        [self setBackgroundColor:[self makeColorLighter:self.backgroundColor] forState:UIControlStateHighlighted];
        [self setBackgroundColor:[self makeColorLighter:self.backgroundColor] forState:UIControlStateSelected];
        self.adjustsImageWhenHighlighted = NO;
        self.highlighted = NO;
        self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2;
        self.layer.masksToBounds = YES;
        _stateReady = YES;
    }
}

#pragma mark - Help functions -

-(UIColor *)makeColorLighter:(UIColor *)color{
    
    CGFloat hue = 0.0, saturation = 0.0, brightness = 0.0, alpha =0.0;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    saturation = (saturation - 0.2) < 0 ? 0 : saturation - 0.2;
    brightness = (brightness + 0.2) > 1 ? brightness : brightness + 0.2;
    
    color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return color;
}



@end
