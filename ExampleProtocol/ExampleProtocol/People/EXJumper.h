//
//  EXJumper.h
//  EXPeople
//
//  Created by Viktor Siedov on 05.03.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "EXPerson.h"
#import "JumperProtocol.h"


@interface EXJumper : EXPerson <JumperProtocol>

@property(assign, nonatomic)CGFloat maxHeight;
@property(assign, nonatomic)CGFloat maxLenght;

-(void)startJumping;
-(BOOL)stopJumping;

-(void)moved;


@end
