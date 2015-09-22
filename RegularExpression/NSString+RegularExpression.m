//
//  NSString+RegularExpression.m
//  RegularExpression
//
//  Created by Jniying on 15/9/22.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)

- (BOOL)regularExpressionWithPattern:(NSString *)pattern success:(void (^)(NSDictionary *))success failure:(void (^)())failure {
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
- (BOOL)regularExpressionWithQQSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regularExpressionWithPattern:@"^[0-9]{5,12}$" success:success failure:failure];
}
- (BOOL)regularExpressionWithPhoneSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regularExpressionWithPattern:@"1[3578][0-9]{9}$" success:success failure:failure];
}
- (BOOL)regularExpressionWithMailSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regularExpressionWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" success:success failure:failure];
}
- (BOOL)regularExpressionWithCardIDSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
    return [self regularExpressionWithPattern:@"^(\\d{14}|\\d{17})(\\d|[xX])$" success:success failure:failure];
}
//- (BOOL)regularExpressionWithCarNoSuccess:(void (^)(NSDictionary *))success failure:(void (^)())failure {
//    return [self regularExpressionWithPattern:@"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$" success:success failure:failure];
//}
@end
