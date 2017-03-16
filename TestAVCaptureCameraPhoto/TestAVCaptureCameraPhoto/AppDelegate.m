//
//  AppDelegate.m
//  TestAVCaptureCameraPhoto
//
//  Created by Viktor Siedov on 05.03.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "CameraViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self createUI];
    return YES;
}

-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CameraViewController *mainViewController = [[CameraViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
}

@end
