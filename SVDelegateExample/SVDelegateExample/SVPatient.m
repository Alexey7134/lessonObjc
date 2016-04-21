//
//  SVPatient.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVPatient.h"

@implementation SVPatient

-(BOOL)howYouFeel{
    BOOL feelGood = arc4random()%2;
    if (!feelGood) {
        feelGood = [self.delegate patientBadFeel:self];
    }
    return feelGood;
}

-(void)takePill{
    NSLog(@"I take pill my name :%@", self.name);
}
-(void)makeShot{
    NSLog(@"I take shot my name :%@", self.name);
}

@end
