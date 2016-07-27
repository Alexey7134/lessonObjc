//
//  SVStudent.m
//  TestThread
//
//  Created by Viktor Siedov on 20.06.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "SVStudent.h"
@import QuartzCore;
@interface SVStudent(){
    double startTime;
}
@end

@implementation SVStudent

-(void)guessAnswer:(NSInteger)number range:(NSInteger)range{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//dispatch_get_main_queue();//dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        startTime = CACurrentMediaTime();
        [self number:number range:range];
    });
    

}

-(void)number:(NSInteger)number range:(NSInteger)range{
    @autoreleasepool {
        NSInteger newNumber = arc4random()%range;
        if (newNumber == number) {
            NSLog(@"it is number %li, time answer %f", newNumber, CACurrentMediaTime() - startTime);
        }else{
            //NSLog(@"time %f", CACurrentMediaTime() - startTime);
            [self number:number range:range];
        }
    }
}

@end
