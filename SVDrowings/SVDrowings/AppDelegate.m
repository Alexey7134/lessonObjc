//
//  AppDelegate.m
//  SVDrowings
//
//  Created by Viktor Siedov on 05.08.17.
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
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
}


@end
