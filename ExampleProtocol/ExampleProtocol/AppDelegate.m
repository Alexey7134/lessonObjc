//
//  AppDelegate.m
//  ExampleProtocol
//
//  Created by Viktor Siedov on 14.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "EXJumper.h"
#import "EXRunner.h"
#import "EXSwim.h"
#import "Frog.h"
#import "EXLazyPerson.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    EXJumper *jumper = [[EXJumper alloc] init];
    jumper.maxLenght = 6.4f;
    jumper.maxHeight = 5.f;
    
    EXRunner *runner = [[EXRunner alloc] init];
    runner.roundRun = 4;
    runner.distanceRun = 3.5f;
    EXRunner *runner1 = [[EXRunner alloc] init];
    
    Frog *frog = [[Frog alloc] init];
    
    EXSwim *swimmer = [[EXSwim alloc] init];
    
    EXLazyPerson *lazyPerson = [[EXLazyPerson alloc] init];
    
    
    NSArray *allPeoples = [NSArray arrayWithObjects:jumper,runner,frog,swimmer,lazyPerson,runner1, nil];
    for (id object in allPeoples) {
        if ([object conformsToProtocol:@protocol(JumperProtocol)]) {
            id <JumperProtocol>jumper = object;
            [jumper startJumping];
            NSLog(@"Will you stopped? - %@",[jumper stopJumping] ? @"YES" : @"NO");
            if ([jumper respondsToSelector:@selector(howYouJumping)]) {
                [jumper howYouJumping];
            }
            
        }
        if ([object conformsToProtocol:@protocol(RunnerProtocol)]) {
            id <RunnerProtocol>runner = object;
            [runner startRun];
            NSLog(@"Will you stopped? - %@",[runner stopRun] ? @"YES" : @"NO");
            if ([runner respondsToSelector:@selector(howYouRun)]) {
                [runner howYouRun];
            }
            
        }
        if ([object conformsToProtocol:@protocol(SwimmerProtocol)]) {
            id <SwimmerProtocol>swimmer = object;
            [swimmer startSwim];
            NSLog(@"Will you stopped? - %@",[swimmer stopSwim] ? @"YES" : @"NO");
            if ([swimmer respondsToSelector:@selector(howYouswimming)]) {
                [swimmer howYouswimming];
            }
            
        }
        if (![object conformsToProtocol:@protocol(JumperProtocol)] &&
            ![object conformsToProtocol:@protocol(RunnerProtocol)] &&
            ![object conformsToProtocol:@protocol(SwimmerProtocol)]) {
            
            NSLog(@"It's lazy person !!! = %@ ", object);
            
        }
    }
    

    
    return YES;
}


@end
