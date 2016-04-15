//
//  SwimmerProtocol.h
//  ExampleProtocol
//
//  Created by Viktor Siedov on 14.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SwimmerProtocol <NSObject>

@required
@property(strong, nonatomic)CGFloat distanceSwim;
@property(strong, nonatomic)NSInteger poolLenght;
-(void)startSwim;
-(BOOL)stopSwim;
@optional
-(void)howYouswimming;

@end
