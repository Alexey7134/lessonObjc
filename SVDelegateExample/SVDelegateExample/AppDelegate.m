//
//  AppDelegate.m
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVPatient.h"
#import "SVDoctor.h"
#import "SVFriend.h"

const NSInteger MAX_PATIENT = 20;
const CGFloat NORMAL_TEMPERATURE = 36.6;
const NSInteger MAX_DISSATISFIED_PATIENTS = 5;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *listPatients = [[NSArray alloc] init];
    
    SVDoctor *doctor = [[SVDoctor alloc] init];
    doctor.name = @"Vasiliy";
    
    
    SVFriend *friend = [[SVFriend alloc] init];
    
    
    //create patients list
    for (NSInteger i = 0; i < MAX_PATIENT; i++) {
        SVPatient *patient = [[SVPatient alloc] init];
        patient.name = [NSString stringWithFormat:@"Andrey%d", i];
        patient.temperature = NORMAL_TEMPERATURE + arc4random()%4;
        patient.illness = arc4random()%4;
        patient.partBody =  arc4random()%5;
        if (arc4random()%2) {
            patient.delegate = friend;
        }else{
            patient.delegate = doctor;
        }
        listPatients = [listPatients arrayByAddingObject:patient];
    }
    
    
    for (SVPatient *patient in listPatients) {
        NSLog(@"how you feel %@? -  %@", patient.name, [patient howYouFeel] ? @"Good" : @"Bad");
    }
    
    [doctor reportList];
    
    
    //doctor 2
    NSLog(@">>>>doctor2<<<<");
    NSArray *arrayDissatisfiedPatients = @[];
    arrayDissatisfiedPatients = [doctor returnArrayDissatisfied:doctor.patientsList];
    SVDoctor *doctor2 = [[SVDoctor alloc] init];
    doctor2.name = @"Ivan";
    if([arrayDissatisfiedPatients count] > MAX_DISSATISFIED_PATIENTS){
        for (NSDictionary *dictionaryPatient in arrayDissatisfiedPatients) {
            SVPatient *patient = [dictionaryPatient valueForKey:@"patient"];
            patient.delegate = doctor2;
        }
    }
    
    NSLog(@"change delegate to doctor 2 %@", arrayDissatisfiedPatients);
    
    
    return YES;
}
@end
