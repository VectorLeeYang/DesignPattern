//
//  ViewController.m
//  MulticastDelegate
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "ViewController.h"
#import "MulticastManager.h"
#import "NextViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *noTextField;

@property (nonatomic, strong) UITextField *emailTextField;

@property (nonatomic, strong) UITextField *letterTextField;

@property (nonatomic, strong) MulticastManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
    
    self.noTextField = [self setupTextField:CGRectMake(50, 100, 200, 50)];
    [self.view addSubview:self.noTextField];
    
    self.emailTextField = [self setupTextField:CGRectMake(50, 180, 200, 50)];
    [self.view addSubview:self.emailTextField];
    
    self.letterTextField = [self setupTextField:CGRectMake(50, 250, 200, 50)];
    [self.view addSubview:self.letterTextField];
    
    self.manager = [MulticastManager shareMulticastManager];
    [self.manager addDelegate:self];
    
   
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doSomething) name:@"do" object:nil];
  
}

- (void)dealloc {
   // [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NextViewController *nVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nVC animated:YES];
}

- (void)doSomething {
    self.noTextField.text = @"noTextField";
    self.emailTextField.text = @"emailTextField";
    self.letterTextField.text = @"letterTextField";
}


- (UITextField *)setupTextField:(CGRect)rect {
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.enabled = NO;
    textField.backgroundColor = [UIColor blueColor];
    
    return textField;
}



@end
