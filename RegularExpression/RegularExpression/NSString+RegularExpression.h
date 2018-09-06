//
//  NSString+RegularExpression.h
//  RegularExpression
//
//  Created by Jniying on 15/9/22.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)
/**
 *  直接判断是否匹配
 *
 *  @param pattern 匹配格式
 */
- (BOOL)isRegexWithPattern:(NSString *)pattern;
/**
 *  正则表达式匹配每找到一个结果回调一次
 *
 *  @param pattern 匹配格式
 *  @param success 成功回调，返回结果字符串，字符串的范围
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexAtOneWithPattern:(NSString *)pattern success:(void(^)(NSString *Result, NSRange range))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配每找到一个结果把字符串切分为每个字符串返回
 *
 *  @param pattern 匹配格式
 *  @param success 成功回调，返回结果字符串，字符串的范围
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexSubStringWithPattern:(NSString *)pattern success:(void(^)(NSString *Result, NSRange range))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配
 *
 *  @param pattern 匹配格式
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexWithPattern:(NSString *)pattern success:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配QQ
 *
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexWithQQSuccess:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配手机号码
 *
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexWithPhoneSuccess:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配邮箱
 *
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexWithMailSuccess:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配生分证号码
 *
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
- (BOOL)regexWithCardIDSuccess:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;
/**
 *  正则表达式匹配车牌号码
 *
 *  @param success 成功回调，返回一个装有结果字典object为结果范围，key为匹配结果的字符串
 *  @param failure 失败回调
 *
 *  @return 判断是否匹配成功
 */
//- (BOOL)regularExpressionWithCarNoSuccess:(void(^)(NSDictionary *successResult))success  failure:(void(^)())failure;

@end
