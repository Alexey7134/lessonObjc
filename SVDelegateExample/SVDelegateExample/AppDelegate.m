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

const NSInteger MAX_PATIENT = 5;
const CGFloat NORMAL_TEMPERATURE = 36.6;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *listPatients = [[NSArray alloc] init];
    
    SVDoctor *doctor = [[SVDoctor alloc] init];
    
    //create patients list
    for (NSInteger i = 0; i < MAX_PATIENT; i++) {
        SVPatient *patient = [[SVPatient alloc] init];
        patient.name = [NSString stringWithFormat:@"Vova%d", i];
        patient.temperature = NORMAL_TEMPERATURE + arc4random()%4;
        patient.illness = arc4random()%4;
        patient.delegate = doctor;
        listPatients = [listPatients arrayByAddingObject:patient];
    }
    
    
    for (SVPatient *patient in listPatients) {
        NSLog(@"how you feel? - %@ : say \"%@\"", [patient howYouFeel] ? @"Good" : @"Bad", patient.name);
    }
    
    return YES;
}
@end
