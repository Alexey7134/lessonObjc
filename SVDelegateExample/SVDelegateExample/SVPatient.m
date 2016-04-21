//
//  SVPatient.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVPatient.h"

@implementation SVPatient

-(instancetype)init{
    self = [super init];
    return self;
}

-(NSString *)returnStringBodyPart{
    NSString *partBodyString;
    switch (self.partBody) {
        case SVPartBodyLeg:
            partBodyString = @"Leg";
            break;
        case SVPartBodyHand:
            partBodyString = @"Hand";
            break;
        case SVPartBodyHead:
            partBodyString = @"Head";
            break;
        case SVPartBodyTrunk:
            partBodyString = @"Trunk";
            break;
            
        default:
            partBodyString = @"Unknow";
            break;
    }
    return partBodyString;
}

-(void)myHurts{
    NSLog(@"My hurts in %@", [self returnStringBodyPart]);
}

-(BOOL)howYouFeel{
    BOOL feelGood = arc4random()%2;
    if (!feelGood) {
        feelGood = [self.delegate patientBadFeel:self];
    }
    return feelGood;
}

-(void)takePill{
    NSLog(@"I take pill my name %@", self.name);
    self.pill = YES;
}
-(void)makeShot{
    NSLog(@"I take shot my name %@", self.name);
    self.shot = YES;
}

@end
