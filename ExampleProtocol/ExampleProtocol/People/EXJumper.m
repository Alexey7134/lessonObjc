//
//  EXJumper.m
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXJumper.h"

@implementation EXJumper
-(void)moved
{
    NSLog(@"person jump");
}

#pragma marks - JumperProtocol 
-(void)startJumping{
    NSLog(@"start jumping");
}
-(BOOL)stopJumping{
    return arc4random()%2;
}
@end
