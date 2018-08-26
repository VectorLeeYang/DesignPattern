//
//  PicStrategy.m
//  StrategyDemo
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "PicStrategy.h"
#import "PicServicer.h"
#import "FileServicer.h"
#import "LocalServicer.h"

@implementation PicStrategy

- (void)uploadPic:(NSString *)date {
    if ([date isEqualToString:@"1"]) {
        // 图片传到文件服务器
        self.pic = [PicServicer new];
    } else if ([date isEqualToString:@"2"]) {
        // 图片传到图片服务器
        self.pic = [FileServicer new];
    } else if ([date isEqualToString:@"3"]) {
        // 图片传到本地服务器
        self.pic = [LocalServicer new];
    }
    
    [self.pic uploadImage];
}

@end
