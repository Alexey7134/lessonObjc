//
//  RunnerProtocol.h
//  ExampleProtocol
//
//  Created by Viktor Siedov on 14.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RunnerProtocol <NSObject>

@required
@property(assign, nonatomic)CGFloat distanceRun;
@property(assign, nonatomic)NSInteger roundRun;
-(void)startRun;
-(BOOL)stopRun;

@optional
-(void)howYouRun;

@end
