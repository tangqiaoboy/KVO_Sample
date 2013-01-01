//
//  MyClass.m
//  KVOTest
//
//  Created by TangQiao on 13-1-1.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (id)valueForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return self.name;
    }
    return nil;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        self.name = value;
    }
}

@end
