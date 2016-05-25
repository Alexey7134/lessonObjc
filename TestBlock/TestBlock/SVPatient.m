//
//  SVPatient.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//



#import "SVPatient.h"

NSString *const SVPatientNameReportKey = @"SVPatientNameReportKey";
NSString *const SVPatientTemperatureReportKey = @"SVPatientTemperatureReportKey";
NSString *const SVPatientBodyPartReportKey = @"SVPatientBodyPartReportKey";
NSString *const SVPatientIllReportKey = @"SVPatientIllReportKey";

@interface SVPatient (){
    NSDictionary *report;
}

@property (copy, nonatomic)HealthPatientBlock blockPatient;

@end

@implementation SVPatient

-(instancetype)init{
    self = [super init];
    return self;
}

-(NSString *)returnStringBodyPart:(SVPartBody)partBody{
    NSString *partBodyString;
    switch (partBody) {
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
            partBodyString = @"Some place";
            break;
    }
    return partBodyString;
}

-(void)myHurts{
    NSLog(@"My hurts in %@", [self returnStringBodyPart:self.partBody]);
}

-(BOOL)howYouFeel{
    BOOL feelGood = arc4random()%2;
    
    return feelGood;
}

-(void)takePill{
    NSLog(@"I take pill my name %@", self.name);
    self.pill = YES;
    [self assessmenAfterTreatments];
}
-(void)makeShot{
    NSLog(@"I take shot my name %@", self.name);
    self.shot = YES;
    [self assessmenAfterTreatments];
}

-(void)assessmenAfterTreatments{
    self.assessmentDoctor = arc4random()%2;
}

-(void)returnReportPatient{
    
    __weak SVPatient *patientSelf = self;
    _blockPatient = ^{
        NSLog(@"report patient %@",patientSelf.name);
        
    };
    //return _blockPatient;
}

@end
