//
//  SVMainViewController.m
//  SVButton
//
//  Created by Viktor Siedov on 19.09.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainViewController.h"
#import "SVButton.h"

@interface SVMainViewController ()

@end

@implementation SVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self setAttitudeButtons];
    
}

-(void)setAttitudeButtons{
    for (SVButton* button in self.settingNumberButtonCollection) {
        button.titleLabel.textColor = [UIColor blackColor];
        UIColor* colorBackground = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
        [self setButtonColorWithStates:button backGroundColor:colorBackground];
    }
    
    for (SVButton* button in self.calcButtonCollection) {
        button.titleLabel.textColor = [UIColor whiteColor];
        UIColor* colorBackground = [UIColor colorWithRed:1.00 green:0.60 blue:0.20 alpha:1.0];
        [self setButtonColorWithStates:button backGroundColor:colorBackground];
    }
    
    for (SVButton* button in self.nubersButtonCollection) {
        UIColor* colorBackground = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
        [self setButtonColorWithStates:button backGroundColor:colorBackground];
        button.titleLabel.textColor = [UIColor whiteColor];
    }
    
    NSArray* arrayAllButtons = [[NSArray alloc] initWithArray:self.nubersButtonCollection];
    arrayAllButtons = [arrayAllButtons arrayByAddingObjectsFromArray:self.calcButtonCollection];
    arrayAllButtons = [arrayAllButtons arrayByAddingObjectsFromArray:self.settingNumberButtonCollection];
    
    for (UIButton* button in arrayAllButtons) {
        button.layer.cornerRadius = CGRectGetHeight(button.frame)/2;
        //button.layer.borderColor
        //button.layer.borderWidth
    }
}

-(void)setButtonColorWithStates:(SVButton *)button backGroundColor:(UIColor *)color{
    [button setBackgroundColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:[self makeColorLighter:color] forState:UIControlStateHighlighted];
    [button setBackgroundColor:[self makeColorLighter:color] forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO;
    button.highlighted = NO;
}

-(UIColor *)makeColorLighter:(UIColor *)color{
    
    CGFloat hue = 0.0, saturation = 0.0, brightness = 0.0, alpha =0.0;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    saturation = (saturation - 0.2) < 0 ? 0 : saturation - 0.2;
    brightness = (brightness + 0.2) > 1 ? brightness : brightness + 0.2;
    
    color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    
    return color;
}

- (IBAction)sentNumberAction:(UIButton *)sender {
    self.screenLabel.text = [NSString stringWithFormat:@"%ld",sender.tag];
}
- (IBAction)calcAction:(UIButton *)sender {
}
- (IBAction)settingNumberAction:(UIButton *)sender {
}

@end
