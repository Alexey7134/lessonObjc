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
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
            [self makeAutoLayoutWithAnchor:self.arrayButtonsField withButtonsDictionary:self.dictionaryButtons];
        }else{
            // calculate frame rects
            [self startButtonFrameRectOnField:self.arrayButtonsField withButtonsDictionary:self.dictionaryButtons];
        }
        
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

#pragma mark - Frame Rects

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
            
        }
    }
}

#pragma mark - AutoLayout

-(void)makeAutoLayoutWithAnchor:(NSArray *)arrayField withButtonsDictionary:(NSDictionary *)dictionary{
    //self.backgroundColor = [UIColor grayColor];
    NSMutableArray *arrayLineViews = [[NSMutableArray alloc] init];
    for (NSInteger indexLine = 0; indexLine < [arrayField count]; indexLine++) {
        NSArray *arrayColumn = [arrayField objectAtIndex:indexLine];
        UIView *viewButtonsLine = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
        //viewButtonsLine.backgroundColor = [UIColor brownColor];
        [arrayLineViews addObject:viewButtonsLine];
        [self addSubview:viewButtonsLine];
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        viewButtonsLine.translatesAutoresizingMaskIntoConstraints = NO;
        
        [viewButtonsLine.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [viewButtonsLine.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        
        if (indexLine == 0) {
            [viewButtonsLine.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        }else{
            UIView *preViewLine = [arrayLineViews objectAtIndex:indexLine - 1];
            [viewButtonsLine.topAnchor constraintEqualToAnchor:preViewLine.bottomAnchor constant:20].active = YES;
            [viewButtonsLine.heightAnchor constraintEqualToAnchor:preViewLine.heightAnchor].active = YES;
        }
        
        if (indexLine == [arrayField count] - 1) {
            [viewButtonsLine.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        }
        
        for (NSInteger indexColumn = 0; indexColumn < [arrayColumn count]; indexColumn++) {
            NSInteger number = [(NSNumber*)[arrayColumn objectAtIndex:indexColumn] intValue] ;
            SVButton *button = [dictionary objectForKey:[NSString stringWithFormat:@"%li", number]];
            button.translatesAutoresizingMaskIntoConstraints =  NO;
            [viewButtonsLine addSubview:button];
            
            [button.topAnchor constraintEqualToAnchor:viewButtonsLine.topAnchor].active = YES;
            [button.bottomAnchor constraintEqualToAnchor:viewButtonsLine.bottomAnchor].active = YES;
            if (indexColumn == 0) {
                [button.leadingAnchor constraintEqualToAnchor:viewButtonsLine.leadingAnchor].active = YES;
            }else{
                NSInteger previousNumber = [(NSNumber *) [arrayColumn objectAtIndex:indexColumn - 1] integerValue];
                SVButton *previousButton = [dictionary objectForKey:[NSString stringWithFormat:@"%li", previousNumber]];
                [button.leadingAnchor constraintEqualToAnchor:previousButton.trailingAnchor constant:20].active = YES;
                if (indexLine != [arrayField count] - 1) {
                    [button.widthAnchor constraintEqualToAnchor:previousButton.heightAnchor].active = YES;
                }else{
                    [button.widthAnchor constraintEqualToAnchor:button.heightAnchor].active = YES;
                }
            }
            
            if (indexColumn == [arrayColumn count] - 1) {
                [button.trailingAnchor constraintEqualToAnchor:viewButtonsLine.trailingAnchor].active = YES;
            }
        }
    }
}

#pragma mark - SVButton action
- (void)settingNumberAction:(SVButton *)button {
    [self.delegate performSelector:@selector(buttonAction:) withObject:button];
}


@end
