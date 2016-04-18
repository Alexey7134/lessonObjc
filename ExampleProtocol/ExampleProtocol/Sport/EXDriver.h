//
//  EXDriver.h
//  EXPeople
//
//  Created by Viktor Siedov on 06.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface EXDriver : NSObject

@property(assign, nonatomic)NSInteger old;

-(void)moved;
-(void)finished;

@end
