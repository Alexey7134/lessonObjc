//
//  SVButtonsView.h
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 14.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SVButtonsViewDelegate;

typedef NS_ENUM(NSInteger,ButtonTagNum){
    ButtonTagNumZero,
    ButtonTagNumOne,
    ButtonTagNumTwo,
    ButtonTagNumThree,
    ButtonTagNumFour,
    ButtonTagNumFive,
    ButtonTagNumSix,
    ButtonTagNumSeven,
    ButtonTagNumEight,
    ButtonTagNumNine,
    ButtonTagNumPoint = 18,
    ButtonTagNumEmpty = 19
};

typedef NS_ENUM(NSInteger,ButtonTagSettings){
    ButtonTagSettingsAC = 10,  //  AC
    ButtonTagSettingsPole = 11,//  +/-
    ButtonTagSettingsPersent = 12// %
};

typedef NS_ENUM(NSInteger,ButtonTagCalc){
    ButtonTagCalcDivision = 13, //division  /
    ButtonTagCalcMulty = 14, // multiplication  *
    ButtonTagCalcAddition = 15, //addition   +
    ButtonTagCalcSubtraction = 16,//subtraction  -
    ButtonTagCalcEquqlity = 17// equality  =
};

@interface SVButtonsView : UIView

@property(weak,nonatomic)id<SVButtonsViewDelegate> delegate;
@property (strong, nonatomic)NSDictionary *dictionaryButtons;

@end

@protocol SVButtonsViewDelegate <NSObject>

- (void)buttonAction:(UIButton *)button;

@end
