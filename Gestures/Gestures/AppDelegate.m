//
//  AppDelegate.m
//  Gestures
//
//  Created by Viktor Siedov on 03.06.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self createUI];
    
    return YES;
}


-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *mainViewController = [[ViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
}


@end
