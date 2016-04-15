//
//  EXDriver.m
//  EXPeople
//
//  Created by Viktor Siedov on 06.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXDriver.h"

@implementation EXDriver
-(void)moved
{
    [super moved];
    NSLog(@"person drive");
}
-(void)finished
{
    NSLog(@"person finished");
}
@end
