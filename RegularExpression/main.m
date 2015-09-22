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
      
        NSString *str = @"4532.4_%2342@qq.cn";
        [str regularExpressionWithMailSuccess:^(NSDictionary *successResult) {
            NSLog(@"成功");
        } failure:^{
            NSLog(@"失败");
        }];
        
    
    }
    return 0;
}
