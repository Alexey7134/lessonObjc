//
//  AppDelegate.m
//  TestBlock
//
//  Created by Viktor Siedov on 23.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"

typedef void(^ReturnStringBlock)(NSString*);

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*
    void (^testBlock)(void) = ^(void){
        NSLog(@"Test block");
    };
    
    testBlock();
    */

    
    ReturnStringBlock stringBlock = ^(NSString* someString){
        NSLog(@"%@", someString);
    };
    
    stringBlock(@"It is test block string");
    
    [self blockTestMethod:stringBlock];
    
    
    
    return YES;
}

-(void)blockTestMethod:(void(^)(NSString * nameString))block{
    block([NSString stringWithFormat:@"%@%s",@"It is test block string method ",__PRETTY_FUNCTION__]);
}

@end
