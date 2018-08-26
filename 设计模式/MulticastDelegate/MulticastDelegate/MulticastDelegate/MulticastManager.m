//
//  MulticastManager.m
//  MulticastDelegate
//
//  Created by Young on 2018/8/26.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "MulticastManager.h"

@interface MulticastManager()

@property (nonatomic, strong) NSHashTable *hashTable;

@end

@implementation MulticastManager

+ (MulticastManager *)shareMulticastManager {
    static MulticastManager *manager = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[MulticastManager alloc] init];
        }
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    return self;
}

- (void)addDelegate:(id)obj {
    [self.hashTable addObject:obj];
}

- (void)textFieldSetupText {
//    for (id delegate in self.hashTable) {
//        if ([delegate respondsToSelector:@selector(doSomething)]) {
//            [delegate doSomething];
//        }
//    }
    [((id<MulticastManagerDelegate>)self) doSomething];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    for (id delegate in self.hashTable) {
        if ([delegate respondsToSelector:aSelector]) {
            NSMethodSignature *result = [delegate methodSignatureForSelector:aSelector];
            if (result) {
                return result;
            }
        }
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL selector = invocation.selector;
    for (id delegate in self.hashTable) {
        if ([delegate respondsToSelector:selector]) {
            invocation.target = delegate;
            [invocation invoke];
        }
    }
}


@end
