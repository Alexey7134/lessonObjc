//
//  EXAnimal.h
//  EXPeople
//
//  Created by Viktor Siedov on 06.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXPerson.h"

@interface EXAnimal : NSObject

@property(strong, nonatomic)NSString *nick;
@property(assign, nonatomic)CGFloat mass;
@property(strong, nonatomic)NSString *type;


-(void)moved;

@end
