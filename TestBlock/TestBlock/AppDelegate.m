//
//  AppDelegate.m
//  TestBlock
//
//  Created by Viktor Siedov on 23.05.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVStudent.h"

typedef void(^ReturnStringBlock)(NSString*);

@interface AppDelegate (){
    NSArray *students;
}

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
    
    students = [self createStudents];
    NSLog(@"-----------------------------Before sorted--------------------------------");
    [self showArrayStudents:students];
    students = [self sortedStudentByLastnameAndName:students];
    NSLog(@"-----------------------------After sorted--------------------------------");
    [self showArrayStudents:students];
    
    return YES;
}

-(void)blockTestMethod:(void(^)(NSString * nameString))block{
    block([NSString stringWithFormat:@"%@%s",@"It is test block string method ",__PRETTY_FUNCTION__]);
}

-(NSArray*)createStudents{
    NSArray *arrayStudents = [[NSArray alloc]init];
    for (NSInteger i = 0; i < 10; i++) {
        SVStudent *student = [[SVStudent alloc] init];
        student.name = [NSString stringWithFormat:@"%@%i",@"Viktor",arc4random()%100];
        student.lastname = [NSString stringWithFormat:@"%@%i",@"Apple",arc4random()%6];
        
        arrayStudents = [arrayStudents arrayByAddingObject:student];
    }
    return arrayStudents;
}

-(NSArray *)sortedStudentByLastnameAndName:(NSArray*)array{
    array = [array sortedArrayUsingComparator:^NSComparisonResult(SVStudent *student1, SVStudent *student2) {
        if (student1.lastname == nil ||
            student1.name == nil ||
            student2.lastname == nil ||
            student2.name == nil) {
            return (NSComparisonResult)NSOrderedSame;
        }
        
        if ([student1.lastname isEqualToString:student2.lastname]) {
            return [student1.name compare:student2.name];
        }else{
            return [student1.lastname compare:student2.lastname];
        }
        
    }];
    return array;
}

-(void)showArrayStudents:(NSArray *)array{
    for (NSInteger i = 0; i < [array count]; i++) {
        SVStudent *student = [array objectAtIndex:i];
        NSLog(@"student lastname = %@, name = %@",student.lastname, student.name );
    }
}


@end
