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
    NSLog(@"patient temperature - %f  name - %@",patient.temperature,patient.name);
    BOOL feelPreson = NO;
    if (patient.temperature >37.f && patient.temperature <38.f) {
        [patient takePill];
    }else if(patient.temperature > 38.f){
        [patient makeShot];
    }else{
        NSLog(@"I'm feeling better - %@ - My temperature %f", patient.name, patient.temperature);
        feelPreson = YES;
    }
    return feelPreson;
}

@end
