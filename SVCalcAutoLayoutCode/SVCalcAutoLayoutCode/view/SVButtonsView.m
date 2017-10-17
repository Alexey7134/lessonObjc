//
//  SVButtonsView.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 14.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVButtonsView.h"
#import "SVButton.h"

@interface SVButtonsView ()

@property (strong, nonatomic)NSArray *arrayAllButtons;
@property (strong, nonatomic)NSArray *arrayNumberButtons;
@property (strong, nonatomic)NSArray *arrayCalcButtons;
@property (strong, nonatomic)NSArray *arraySettingsButtons;
@property (strong, nonatomic)NSArray *arrayButtonsField;

@end

@implementation SVButtonsView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createButtonsNum];
        [self createButtonsCalc];
        [self createButtonsSettings];
        
        self.arrayAllButtons = [[NSArray alloc] initWithArray:self.arraySettingsButtons];
        self.arrayAllButtons = [self.arrayAllButtons arrayByAddingObjectsFromArray:self.arrayNumberButtons];
        self.arrayAllButtons = [self.arrayAllButtons arrayByAddingObjectsFromArray:self.arrayCalcButtons];
        
        self.arrayButtonsField = [self createArrayFieldButtons];
        
        self.dictionaryButtons = [self fillButtonsDictionaryWithArray:self.arrayAllButtons];
        
        self.backgroundColor = [UIColor blackColor];
        
        [self startButtonFrameRectOnField:self.arrayButtonsField withButtonsDictionary:self.dictionaryButtons];
    }
    return self;
}

#pragma mark - Button

-(void)createButtonsSettings{
    self.arraySettingsButtons = @[];
    NSArray *arrayString = @[@"AC",@"+/-",@"%"];
    NSInteger countString = 0;
    for (NSInteger indexButton = ButtonTagSettingsAC ; indexButton < ButtonTagSettingsPersent + 1; indexButton++) {
        SVButton *button = [SVButton buttonWithType:UIButtonTypeCustom];
        
        UIColor* colorBackground = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.0];
        [button addTarget:self
                   action:@selector(settingNumberAction:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[arrayString objectAtIndex:countString++] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:25];
        button.backgroundColor = colorBackground;
        button.tag = indexButton;
        self.arraySettingsButtons = [self.arraySettingsButtons arrayByAddingObject:button];
    }
}

