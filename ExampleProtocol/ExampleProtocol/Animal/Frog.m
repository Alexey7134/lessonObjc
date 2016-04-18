//
//  Frog.m
//  ExampleProtocol
//
//  Created by Viktor Siedov on 16.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "Frog.h"

@implementation Frog

-(void)startJumping{
    NSLog(@"Frog start jumping");
}
-(BOOL)stopJumping{
    return arc4random()%2;
}
-(void)startSwim{
    NSLog(@"Frog start swiming");
}
-(BOOL)stopSwim{
    return arc4random()%2;
}

@end
