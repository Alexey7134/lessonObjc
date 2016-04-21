//
//  SVFriend.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 21.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVFriend.h"

@implementation SVFriend

#pragma mark - SVPatientDelegate

-(BOOL)patientBadFeel:(SVPatient *)patient{
    NSLog(@"My friend, help me! My name is %@",patient.name);
    NSLog(@"patient temperature - %f",patient.temperature);
    BOOL feelPreson = NO;
    if (patient.temperature >37.f && patient.temperature <38.f) {
        [patient takePill];
    }else if(patient.temperature > 38.f){
        [patient makeShot];
    }else{
        NSLog(@"Thank you friend, I'm feeling good  - %@ - My temperature %f", patient.name, patient.temperature);
        feelPreson = YES;
    }
    return feelPreson;
}

@end
