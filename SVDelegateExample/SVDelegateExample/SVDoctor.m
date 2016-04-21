//
//  SVDoctor.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVDoctor.h"

@implementation SVDoctor

-(BOOL)patientBadFeel:(SVPatient *)patient{
    NSLog(@"Doctor, help me! My name is %@",patient.name);
    NSLog(@"patient temperature - %f",patient.temperature);
    BOOL feelPreson = YES;
    if (patient.temperature >37.f && patient.temperature <38.f) {
        [patient takePill];
    }else if(patient.temperature > 38.f){
        [patient makeShot];
    }else{
        NSLog(@"I'm feeling good - %@ - My temperature %f", patient.name, patient.temperature);
        feelPreson = YES;
    }
    return feelPreson;
}

@end
