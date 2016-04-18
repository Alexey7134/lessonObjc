//
//  EXJumper.m
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXJumper.h"

@implementation EXJumper

-(void)startJumping{
    NSLog(@"People jumper start jumping");
    
}
-(BOOL)stopJumping{
    return arc4random()%2;
}

-(void)howYouJumping{
    NSLog(@"I jumping always very nice!");
}


@end
