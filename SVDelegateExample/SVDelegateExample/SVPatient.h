//
//  SVPatient.h
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

@protocol SVPatientDelegate;

typedef NS_ENUM(NSInteger, IllnessType){
    IllnessTypeVirus,
    IllnessTypeFracture,
    IllnessTypeCardiovascular
};

@interface SVPatient : NSObject

@property(weak, nonatomic)id <SVPatientDelegate>delegate;
@property(strong, nonatomic)NSString *name;
@property(assign, nonatomic)CGFloat temperature;
@property(assign, nonatomic)IllnessType illness;

-(BOOL)howYouFeel;
-(void)takePill;
-(void)makeShot;

@end

@protocol SVPatientDelegate <NSObject>

-(BOOL)patientBadFeel:(SVPatient *)patient;

@end
