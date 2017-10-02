//
//  AppDelegate.m
//  TestGesture
//
//  Created by Viktor Siedov on 30.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createUI];
    return YES;
}
-(void)createUI{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SVViewController *vc = [[SVViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}


@end
