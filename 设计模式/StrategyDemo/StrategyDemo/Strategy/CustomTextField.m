//
//  CustomTextField.m
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (BOOL)validateValueText {
    BOOL res = [self.textValidate validateText:self];
    NSLog(@"%@",self.textValidate.res);
    return res;
}

@end
