//
//  SVLogicCalc.h
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 17.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SVLogicCalcDelegate;

@interface SVLogicCalc : NSObject

@property(weak,nonatomic)id<SVLogicCalcDelegate>delegate;
-(void)chooseFuncTag:(NSInteger)valueTag;

@end

@protocol SVLogicCalcDelegate <NSObject>

-(void)setLabelDisplayText:(NSString *)str;

@end
