//
//  EXDriver.h
//  EXPeople
//
//  Created by Viktor Siedov on 06.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXPerson.h"

@interface EXDriver : EXPerson

@property(assign, nonatomic)NSInteger old;

-(void)moved;
-(void)finished;

@end
