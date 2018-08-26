//
//  MulticastManager.h
//  MulticastDelegate
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
  定义协议，声明方法
*/
@protocol MulticastManagerDelegate <NSObject>

- (void)doSomething;

@end

@interface MulticastManager : NSObject

+ (MulticastManager *)shareMulticastManager;

- (void)addDelegate:(id)obj;

- (void)textFieldSetupText;

@end
