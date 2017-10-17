//
//  SVLogicCalc.m
//  SVCalcAutoLayoutCode
//
//  Created by Viktor Siedov on 17.10.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVLogicCalc.h"
@import CoreGraphics;

/*
 [  AC ] [ +/- ] [  %  ] [  /  ]
 [  7  ] [  8  ] [  9  ] [  *  ]
 [  4  ] [  5  ] [  6  ] [  +  ]
 [  1  ] [  2  ] [  3  ] [  -  ]
 [  0       ]    [  .  ] [  =  ]
 */

typedef CGFloat(^ReturnCalcResult)(CGFloat x ,CGFloat y);

typedef NS_ENUM(NSInteger,SVOperationMode){
    SVOperationModeAC = 10,  //  AC
    SVOperationModePole = 11,//  +/-
    SVOperationModePersent = 12, // %
    SVOperationModeDivision = 13, //division  /
    SVOperationModeMulty = 14, // multiplication  *
    SVOperationModeAddition = 15, //addition   +
    SVOperationModeSubtraction = 16,//subtraction  -
    SVOperationModeEquqlity = 17,// equality  =
    SVOperationModePoint = 18
};

@interface SVLogicCalc (){
    CGFloat _resultNumber;
    CGFloat _secondNumber;
    BOOL _isFirstNumber;
    BOOL _isPoint;
    NSString *_displayText;
    SVOperationMode _state;
    ReturnCalcResult _calcBlock;
}

@end

@implementation SVLogicCalc

-(void)chooseFuncTag:(NSInteger)valueTag{
    CGFloat *number;
    switch (valueTag) {
        case SVOperationModeAC:
            _isPoint = NO;
            [self resetDataCalc];
            _displayText = [self formatterFloatToString:_resultNumber];
            break;
            
        case SVOperationModePole:
            _isPoint = NO;
            number = [self returnCurrentNumber];
            *number = 0 - *number;
            _displayText = [self formatterFloatToString:*number];
            break;
            
        case SVOperationModePersent:
            _isPoint = NO;
            number = [self returnCurrentNumber];
            *number = *number/100;
            _displayText = [self formatterFloatToString:*number];
            break;
            
        case SVOperationModeMulty:
            _calcBlock = ^(CGFloat x, CGFloat y){ return x * y; };
            [self stateOperation];
            break;
            
        case SVOperationModeDivision:
            _calcBlock = ^(CGFloat x, CGFloat y){ return x / y; };
            [self stateOperation];
            break;
            
        case SVOperationModeAddition:
            _calcBlock = ^(CGFloat x, CGFloat y){ return x + y; };
            [self stateOperation];
            break;
            
        case SVOperationModeSubtraction:
            _calcBlock = ^(CGFloat x, CGFloat y){ return x - y; };
            [self stateOperation];
            break;
            
        case SVOperationModeEquqlity:
            _isPoint = NO;
            _isFirstNumber = NO;
            if (_calcBlock) {
                _isFirstNumber = YES;
                _secondNumber = _secondNumber == 0 ? _resultNumber : _secondNumber;
                _resultNumber = _calcBlock(_resultNumber,_secondNumber);
                _displayText = [self formatterFloatToString:_resultNumber];
            }
            break;
            
        case SVOperationModePoint:
            if(!_isPoint){
                if(_state == SVOperationModeEquqlity)[self resetDataCalc];
                number = [self returnCurrentNumber];
                if (*number == 0) _displayText = [self formatterFloatToString:*number];
                
                _displayText = [NSString stringWithFormat:@"%@%@",_displayText,@"."];

                *number = [_displayText floatValue];
                _isPoint = YES;
            }
            break;
            
        default:
            if(_state == SVOperationModeEquqlity)[self resetDataCalc];

            if(_calcBlock)_isFirstNumber = NO;
            number = [self returnCurrentNumber];
            
            if(!_isPoint){
                *number = [self checkerFirstDigits:*number newNumber:valueTag];
                _displayText = [self formatterFloatToString:*number];
            } else {
                _displayText = [NSString stringWithFormat:@"%@%li",_displayText,valueTag];
                *number = [_displayText floatValue];
            }
            
            break;
    }
    _state = valueTag;
    [self.delegate setLabelDisplayText:_displayText];
}

-(void)resetDataCalc{
    _resultNumber = 0;
    _secondNumber = 0;
    _isFirstNumber = YES;
    _calcBlock = nil;
}
-(void)stateOperation{
    _isPoint = NO;
    _isFirstNumber = NO;
    _secondNumber = 0.f;
}

-(CGFloat *)returnCurrentNumber{
    CGFloat *number;
    if (_isFirstNumber) number = &_resultNumber;
    else number = &_secondNumber;
    return number;
}

-(CGFloat)checkerFirstDigits:(CGFloat)displayNumber newNumber:(NSInteger)newNumber{
    if (displayNumber == 0) {
        displayNumber = newNumber;
    }else{
        NSString *stringFormat = [NSString stringWithFormat:@"%@%li",[self formatterFloatToString:displayNumber],newNumber];
        displayNumber = [stringFormat floatValue];
    }
    return displayNumber;
}

-(NSString *)formatterFloatToString:(CGFloat)floatNumber{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    numberFormatter.locale = [NSLocale currentLocale];// this ensures the right separator behavior
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.usesGroupingSeparator = YES;
    numberFormatter.maximumFractionDigits = 7;
    return [NSString stringWithFormat:@"%@", [numberFormatter stringFromNumber:@(floatNumber)]];
}

@end
