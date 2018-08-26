//
//  CustomTextField.h
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextValidate.h"

@interface CustomTextField : UITextField

/**
 策略类
 */
@property (nonatomic, strong) TextValidate *textValidate;

- (BOOL)validateValueText;

@end
