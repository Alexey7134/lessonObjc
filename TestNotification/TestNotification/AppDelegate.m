//
//  AppDelegate.m
//  TestNotification
//
//  Created by Viktor Siedov on 06.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVGovernment.h"
#import "SVdoctor.h"
#import "SVPensionPerson.h"
#import "SVBusinesPerson.h"

@interface AppDelegate ()

@property(strong, nonatomic)SVGovernment *government;
@property(strong, nonatomic)NSArray *people;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _people = [[NSArray alloc]init];
    _government = [[SVGovernment alloc] init];
    SVdoctor *doctor = [[SVdoctor alloc]init];
    SVPensionPerson *pensionPerson = [[SVPensionPerson alloc] init];
    SVBusinesPerson *businesPerson = [[SVBusinesPerson alloc] init];
    _people = [_people arrayByAddingObject:doctor];
    _people = [_people arrayByAddingObject:pensionPerson];
    _people = [_people arrayByAddingObject:businesPerson];
    
    
    doctor.salary = _government.salary;
    pensionPerson.pension = _government.pension;
    businesPerson.tax = _government.tax;
    
    _government.price = _government.price + arc4random()%50;
    _government.salary = _government.salary + arc4random()%50;
    _government.pension = _government.pension + arc4random()%50;
    _government.tax = _government.tax + arc4random()%50;
    
    _government.price = _government.price +arc4random()%500;
    _government.price = _government.price +arc4random()%500;
    _government.price = _government.price +arc4random()%500;
    
    _government.salary = _government.salary + arc4random()%100;
    _government.pension = _government.pension + arc4random()%100;
    _government.tax = _government.tax + arc4random()%100;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
