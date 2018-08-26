//
//  EmailTextValidate.m
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "EmailTextValidate.h"

@implementation EmailTextValidate

- (BOOL)validateText:(UITextField *)textField {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z0-9_.-]*+@[a-zA-Z0-9-]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSInteger n = [regex numberOfMatchesInString:textField.text options:NSMatchingAnchored range:NSMakeRange(0, textField.text.length)];
    self.res = (n == 0) ? @"邮箱输入不合法" : @"邮箱输入合法";
    return n == 0;
}

@end
