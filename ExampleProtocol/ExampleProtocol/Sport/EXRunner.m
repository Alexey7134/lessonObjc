//
//  EXRunner.m
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXRunner.h"

@implementation EXRunner

-(void)startRun{
    NSLog(@"People runner start running");
    
}
-(BOOL)stopRun{
    return arc4random()%2;
}

-(void)howYouRun{
    NSLog(@"I run very fast!");
}

@end
