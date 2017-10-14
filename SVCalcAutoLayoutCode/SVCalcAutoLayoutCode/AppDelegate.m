//
//  AppDelegate.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 10.10.17.
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
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    SVMainViewController *vc = [[SVMainViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}


@end
