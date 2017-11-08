//
//  AppDelegate.m
//  SVTableDynamic
//
//  Created by Viktor Siedov on 07.11.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVMainTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createUI];
    return YES;
}

-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[SVMainTableViewController alloc] init];
    [self.window makeKeyAndVisible];
}

@end