-(void)createButtonsCalc{
    self.arrayCalcButtons = @[];
    NSArray *arrayString = @[@"/",@"*",@"+",@"-",@"="];
    NSInteger countString = 0;
    for (NSInteger indexButton = ButtonTagCalcDivision ; indexButton < ButtonTagCalcEquqlity + 1; indexButton++) {
        SVButton *button = [SVButton buttonWithType:UIButtonTypeCustom];
        UIColor* colorBackground = [UIColor colorWithRed:1.00 green:0.60 blue:0.20 alpha:1.0];
        [button addTarget:self
                   action:@selector(settingNumberAction:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[arrayString objectAtIndex:countString++]  forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:25];
        button.backgroundColor = colorBackground;
        button.tag = indexButton;
        self.arrayCalcButtons = [self.arrayCalcButtons arrayByAddingObject:button];
    }
}

-(void)createButtonsNum{
    self.arrayNumberButtons = @[];
    
    for (NSInteger indexButton = ButtonTagNumZero ; indexButton < ButtonTagNumNine + 3; indexButton++) {
        SVButton *button = [SVButton buttonWithType:UIButtonTypeCustom];
        UIColor* colorBackground = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
        [button addTarget:self
                   action:@selector(settingNumberAction:)
         forControlEvents:UIControlEventTouchUpInside];
        NSString *title = indexButton == 10 ? @"." : [NSString stringWithFormat:@"%li", indexButton];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [button.titleLabel.font fontWithSize:25];
        button.backgroundColor = colorBackground;
        if (indexButton>ButtonTagNumNine) {
            button.tag = indexButton + 8;
        }else{
            button.tag = indexButton;
        }
        self.arrayNumberButtons = [self.arrayNumberButtons arrayByAddingObject:button];
    }
}

#pragma mark - const function

/*
 [  AC ] [ +/- ] [  %  ] [  /  ]
 [  7  ] [  8  ] [  9  ] [  *  ]
 [  4  ] [  5  ] [  6  ] [  +  ]
 [  1  ] [  2  ] [  3  ] [  -  ]
 [  0       ]    [  .  ] [  =  ]
 */

-(NSArray*)createArrayFieldButtons{
    NSArray *array = @[
      @[@(ButtonTagSettingsAC),@(ButtonTagSettingsPole),@(ButtonTagSettingsPersent),@(ButtonTagCalcDivision)],
      @[@(ButtonTagNumSeven),@(ButtonTagNumEight),@(ButtonTagNumNine),@(ButtonTagCalcMulty)],
      @[@(ButtonTagNumFour),@(ButtonTagNumFive),@(ButtonTagNumSix),@(ButtonTagCalcAddition)],
      @[@(ButtonTagNumOne),@(ButtonTagNumTwo),@(ButtonTagNumThree),@(ButtonTagCalcSubtraction)],
      @[@(ButtonTagNumZero),@(ButtonTagNumPoint),@(ButtonTagCalcEquqlity)]
      ];
    return array;
}

#pragma mark - Private functions

-(NSDictionary *)fillButtonsDictionaryWithArray:(NSArray *)array{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (NSInteger indexValue = 0; indexValue < [array count]; indexValue++) {
        SVButton *button = [array objectAtIndex:indexValue];
        NSLog(@"butttton %li",button.tag);
        [dictionary setObject:button forKey:[NSString stringWithFormat:@"%li", button.tag]];
    }
    return dictionary;
}

-(void)startButtonFrameRectOnField:(NSArray *)arrayField withButtonsDictionary:(NSDictionary *)dictionary{
    for (NSInteger indexLine = 0; indexLine < [arrayField count]; indexLine++) {
        NSArray *arrayColumn = [arrayField objectAtIndex:indexLine];
        for (NSInteger indexColumn = 0; indexColumn < [arrayColumn count]; indexColumn++) {
            NSInteger keyTag = [(NSNumber*)[arrayColumn objectAtIndex:indexColumn] intValue] ;
            SVButton *button = [dictionary objectForKey:[NSString stringWithFormat:@"%li", keyTag]];
            [self addSubview:button];
            
            CGFloat widthButton = 65;
            CGFloat heightButton = 65;
            CGFloat xPosition = 10 *(indexColumn + 1) + indexColumn * widthButton;
            CGFloat yPosition = 10 *(indexLine + 1) + indexLine * heightButton;
            
            if (indexLine == [arrayField count] - 1) {
                if (indexColumn == 0) {
                    widthButton = 130;
                }else{
                    widthButton = 65;
                    xPosition += (10 + heightButton);
                }
            }
            
            [button setFrame:CGRectMake(xPosition,
                                        yPosition,
                                        widthButton,
                                        heightButton)];
            
            
            
            [self setButtonColorWithStates:button];
            button.layer.cornerRadius = button.frame.size.height/2;
            [button.layer setMasksToBounds:YES];
        }
    }
}



#pragma mark - Help functions -

-(UIColor *)makeColorLighter:(UIColor *)color{
    
    CGFloat hue = 0.0, saturation = 0.0, brightness = 0.0, alpha =0.0;
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    saturation = (saturation - 0.2) < 0 ? 0 : saturation - 0.2;
    brightness = (brightness + 0.2) > 1 ? brightness : brightness + 0.2;
    
    color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return color;
}

-(void)setButtonColorWithStates:(SVButton *)button{
    //button.backgroundColor = color;
    [button setBackgroundColor:button.backgroundColor forState:UIControlStateNormal];
    [button setBackgroundColor:[self makeColorLighter:button.backgroundColor] forState:UIControlStateHighlighted];
    [button setBackgroundColor:[self makeColorLighter:button.backgroundColor] forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO;
    button.highlighted = NO;
}


#pragma mark - SVButton action
- (void)settingNumberAction:(SVButton *)button {
    [self.delegate performSelector:@selector(buttonAction:) withObject:button];
}


@end
