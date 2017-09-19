//
//  SVView.m
//  SVDrowings
//
//  Created by Viktor Siedov on 05.08.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVView.h"
@interface SVView ()

@end
@implementation SVView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //draw ellipse
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rectForEllipse = CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), 100, 100);
    CGContextAddEllipseInRect(context, rectForEllipse);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 4.f);
    CGContextStrokePath(context);
    //draw line
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 6.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
    //draw rect
    CGRect rectForRectangle = CGRectMake(CGRectGetMaxX(rectForEllipse), CGRectGetMaxY(rectForEllipse), CGRectGetWidth(rectForEllipse), CGRectGetHeight(rectForEllipse));
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 2.f);
    CGContextStrokeRect(context, rectForRectangle);
    //fill rect
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, rectForRectangle);
    //draw triangle
    CGContextMoveToPoint(context, CGRectGetMidX(rectForRectangle) - 50, CGRectGetMinY(rectForRectangle));
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextAddLineToPoint(context, CGRectGetMinX(rectForRectangle) - 50, CGRectGetMaxY(rectForRectangle));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rectForRectangle) - 50, CGRectGetMaxY(rectForRectangle));
    CGContextAddLineToPoint(context, CGRectGetMidX(rectForRectangle) - 50, CGRectGetMinY(rectForRectangle));
    CGContextSetFillColorWithColor(context, [UIColor brownColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);//instead of CGContextStrokePath and CGContextFillPath
    //draw star
    CGRect rectForStar = CGRectMake(CGRectGetMaxX(rectForEllipse) + CGRectGetWidth(rectForEllipse),
                                    CGRectGetMaxY(rectForEllipse) + CGRectGetHeight(rectForEllipse),
                                    CGRectGetWidth(rectForEllipse),
                                    CGRectGetHeight(rectForEllipse));
    
    NSArray* arrayPoints = [self getStarVertex:rectForStar vertexCount:5 radiusStar:50];
    for (NSInteger index = 0; index < [arrayPoints count]; index++) {
        CGPoint point = [[arrayPoints objectAtIndex:index] CGPointValue];
        if (index == 0)CGContextMoveToPoint(context, point.x, point.y);
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor brownColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);//instead of CGContextStrokePath and CGContextFillPath

    
    for (NSInteger index = 0; index < [arrayPoints count]; index++) {
        CGPoint point = [[arrayPoints objectAtIndex:index] CGPointValue];
        CGRect rectCircule = CGRectMake(point.x - 10, point.y - 10, 20, 20);
        CGContextAddEllipseInRect(context, rectCircule);
        CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
        CGContextFillPath(context);
    }
    
    CGRect rectForStar2 = CGRectMake(CGRectGetMinX(rectForStar) - CGRectGetWidth(rectForStar),
                                     CGRectGetMinY(rectForStar),
                                     CGRectGetWidth(rectForStar),
                                     CGRectGetHeight(rectForStar));
    
    NSArray* arrayPoints2 = [self getStarVertex:rectForStar2 vertexCount:5 radiusStar:50];
    for (NSInteger index = 0; index < [arrayPoints2 count]; index++) {
        CGPoint point = [[arrayPoints2 objectAtIndex:index] CGPointValue];
        if (index == 0)CGContextMoveToPoint(context, point.x, point.y);
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    CGContextSaveGState(context);
    {
        CGContextClip(context);
        CGContextDrawImage(context, rectForStar2, [[UIImage imageNamed:@"apple"] CGImage]);
    }
    CGContextRestoreGState(context);
    
    
    arrayPoints = [self sortVertexAroundCenter:arrayPoints centerPoint:CGPointMake(CGRectGetMidX(rectForStar), CGRectGetMidY(rectForStar))];

    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    for (NSInteger index = 0; index < [arrayPoints count]; index++) {
        CGPoint point = [[arrayPoints objectAtIndex:index] CGPointValue];
        if(index == 0)CGContextMoveToPoint(context, point.x, point.y);
        else{
            CGContextAddLineToPoint(context, point.x, point.y);
            if (index == [arrayPoints count] - 1)CGContextAddLineToPoint(context,[[arrayPoints objectAtIndex:0] CGPointValue].x, [[arrayPoints objectAtIndex:0] CGPointValue].y);
        }
    }
    CGContextStrokePath(context);
    
    //drawBezier
    CGPoint startBezier = CGPointMake(CGRectGetMaxX(rectForEllipse), CGRectGetMaxY(rectForStar) + CGRectGetHeight(rectForStar));
    CGPoint endBezier = CGPointMake(CGRectGetMaxX(rectForStar), CGRectGetMaxY(rectForStar) + CGRectGetHeight(rectForStar));
    CGPoint vector1 = CGPointMake(startBezier.x + 10 , startBezier.y - 100);
    CGPoint vector2 = CGPointMake(endBezier.x + 40 , endBezier.y - 80);
    CGContextMoveToPoint(context, startBezier.x, startBezier.y);
    CGContextAddCurveToPoint(context, vector1.x, vector1.y, vector2.x, vector2.y, endBezier.x, endBezier.y);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokePath(context);
    
    //draw sin
    CGRect rectForSin = CGRectMake(CGRectGetMinX(rectForEllipse), CGRectGetMinY(rectForStar), 300, 300);
    int y;
    for(int x= CGRectGetMinX(rectForSin); x < CGRectGetWidth(rectForSin); x++)
    {
        y = ((CGRectGetHeight(rectForSin)/6) * sin(((x*4) % 360) * M_PI/180)) + CGRectGetMidY(rectForSin);
        if (x == 0) CGContextMoveToPoint(context, x, y);
        else CGContextAddLineToPoint(context, x, y);
    }
    CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextStrokePath(context);
    
    //draw circle
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 5.f);
    CGContextMoveToPoint(context, CGRectGetMidX(rectForStar2), CGRectGetMinY(rectForStar2));
    CGContextAddArc(context, CGRectGetMaxX(rectForStar2), CGRectGetMinY(rectForStar2), CGRectGetHeight(rectForStar)/2, M_PI, 0, NO);
    CGContextStrokePath(context);
}

