//
//  SVMainViewController.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 10.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"
#import "SVButton.h"

@interface SVMainViewController ()

@property (strong, nonatomic)NSArray *arrayAllButtons;
@property (strong, nonatomic)NSArray *arrayNumberButtons;
@property (strong, nonatomic)NSArray *arrayCalcButtons;
@property (strong, nonatomic)NSArray *arraySettingsButtons;
@property (strong, nonatomic)NSDictionary *dictionaryButtons;

@property(strong,nonatomic)SVButtonsView *viewButtons;

@end

@implementation SVMainViewController

/*
 [  AC ] [ +/- ] [  %  ] [  /  ]
 [  7  ] [  8  ] [  9  ] [  *  ]
 [  4  ] [  5  ] [  6  ] [  +  ]
 [  1  ] [  2  ] [  3  ] [  -  ]
 [  0       ]    [  .  ] [  =  ]
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewButtons = [[SVButtonsView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 100)];
    [self.view addSubview:self.viewButtons ];
    self.viewButtons .delegate = self;
}

#pragma mark - SVButton action
- (void)buttonAction:(SVButton *)button {
    NSLog(@"current button tag %@", [NSString stringWithFormat:@"%li", button.tag]);
}

@end
