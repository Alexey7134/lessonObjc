//
//  AppDelegate.m
//  PrimitiveType
//
//  Created by Viktor Siedov on 24.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import <Foundation/Foundation.h>

@interface AppDelegate ()

//typedef NSInteger MyTypeData;

//enum GenderMode{
//    GenderModeMale,
//    GenderModeFemale
//};
//typedef enum GenderMode GenderMode;

//after iOS6 new enum NS_ENUM
//typedef NS_ENUM(NSInteger, GenderMode){
//    GenderModeMale,
//    GenderModeFemale
//};

//struct SizeHome{
//    CGFloat height;
//    CGFloat weidth;
//    CGFloat depth;
//};
//
//typedef struct SizeHome SizeHome;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    BOOL boolVar = YES;
    NSInteger intVar = 2;
    NSUInteger uintVar = 10;
    CGFloat floatVar = .2f;
    double doubleVar = 6.5;
    
    //NSLog(@"boolVar = %d, intVar = %ld, uintVar = %ld, floatVar = %f, doubleVar = %f",boolVar,intVar, uintVar, floatVar, doubleVar);
    //NSLog(@"boolVar = %ld, intVar = %ld, uintVar = %ld, floatVar = %ld, doubleVar = %ld",sizeof(boolVar),sizeof(intVar), sizeof(uintVar), sizeof(floatVar), sizeof(doubleVar));
//    NSInteger a = doubleVar;
//    NSLog(@"a = %ld", a);
    
    
    // example how work typedef
   // MyTypeData c = 2;
    
    #pragma marks - UIViewAutoresizing
    // example how use enumaration in Objective C
//    GenderMode people = arc4random()%2;
//    NSLog(@"people number enum = %ld", people);
//    NSLog(@"people = %@", people == GenderModeMale ? @"Male" : @"Female");

//    SizeHome home1;
//    home1.depth = 20.35f;
//    home1.height = 4.f;
//    home1.weidth = 20.34f;
    
    CGPoint point = CGPointMake(arc4random()%6, arc4random()%6);
//    //CGSize size = CGSizeMake(2, 2);
//    
//    CGRect rect = CGRectMake(2, 3, 2, 2);
//    NSLog(@"rect x = %f , y = %f, weidth = %f, height = %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//    NSLog(@"point x = %f , y = %f", point.x, point.y);
//    
//    NSLog(@"rect contains point = %@", CGRectContainsPoint(rect, point) ? @"YES" : @"NO");
    
    
    NSInteger a = 2;
    
    NSInteger b = a;
    
    b = 10;
    
    NSLog(@"%ld", a);
    
    NSInteger *c  = &a;
    *c = 8;
    
    NSLog(@"a = %ld",a);
    
    NSNumber *boolNumber = [NSNumber numberWithBool:boolVar];
    NSNumber *intNumber = [NSNumber numberWithInteger:intVar];
    NSNumber *floatNumber = [NSNumber numberWithFloat:floatVar];
    NSLog(@"boolVar = %d, intVar = %ld, floatVar = %f", boolNumber.boolValue, intNumber.integerValue, floatNumber.floatValue);
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    NSLog(@"point %f",  pointValue.CGPointValue.x);
    
    return YES;
}

@end
