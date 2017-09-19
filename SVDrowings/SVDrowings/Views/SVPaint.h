//
//  SVPaint.h
//  SVDrowings
//
//  Created by Viktor Siedov on 19.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVPaint : UIImageView

-(void)beganDrawLine:(CGPoint)point;
-(void)changedDrawLine:(CGPoint)point;
-(void)endDrawLine:(CGPoint)point;

@end
