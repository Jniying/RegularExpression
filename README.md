# RegularExpression

查找结果字符串
- (BOOL)regexAtOneWithPattern:(NSString *)pattern success:(void(^)(NSString *result, NSRange range))success  failure:(void(^)())failure;

如:
          NSString *str = @"aaaaa[cccc]fffff[test]";
        [str regexAtOneWithPattern:@"\\[[a-zA-Z0-9]+\\]" success:^(NSString *result, NSRange range) {
            NSLog(@"%@---%@", result ,NSStringFromRange(range));
        } failure:^{
            NSLog(@"失败");
        }];
回调两次success() 
        输出: [cccc]---{5, 6}
              [test]---{16, 6}
              
查找结果以外的字符串
- (BOOL)regexSubStringWithPattern:(NSString *)pattern success:(void(^)(NSString *result, NSRange range))success  failure:(void(^)())failure;

如:
    NSString *str = @"aaaaa[cccc]fffff[test]";
    [str regexSubStringWithPattern:@"\\[[a-zA-Z0-9]+\\]" success:^(NSString *result, NSRange range) {
            NSLog(@"%@---%@", result ,NSStringFromRange(range));
        } failure:^{
            NSLog(@"失败");
        }];
回调两次success() 
        输出: aaaaa---{0, 5}
              fffff---{11, 5}
