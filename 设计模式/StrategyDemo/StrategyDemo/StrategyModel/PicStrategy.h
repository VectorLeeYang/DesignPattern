//
//  PicStrategy.h
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PicProtocol.h"

@interface PicStrategy : NSObject

@property (nonatomic, strong) id<PicProtocol> pic;

- (void)uploadPic:(NSString *)str;

@end
