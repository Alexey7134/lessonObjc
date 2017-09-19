//
//  SVPaint.m
//  SVDrowings
//
//  Created by Viktor Siedov on 19.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVPaint.h"
@interface SVPaint()

@property(nonatomic,assign)CGPoint lastpoint;

@end

@implementation SVPaint

-(void)beganDrawLine:(CGPoint)point{
    self.lastpoint = point;
}

-(void)changedDrawLine:(CGPoint)point{
    [self drawLineToPoint:point];
}

-(void)endDrawLine:(CGPoint)point{
    self.lastpoint = point;
}

-(void)drawLineToPoint:(CGPoint)point{
    UIGraphicsBeginImageContext(self.frame.size);
    CGRect drawingInRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.image drawInRect:drawingInRect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.f);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, self.lastpoint.x, self.lastpoint.y);
    CGContextAddLineToPoint(context, point.x, point.y);
    CGContextStrokePath(context);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.lastpoint = point;
}

@end
