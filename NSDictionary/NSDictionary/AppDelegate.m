//
//  AppDelegate.m
//  NSDictionary
//
//  Created by Viktor Siedov on 11.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "AppDelegate.h"
#import "SVStudent.h"

@interface AppDelegate (){
    NSArray *studentsArray;
    NSDictionary *studentsDictionary;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    studentsArray = [self createNewStudents:20];
    studentsDictionary = [self createStudentsDictionary:studentsArray];
    [self showDictionaryAllStudent:studentsDictionary];
    
    studentsArray = [self sortStudents:studentsArray];
    [self showSortDictionaryStudent:studentsDictionary arrayStudents:studentsArray];
    
    
    
    return YES;
}

-(NSArray*)createNewStudents:(NSInteger)maxStudent{
    NSArray *array = [[NSArray alloc] init];
    for (NSInteger i = 0; i < maxStudent; i++) {
        SVStudent *student = [[SVStudent alloc] init];
        student.name = [self randomStringWithLength:[self randomLengthName]];
        student.lastName = [self randomStringWithLength:[self randomLengthName]];
        student.phrase = [self randomStringWithLength:[self randomLengthName]];
        array = [array arrayByAddingObject:student];
    }
    return array;
}

-(NSInteger)randomLengthName{
    NSInteger intName = arc4random()%6;
    return intName = intName < 3 ? [self randomLengthName] : intName;
}

-(NSString *) randomStringWithLength: (int) len {
    NSString *lowerLetters = @"abcdefghijklmnopqrstuvwxyz";
    NSString *upperLetters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        if (i == 0) {
            [randomString appendFormat: @"%C", [upperLetters characterAtIndex: arc4random_uniform([upperLetters length])]];
        }else{
            [randomString appendFormat: @"%C", [lowerLetters characterAtIndex: arc4random_uniform([lowerLetters length])]];
        }
    }
    
    return randomString;
}

-(NSDictionary *)createStudentsDictionary:(NSArray *)array{
    if(!array) return nil;
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    
    NSArray *keyStudents = [[NSArray alloc]init];
    NSArray *objectStudents = [[NSArray alloc] init];
    for (SVStudent *student in array) {
        NSString *keyName = [NSString stringWithFormat:@"%@%@",student.name, student.lastName];
        keyStudents = [keyStudents arrayByAddingObject:keyName];
        objectStudents = [objectStudents arrayByAddingObject:student];
    }
    
    dictionary = [NSDictionary dictionaryWithObjects:objectStudents forKeys:keyStudents];
    
    return dictionary;
}

-(void)showDictionaryAllStudent:(NSDictionary *)dictionary{
    if(!dictionary) return;
    for (NSString *key in [dictionary allKeys]) {
        NSLog(@"keyName = %@, say = %@", key, [[dictionary objectForKey:key] phrase]);
    }
}

-(NSArray *)sortStudents:(NSArray *)array{
    if(!array)return nil;
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortArray = [NSArray arrayWithObjects:descriptor, nil];
    array = [array sortedArrayUsingDescriptors:sortArray];
    return array;
}

-(void)showSortDictionaryStudent:(NSDictionary *)dictionary arrayStudents:(NSArray *)array{
    if(!dictionary) return;
    for (NSInteger i = 0; i < [array count]; i++) {
        SVStudent *student = [array objectAtIndex:i];
        NSString *keyName = [NSString stringWithFormat:@"%@%@",student.name, student.lastName];
        NSLog(@"SORT i = %d, keyName = %@, say = %@", i, keyName, [[dictionary objectForKey:keyName] phrase]);
        
    }
}




@end
