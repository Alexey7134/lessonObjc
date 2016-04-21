//
//  SVDoctor.h
//  SVDelegateExample
//
//  Created by Viktor Siedov on 20.04.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVPatient.h"

@interface SVDoctor : NSObject <SVPatientDelegate>

-(BOOL)patientBadFeel:(SVPatient *)patient;

@end
