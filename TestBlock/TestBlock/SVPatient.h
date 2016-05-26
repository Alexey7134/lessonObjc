//
//  SVPatient.h
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

typedef NS_ENUM(NSInteger, IllnessType){
    IllnessTypeVirus,
    IllnessTypeFracture,
    IllnessTypeCardiovascular
};

typedef NS_ENUM(NSInteger, SVPartBody){
    SVPartBodyHead,
    SVPartBodyLeg,
    SVPartBodyTrunk,
    SVPartBodyHand
};

extern NSString *const SVPatientNameReportKey;
extern NSString *const SVPatientTemperatureReportKey;
extern NSString *const SVPatientBodyPartReportKey;
extern NSString *const SVPatientIllReportKey;

typedef void (^HealthPatientBlock)(id patient);

@interface SVPatient : NSObject

@property(strong, nonatomic)NSString *name;
@property(assign, nonatomic)CGFloat temperature;
@property(assign, nonatomic)IllnessType illness;
@property(assign, nonatomic)SVPartBody partBody;
@property(assign, nonatomic)BOOL pill;
@property(assign, nonatomic)BOOL shot;
@property(assign, nonatomic)BOOL assessmentDoctor;

@property (copy, nonatomic)HealthPatientBlock blockPatient;


-(void)takePill;
-(void)makeShot;
-(void)myHurts;
-(void)returnReportPatient;
-(NSString *)returnStringBodyPart:(SVPartBody)partBody;

@end
