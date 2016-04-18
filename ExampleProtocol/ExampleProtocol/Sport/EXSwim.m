//
//  EXSwim.m
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXSwim.h"

@implementation EXSwim

-(void)startSwim{
    NSLog(@"Swimmer start swim");
    
}
-(BOOL)stopSwim{
    return arc4random()%2;
}

-(void)howYouswimming{
    NSLog(@"I swimmer and I swiming very good");
}

@end