-(NSArray*)getStarVertex:(CGRect)rect vertexCount:(NSInteger)count radiusStar:(CGFloat)radius{
    NSArray *arrayPoints = [[NSArray alloc] init];
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    CGFloat anglePoint = 360/count;
    NSInteger pointPass = count%2 ? 2 : 1;
    CGFloat angleTurn = anglePoint * pointPass * M_PI/180;
    
    for (NSInteger index = 1; index < count + 2; index++) {
        
        CGFloat vertexX = centerPoint.x + radius * sinf(index * angleTurn);
        CGFloat vertexY = centerPoint.y - radius * cosf(index * angleTurn);
        
        CGPoint nextPoint = CGPointMake(vertexX, vertexY);
        arrayPoints = [arrayPoints arrayByAddingObject:[NSValue valueWithCGPoint:nextPoint]];
    }
    return arrayPoints;
}

-(NSArray*)sortVertexAroundCenter:(NSArray *)array centerPoint:(CGPoint)center{
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSValue *val1, NSValue *val2) {
        
        if (val1.CGPointValue.y < center.y &&
            val2.CGPointValue.y < center.y) {
            if (val1.CGPointValue.x < val2.CGPointValue.x) {
                return NSOrderedAscending;
            }
            if (val1.CGPointValue.x > val2.CGPointValue.x) {
                return NSOrderedDescending;
            }
        }
        
        if (val1.CGPointValue.y > center.y &&
            val2.CGPointValue.y > center.y) {
            if (val1.CGPointValue.x > val2.CGPointValue.x) {
                return NSOrderedAscending;
            }
            if (val1.CGPointValue.x < val2.CGPointValue.x) {
                return NSOrderedDescending;
            }
        }
        
        if  (val1.CGPointValue.y < val2.CGPointValue.y) {
            return NSOrderedAscending;
        }
        
        if  (val1.CGPointValue.y > val2.CGPointValue.y) {
            return NSOrderedDescending;
        }
        
        return NSOrderedSame;
    }];
    return array;
}

@end
