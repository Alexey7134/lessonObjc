//
//  EXRunner.h
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXPerson.h"
#import "RunnerProtocol.h"

@interface EXRunner : EXPerson <RunnerProtocol>

@property(assign, nonatomic)CGFloat distanceRun;
@property(assign, nonatomic)NSInteger roundRun;
-(void)startRun;
-(BOOL)stopRun;

-(void)howYouRun;

-(void)moved;
@end
