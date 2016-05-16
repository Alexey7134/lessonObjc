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

@interface AppDelegate (){
    NSNotificationCenter *nc;
}

@property(strong, nonatomic)SVGovernment *government;
@property(strong, nonatomic)NSArray *people;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
    [nc addObserver:self selector:@selector(applicationDidEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [nc addObserver:self selector:@selector(applicationWillEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [nc addObserver:self selector:@selector(applicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [nc addObserver:self selector:@selector(applicationWillTerminateNotification:) name:UIApplicationWillTerminateNotification object:nil];
    
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
    NSLog(@"It's original function %s",__PRETTY_FUNCTION__);
}
-(void)applicationWillResignActiveNotification:(NSNotification *)notification{
    NSLog(@"It's notification function %s", __PRETTY_FUNCTION__);
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"It's original function AppDelegate %s",__PRETTY_FUNCTION__);
}
- (void)applicationDidEnterBackgroundNotification:(NSNotification *)notification {
   NSLog(@"It's notification function %s", __PRETTY_FUNCTION__);
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"It's original function AppDelegate %s",__PRETTY_FUNCTION__);
}
- (void)applicationWillEnterForegroundNotification:(NSNotification *)notification {
    NSLog(@"It's notification function %s", __PRETTY_FUNCTION__);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"It's original function AppDelegate %s",__PRETTY_FUNCTION__);
}
- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification {
    NSLog(@"It's notification function %s", __PRETTY_FUNCTION__);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"It's original function AppDelegate %s",__PRETTY_FUNCTION__);
}
- (void)applicationWillTerminateNotification:(NSNotification *)notification {
    NSLog(@"It's notification function %s", __PRETTY_FUNCTION__);
}


- (void)dealloc
{
    [nc removeObserver:self];
}

@end
