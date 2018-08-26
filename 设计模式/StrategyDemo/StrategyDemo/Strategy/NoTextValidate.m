//
//  NoTextValidate.m
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "NoTextValidate.h"

@implementation NoTextValidate
- (BOOL)validateText:(UITextField *)textField {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSInteger n = [regex numberOfMatchesInString:textField.text options:NSMatchingAnchored range:NSMakeRange(0, textField.text.length)];
    self.res = (n == 0) ? @"数字输入不合法" : @"数字输入合法";
    return n == 0;
}
@end
