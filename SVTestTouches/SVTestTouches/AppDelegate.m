//
//  AppDelegate.m
//  SVTestTouches
//
//  Created by Viktor Siedov on 03.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createUI];
    return YES;
}

-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *vc = [[MainViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

@end
