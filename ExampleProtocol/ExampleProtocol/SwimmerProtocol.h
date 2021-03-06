//
//  SwimmerProtocol.h
//  ExampleProtocol
//
//  Created by Viktor Siedov on 14.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol SwimmerProtocol <NSObject>

@required
@property(assign, nonatomic)CGFloat distanceSwim;
@property(assign, nonatomic)NSInteger poolLenght;
-(void)startSwim;
-(BOOL)stopSwim;
@optional
-(void)howYouswimming;

@end
