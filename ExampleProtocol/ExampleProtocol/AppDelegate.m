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
#import "EXFrog.h"
#import "EXCat.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    EXJumper *jumper = [[EXJumper alloc] init];
    jumper.maxHeight = .47f;
    jumper.maxLenght = 2.4f;
    
    EXRunner *runner = [[EXRunner alloc] init];
    
    
    return YES;
}


@end
