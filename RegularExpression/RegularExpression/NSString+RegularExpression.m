//  Version 1.0.0
//  NSString+RegularExpression.m
//  RegularExpression
//
//  Created by Jniying on 15/9/22.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)


- (BOOL)isRegexWithPattern:(NSString *)pattern {
    return [self regexWithPattern:pattern success:nil failure:nil];
}
- (BOOL)regexAtOneWithPattern:(NSString *)pattern success:(void (^)(NSString *, NSRange))success failure:(void (^)())failure {
    if (self.length <= 0) {
        return NO;
    }
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:(NSRegularExpressionCaseInsensitive/*大小写敏感*/) error:nil];
    //开始匹配
    NSArray *matches = [regex matchesInString:self options:(NSMatchingReportCompletion/*完整匹配*/) range:NSMakeRange(0, self.length)];
    if (matches.count) {
        for (NSTextCheckingResult *result in matches) {
            success([self substringWithRange:result.range], result.range);
        }
        return YES;
    }else {
        failure();
        return NO;
    }
}
- (BOOL)regexSubStringWithPattern:(NSString *)pattern success:(void (^)(NSString *, NSRange))success failure:(void (^)())failure {
    if (self.length <= 0) {
        return NO;
    }
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:(NSRegularExpressionCaseInsensitive/*大小写敏感*/) error:nil];
    //开始匹配
    NSArray *matches = [regex matchesInString:self options:(NSMatchingReportCompletion/*完整匹配*/) range:NSMakeRange(0, self.length)];
    if (matches.count) {
        NSTextCheckingResult *result = matches.firstObject;
        NSString *str = [self substringWithRange:result.range];
        NSMutableString *resultString = [[NSMutableString alloc]initWithString:self];
        for (NSTextCheckingResult *result in matches) {
            [resultString replaceCharactersInRange:result.range withString:str];
        }
        NSArray *arr = [resultString componentsSeparatedByString:str];
        for (NSString *str1 in arr) {
            if ([str1 isEqualToString:@""]) continue;
            success(str1, [self rangeOfString:str1]);
        }
        return YES;
    }else {
        failure();
        return NO;
    }
}

- (BOOL)regexWithPattern:(NSString *)pattern success:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    if (self.length <= 0) {
        return NO;
    }
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:(NSRegularExpressionCaseInsensitive/*大小写敏感*/) error:nil];
    //开始匹配
    NSArray *matches = [regex matchesInString:self options:(NSMatchingReportCompletion/*完整匹配*/) range:NSMakeRange(0, self.length)];
    if (matches.count) {
        NSMutableDictionary *resultDic = [NSMutableDictionary new];
        for (NSTextCheckingResult *result in matches) {
            [resultDic setObject:[NSValue valueWithRange:result.range] forKey: [self substringWithRange:result.range]];
        }
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:resultDic];
        success(dic);
        return YES;
    }else {
        failure();
        return NO;
    }
}
- (BOOL)regexWithQQSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regexWithPattern:@"^[0-9]{5,12}$" success:success failure:failure];
}
- (BOOL)regexWithPhoneSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regexWithPattern:@"1[3578][0-9]{9}$" success:success failure:failure];
}
- (BOOL)regexWithMailSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regexWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" success:success failure:failure];
}
- (BOOL)regexWithCardIDSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regexWithPattern:@"^(\\d{14}|\\d{17})(\\d|[xX])$" success:success failure:failure];
}
//- (BOOL)regularExpressionWithCarNoSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
//    return [self regularExpressionWithPattern:@"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$" success:success failure:failure];
//}
@end
