//
//  EXPerson.h
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EXPerson : NSObject


@property(strong,nonatomic)NSString *name;
@property(assign,nonatomic)CGFloat heigh;
@property(assign,nonatomic)CGFloat weigh;
@property(strong,nonatomic)NSString *gender;

-(void)moved;

@end
