//
//  NextViewController.m
//  MulticastDelegate
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "NextViewController.h"
#import "MulticastManager.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.view.userInteractionEnabled = YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
     [[MulticastManager shareMulticastManager] textFieldSetupText];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"do" object:nil];
}

@end
