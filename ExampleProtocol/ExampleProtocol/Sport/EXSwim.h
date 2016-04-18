//
//  EXSwim.h
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SwimmerProtocol.h"

@interface EXSwim : NSObject<SwimmerProtocol>

@property(assign, nonatomic)CGFloat distanceSwim;
@property(assign, nonatomic)NSInteger poolLenght;
-(void)startSwim;
-(BOOL)stopSwim;

-(void)howYouswimming;

@end
