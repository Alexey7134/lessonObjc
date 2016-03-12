//
//  ViewController.m
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "ViewController.h"
#import "EXSwim.h"
#import "EXRunner.h"
#import "EXJumper.h"
#import "EXDriver.h"

#import "EXCat.h"
#import "EXFrog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    EXSwim *swimmer = [[EXSwim alloc] init];
    swimmer.name = @"Alexey";
    swimmer.heigh = 1.8f;
    swimmer.weigh = 60.4f;
    
    
    EXRunner *runner = [[EXRunner alloc] init];
    runner.name = @"Vitaliy";
    runner.heigh = 1.7f;
    runner.weigh = 30.4f;
    
    EXJumper *jumper = [[EXJumper alloc] init];
    jumper.name = @"Alexandr";
    jumper.heigh = 1.9f;
    jumper.weigh = 50.4f;
    
    EXDriver *driver = [[EXDriver alloc] init];
    driver.name = @"Olga";
    driver.heigh = 1.76f;
    driver.weigh = 50.f;
    driver.old = 22;
    
    EXCat *cat = [[EXCat alloc]init];
    cat.nick = @"Tisha";
    cat.mass = 0.3f;
    cat.type = @"home";
    
    EXFrog *frog = [[EXFrog alloc]init];
    frog.nick = @"Quin";
    frog.mass = 0.1f;
    frog.type = @"wild";
    
//    NSArray *arrayPeople = [NSArray arrayWithObjects:swimmer, runner, jumper, driver, cat, frog, nil];
//    for (NSInteger i = [arrayPeople count] - 1; i >= 0; i--) {
//        if ([arrayPeople[i] isKindOfClass:[EXPerson class]]){
//            EXPerson *person = arrayPeople[i];
//            NSLog(@"%@", person.name);
//            NSLog(@"%f%@", person.heigh,@" cm");
//            NSLog(@"%f%@", person.weigh,@" kg");
//            if ([person isKindOfClass:[EXDriver class]]) {
//                EXDriver *drive = (EXDriver *)person;
//                [drive finished];
//                NSLog(@"%i%@", drive.old,@" years");
//            }
//        }else if([arrayPeople[i] isKindOfClass:[EXAnimal class]]){
//            EXAnimal *animal = arrayPeople[i] ;
//            NSLog(@"%@", animal.nick);
//            NSLog(@"%@", animal.type);
//            NSLog(@"%f%@", animal.mass,@" kg");
//            
//        }
//        [arrayPeople[i] moved];
//    }
    
    NSArray *arrayPeople = [NSArray arrayWithObjects:swimmer, runner, jumper, driver, nil];
    NSArray *arrayAnimal = [NSArray arrayWithObjects:frog, cat, nil];
    NSInteger maxValue = [arrayPeople count] > [arrayAnimal count] ? [arrayPeople count] : [arrayAnimal count];
    for (NSInteger i = 0; i < maxValue; i++) {
        if (i < [arrayPeople count]) {
            EXPerson *person = arrayPeople[i];
            NSLog(@"%@", person.name);
            NSLog(@"%f%@", person.heigh,@" cm");
            NSLog(@"%f%@", person.weigh,@" kg");
            if ([person isKindOfClass:[EXDriver class]]) {
                EXDriver *drive = (EXDriver *)person;
                [drive finished];
                NSLog(@"%i%@", drive.old,@" years");
            }
            [person moved];
        }
        if (i < [arrayAnimal count]){
            EXAnimal *animal = arrayAnimal[i] ;
            NSLog(@"%@", animal.nick);
            NSLog(@"%@", animal.type);
            NSLog(@"%f%@", animal.mass,@" kg");
            [animal moved];
        }
    }
    
    NSLog(@"-------");
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *descriptorArray = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortedPeopleArray = [arrayPeople sortedArrayUsingDescriptors:descriptorArray];
    
    
    sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"nick" ascending:YES];
    descriptorArray = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortedAnimalArray = [arrayAnimal sortedArrayUsingDescriptors:descriptorArray];
    
    
    //sortedAnimalArray = [arrayAnimal sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"nick" ascending:YES]]];
    
    for (NSInteger i = 0; i < maxValue; i++) {
        if (i < [sortedPeopleArray count]) {
            EXPerson *person = sortedPeopleArray[i];
            NSLog(@"%@", person.name);
        }
        if (i < [sortedAnimalArray count]){
            EXAnimal *animal = sortedAnimalArray[i] ;
            NSLog(@"%@", animal.nick);
        }
    }
    
    
    
    
}


@end
