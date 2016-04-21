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
    NSLog(@"my temperature - %f",patient.temperature);
    
    BOOL feelPreson = [self chekTemperaturePatient:patient];
    
    [patient myHurts];
    
    [self treatPatientHurt:patient];
    
    if (patient.temperature >37.f) {
        
        if (!self.patientsList) {
            self.patientsList = [[NSArray alloc] init];
        }
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    patient.name,@"patient",
                                    @(patient.temperature), @"temperature",
                                    [self returnStringIllness:patient.illness], @"illness",
                                    [self returnStringBodyPart:patient.partBody],@"partBody",
                                    patient.pill ? @"YES" : @"NO",@"takePill",
                                    patient.shot ? @"YES" : @"NO",@"makeShot",
                                    nil];

        self.patientsList = [self.patientsList arrayByAddingObject:dictionary];
    }
    
    return feelPreson;
}

-(NSString *)returnStringBodyPart:(SVPartBody)partbody{
    NSString *partBodyString;
    switch (partbody) {
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
            partBodyString = @"Unknown";
            break;
    }
    return partBodyString;
}

-(NSString *)returnStringIllness:(IllnessType)illnessType{
    NSString *illnessString;
    switch (illnessType) {
        case IllnessTypeVirus:
            illnessString = @"Virus";
            break;
        case IllnessTypeFracture:
            illnessString = @"Fracture";
            break;
        case IllnessTypeCardiovascular:
            illnessString = @"Head";
            break;
            
        default:
            illnessString = @"Unknown";
            break;
    }
    return illnessString;
}

-(BOOL)chekTemperaturePatient:(SVPatient *)patient{
    if (patient.temperature >37.f && patient.temperature <38.f) {
        [patient takePill];
    }else if(patient.temperature > 38.f){
        [patient makeShot];
    }else{
        NSLog(@"I'm feeling good - %@ - My temperature %f", patient.name, patient.temperature);
    }
    return YES;
}

-(void)treatPatientHurt:(SVPatient *)patient{
    NSString *partBodyString = [self returnStringBodyPart:patient.partBody];
    NSLog(@"treat %@", partBodyString);
}

-(void)reportList{
    if (self.patientsList) {
        NSLog(@"array patient %@", self.patientsList);
        self.patientsList = [self sortPatientsList:self.patientsList];
        NSLog(@"array patient %@", self.patientsList);
    }else{
        NSLog(@"All patients is healthy");
    }
}
-(NSArray *)sortPatientsList:(NSArray *)array{
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"partBody" ascending:YES];
    array = [array sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    return array;
}

@end
