//
//  ViewController.m
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextField.h"
#import "NoTextValidate.h"
#import "EmailTextValidate.h"
#import "LetterTextValidate.h"

#import "PicStrategy.h"


@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) CustomTextField *noTextField;

@property (nonatomic, strong) CustomTextField *emailTextField;

@property (nonatomic, strong) CustomTextField *letterTextField;

@end

@implementation ViewController

/*
 * 需求一： 判断输入的内容是否正确
 * 1、验证是否全是数字
 * 2、验证是否是邮箱
 * 3、验证是否是全是英文
 *
 * 需求二： 根据不同日期做不同的事情
 *
 *
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    
    self.noTextField = [self setupTextField:CGRectMake(50, 100, 200, 50)];
    self.noTextField.delegate = self;
    self.noTextField.textValidate = [NoTextValidate new];
    [self.view addSubview:self.noTextField];
    
    self.emailTextField = [self setupTextField:CGRectMake(50, 180, 200, 50)];
    self.emailTextField.delegate = self;
    self.emailTextField.textValidate = [EmailTextValidate new];
    [self.view addSubview:self.emailTextField];
    
    self.letterTextField = [self setupTextField:CGRectMake(50, 250, 200, 50)];
    self.letterTextField.delegate = self;
    self.letterTextField.textValidate = [LetterTextValidate new];
    [self.view addSubview:self.letterTextField];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text == nil) {
        return;
    }
    
    if ([textField isKindOfClass:[CustomTextField class]]) {
        [(CustomTextField *)textField validateValueText];
    }
    
//    if (textField == self.noTextField) {
//        BOOL against = [self validateValue:textField.text rule:0];
//        if (against) {
//            NSLog(@"数字输入不合法");
//        } else {
//            NSLog(@"数字输入合法");
//        }
//    } else if (textField == self.emailTextField) {
//        BOOL against = [self validateValue:textField.text rule:1];
//        if (against) {
//            NSLog(@"邮箱输入不合法");
//        } else {
//            NSLog(@"邮箱输入合法");
//        }
//    } else if (textField == self.letterTextField) {
//        BOOL against = [self validateValue:textField.text rule:2];
//        if (against) {
//            NSLog(@"字母输入不合法");
//        } else {
//            NSLog(@"字母输入合法");
//        }
//    }
}


- (BOOL)validateValue:(NSString *)string rule:(NSInteger)rule {
    BOOL res = NO;
    switch (rule) {
        case 0:
            res = [self validateNo:string];
            break;
        case 1:
            res = [self validateEmail:string];
            break;
        case 2:
            res = [self validateLetter:string];
            break;
        default:
            break;
    }
    
    return res;
}

- (BOOL)validateNo:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSInteger n = [regex numberOfMatchesInString:string options:NSMatchingAnchored range:NSMakeRange(0, string.length)];
    return n == 0;
}

- (BOOL)validateEmail:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z0-9_.-]*+@[a-zA-Z0-9-]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSInteger n = [regex numberOfMatchesInString:string options:NSMatchingAnchored range:NSMakeRange(0, string.length)];
    return n == 0;
}

- (BOOL)validateLetter:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSInteger n = [regex numberOfMatchesInString:string options:NSMatchingAnchored range:NSMakeRange(0, string.length)];
    return n == 0;
}



- (CustomTextField *)setupTextField:(CGRect)rect {
    CustomTextField *textField = [[CustomTextField alloc] initWithFrame:rect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.backgroundColor = [UIColor blueColor];
    
    return textField;
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [self doSomething:@"2"];
}

#pragma mark --2

- (void)doSomething:(NSString *)date {
    
    PicStrategy *s = [PicStrategy new];
    [s uploadPic:date];
    
    
}


@end
