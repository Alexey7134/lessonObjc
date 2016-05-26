//
//  AppDelegate.m
//  TestBlock
//
//  Created by Viktor Siedov on 23.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVStudent.h"
#import "SVPatient.h"

typedef void(^ReturnStringBlock)(NSString*);
typedef void (^PatientHealthBlock)(id patient);

const NSInteger MAX_PATIENT = 20;
const CGFloat NORMAL_TEMPERATURE = 36.6;

@interface AppDelegate (){
    NSArray *students;
    NSArray *patients;
    NSArray *patientsList;
    PatientHealthBlock patientHealthblock;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    void (^testBlock)(void) = ^(void){
        NSLog(@"Test block");
    };
    
    testBlock();
    */
    ReturnStringBlock stringBlock = ^(NSString* someString){
        NSLog(@"%@", someString);
    };
    
    stringBlock(@"It is test block string");
    
    [self blockTestMethod:stringBlock];
    
    students = [self createStudents];
    //NSLog(@"-----------------------------Before sorted--------------------------------");
    [self showArrayStudents:students];
    students = [self sortedStudentByLastnameAndName:students];
   // NSLog(@"-----------------------------After sorted--------------------------------");
    [self showArrayStudents:students];
    
    __weak AppDelegate *appDelegateSelf = self;
    patientHealthblock = ^(SVPatient *patient) {
        [patient myHurts];
        BOOL youAreOkay = [appDelegateSelf chekTemperaturePatient:patient];
        if (youAreOkay) {
            return;
        }
        [appDelegateSelf addToPatientsList:patient appSelf:appDelegateSelf];
    };
    
    patients = [self createPatientList];
    
    //[self goToDoctor];
    
    return YES;
}

//-(void)goToDoctor{
//    [self patientCheckHealth:patientHealthblock];
//}

-(void)blockTestMethod:(void(^)(NSString * nameString))block{
    block([NSString stringWithFormat:@"%@%s",@"It is test block string method ",__PRETTY_FUNCTION__]);
}

-(NSArray*)createStudents{
    NSArray *arrayStudents = [[NSArray alloc]init];
    for (NSInteger i = 0; i < 10; i++) {
        SVStudent *student = [[SVStudent alloc] init];
        student.name = [NSString stringWithFormat:@"Viktor%i",arc4random()%100];
        student.lastname = [NSString stringWithFormat:@"Apple%i",arc4random()%6];
        
        arrayStudents = [arrayStudents arrayByAddingObject:student];
    }
    return arrayStudents;
}

-(NSArray *)sortedStudentByLastnameAndName:(NSArray*)array{
    array = [array sortedArrayUsingComparator:^NSComparisonResult(SVStudent *student1, SVStudent *student2) {
        if (student1.lastname == nil ||
            student1.name == nil ||
            student2.lastname == nil ||
            student2.name == nil) {
            return (NSComparisonResult)NSOrderedSame;
        }
        
        if ([student1.lastname isEqualToString:student2.lastname]) {
            return [student1.name compare:student2.name];
        }else{
            return [student1.lastname compare:student2.lastname];
        }
        
    }];
    return array;
}

-(void)showArrayStudents:(NSArray *)array{
    for (NSInteger i = 0; i < [array count]; i++) {
       // SVStudent *student = [array objectAtIndex:i];
        //NSLog(@"student lastname = %@, name = %@",student.lastname, student.name );
    }
}

//-(void)patientCheckHealth:(PatientHealthBlock)block{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    for (NSInteger i = 0; i < [patients count]; i++) {
//        block([patients objectAtIndex:i]);
//    }
//    
//}

-(NSArray *)createPatientList{
    //create patients list
    NSArray *array = [[NSArray alloc] init];
    for (NSInteger i = 0; i < MAX_PATIENT; i++) {
        SVPatient *patient = [[SVPatient alloc] init];
        patient.name = [NSString stringWithFormat:@"Viktor%d", i];
        patient.blockPatient = patientHealthblock;
        array = [array arrayByAddingObject:patient];
    }
    return array;
}

-(BOOL)chekTemperaturePatient:(SVPatient *)patient{
    if (patient.temperature >37.f && patient.temperature <38.f) {
        NSLog(@"I am ill %@. My temperature %f.", patient.name, patient.temperature);
        [patient takePill];
        return NO;
    }else if(patient.temperature > 38.f){
        NSLog(@"I am ill %@. My temperature %f.", patient.name, patient.temperature);
        [patient makeShot];
        return NO;
    }else{
        NSLog(@"I am okay %@. My temperature %f. I can go at home. ", patient.name, patient.temperature);
        return YES;
    }
    
}

-(void)addToPatientsList:(SVPatient *)patient appSelf:(AppDelegate *)appDelegateSelf{
        
    if (!patientsList) {
        patientsList = [[NSArray alloc] init];
    }
        
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    patient.name,SVPatientNameReportKey,
                                    @(patient.temperature), SVPatientTemperatureReportKey,
                                    [appDelegateSelf returnStringIllness:patient.illness], SVPatientIllReportKey,
                                    [patient returnStringBodyPart:patient.partBody],SVPatientBodyPartReportKey,
                                    patient.pill ? @"YES" : @"NO",@"takePill",
                                    patient.shot ? @"YES" : @"NO",@"makeShot",
                                    patient.assessmentDoctor ? @"YES" : @"NO",@"assessmentDoctor",
                                    patient,@"patient",
                                    nil];
        
    patientsList = [patientsList arrayByAddingObject:dictionary];
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


@end
