//
//  AppDelegate.m
//  TestThread
//
//  Created by Viktor Siedov on 16.06.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    for (NSInteger i = 0; i < 5; i++) {
        SVStudent *student = [[SVStudent alloc] init];
        [student guessAnswer:34 range:1000];
    }
    
    
//    for (NSInteger i = 0; i < 100; i++) {
//        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(makeFunc) object:nil];
//        thread.name = [NSString stringWithFormat:@"thread%li", i];
//        [thread start];
//    }
    
    
    
    return YES;
}

//-(void)makeFunc{
//    @autoreleasepool {
//        
//        double startTime = CACurrentMediaTime();
//        
//        NSLog(@"start thread = %@", [[NSThread currentThread] name]);
//        
//        @synchronized (self) {
//        
//            for (NSInteger i = 0; i < 10000000; i++) {
//                //NSLog(@"%li", (long)i);
//            }
//            
//        
//            NSLog(@" thread end = %@ time = %f", [[NSThread currentThread] name],CACurrentMediaTime() - startTime);
//        }
//    }
//}

@end
