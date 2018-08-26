//
//  TextValidate.h
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TextValidate : NSObject

// 策略输入
- (BOOL)validateText:(UITextField *)textField;

@property (nonatomic, strong) NSString *res;

@end
