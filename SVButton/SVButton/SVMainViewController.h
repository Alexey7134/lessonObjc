//
//  SVMainViewController.h
//  SVButton
//
//  Created by Viktor Siedov on 19.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVButton.h"

@interface SVMainViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(SVButton) NSArray *nubersButtonCollection;
@property (strong, nonatomic) IBOutletCollection(SVButton) NSArray *calcButtonCollection;
@property (strong, nonatomic) IBOutletCollection(SVButton) NSArray *settingNumberButtonCollection;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;

@end
