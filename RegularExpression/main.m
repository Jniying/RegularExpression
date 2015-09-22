//
//  main.m
//  RegularExpression
//
//  Created by Jniying on 15/9/22.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+RegularExpression.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSString *str = @"[dddd]";
        [str regexAtOneWithPattern:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" success:^(NSString *Result, NSRange range) {
            NSLog(@"%@---%@", Result ,NSStringFromRange(range));
        } failure:^{
            
        }];
        [str regexSubStringWithPattern:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]" success:^(NSString *Result, NSRange range) {
            NSLog(@"%@---%@", Result ,NSStringFromRange(range));
        } failure:^{
            NSLog(@"失败");
        }];
        
    
    }
    return 0;
}
