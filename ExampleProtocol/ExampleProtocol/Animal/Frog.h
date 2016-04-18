//
//  Frog.h
//  ExampleProtocol
//
//  Created by Viktor Siedov on 16.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JumperProtocol.h"
#import "SwimmerProtocol.h"

@interface Frog : NSObject <JumperProtocol, SwimmerProtocol>
@property(assign, nonatomic)CGFloat maxHeight;
@property(assign, nonatomic)CGFloat maxLenght;
@property(assign, nonatomic)CGFloat distanceSwim;
@property(assign, nonatomic)NSInteger poolLenght;
-(void)startSwim;
-(BOOL)stopSwim;
-(void)startJumping;
-(BOOL)stopJumping;

@end
