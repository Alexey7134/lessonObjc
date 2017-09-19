//
//  AppDelegate.m
//  SVButton
//
//  Created by Viktor Siedov on 19.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createUI];
    return YES;
}

-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SVMainViewController *vc = [[SVMainViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
}


@end
