//
//  JumperProtocol.h
//  ExampleProtocol
//
//  Created by Viktor Siedov on 14.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JumperProtocol <NSObject>

@required
@property(assign, nonatomic)CGFloat maxHeight;
@property(assign, nonatomic)CGFloat maxLenght;
-(void)startJumping;
-(BOOL)stopJumping;

@optional
-(void)howYouJumping;

@end
