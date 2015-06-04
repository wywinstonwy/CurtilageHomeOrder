//
//  Tools.m
//  CarModelHeadlines
//
//  Created by wy on 15/3/20.
//  Copyright (c) 2015年 北京智阅网络科技有限公司. All rights reserved.
//

#import "Tools.h"
#import <CommonCrypto/CommonDigest.h>
@implementation Tools



//+ (NSString *)sha1:(NSString *)str {
//    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:str.length];
//    
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    
//    
//    CC_SHA1(data.bytes, data.length, digest);
//    
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
//        [output appendFormat:@"%02x", digest[i]];
//    }
//    
//    return output;
//}

+ (NSString *)md5Hash:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSString *md5Result = [NSString stringWithFormat:
                           @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                           result[0], result[1], result[2], result[3],
                           result[4], result[5], result[6], result[7],
                           result[8], result[9], result[10], result[11],
                           result[12], result[13], result[14], result[15]
                           ];
    return md5Result;
}
#pragma mark NSString 为空(nil)的验证
+ (BOOL)isEmptyOrNull:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([string isEqualToString:@"null"]) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
#pragma mark  Email验证
+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark 电话号验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181
     22         */
    NSString * CT = @"^1((33|77|70|53|81|8[09])[0-9]|349)\\d{7}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
        
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
#pragma mark 验证身份证是否合法
/**
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */
+ (BOOL)isIdCard:(NSString *)sPaperId
{
    //判断位数
    if ([sPaperId length] < 15 ||[sPaperId length] > 18) {
        return NO;
    }
    NSString *carid = sPaperId;
    long lSumQT =0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    //将15位身份证号转换成18位
    NSMutableString *mString = [NSMutableString stringWithString:sPaperId];
    if ([sPaperId length] == 15) {
        [mString insertString:@"19" atIndex:6];
        long p = 0;
        const char *pid = [mString UTF8String];
        for (int i=0; i<=16; i++)
        {
            p += (pid[i]-48) * R[i];
        }
        int o = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        carid = mString;
        
    }
    //判断地区码
    NSString * sProvince = [carid substringToIndex:2];
    
    if (![self areaCode:sProvince]) {
        
        return NO;
    }
    //判断年月日是否有效
    /*
     //年份
     int strYear = [[self getStringWithRange:carid Value1:6 Value2:4] intValue];
     //月份
     int strMonth = [[self getStringWithRange:carid Value1:10 Value2:2] intValue];
     //日
     int strDay = [[self getStringWithRange:carid Value1:12 Value2:2] intValue];
     */
    //年份
    int strYear = [[carid substringWithRange:NSMakeRange(6, 4)]intValue];
    //月份
    int strMonth = [[carid substringWithRange:NSMakeRange(10, 2)]intValue];
    //日
    int strDay = [[carid substringWithRange:NSMakeRange(12, 2)]intValue];
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        
        return NO;
    }
    
    const char *PaperId  = [carid UTF8String];
    
    //检验长度
    if( 18 != strlen(PaperId)) return -1;
    //校验数字
    for (int i=0; i<18; i++)
    {
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) )
        {
            return NO;
        }
    }
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17] )
    {
        return NO;
    }
    
    return YES;
}


//对图片尺寸进行压缩--

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize

{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
    
}

/**
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
+(BOOL)areaCode:(NSString *)code
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"北京" forKey:@"11"];
    [dic setObject:@"天津" forKey:@"12"];
    [dic setObject:@"河北" forKey:@"13"];
    [dic setObject:@"山西" forKey:@"14"];
    [dic setObject:@"内蒙古" forKey:@"15"];
    [dic setObject:@"辽宁" forKey:@"21"];
    [dic setObject:@"吉林" forKey:@"22"];
    [dic setObject:@"黑龙江" forKey:@"23"];
    [dic setObject:@"上海" forKey:@"31"];
    [dic setObject:@"江苏" forKey:@"32"];
    [dic setObject:@"浙江" forKey:@"33"];
    [dic setObject:@"安徽" forKey:@"34"];
    [dic setObject:@"福建" forKey:@"35"];
    [dic setObject:@"江西" forKey:@"36"];
    [dic setObject:@"山东" forKey:@"37"];
    [dic setObject:@"河南" forKey:@"41"];
    [dic setObject:@"湖北" forKey:@"42"];
    [dic setObject:@"湖南" forKey:@"43"];
    [dic setObject:@"广东" forKey:@"44"];
    [dic setObject:@"广西" forKey:@"45"];
    [dic setObject:@"海南" forKey:@"46"];
    [dic setObject:@"重庆" forKey:@"50"];
    [dic setObject:@"四川" forKey:@"51"];
    [dic setObject:@"贵州" forKey:@"52"];
    [dic setObject:@"云南" forKey:@"53"];
    [dic setObject:@"西藏" forKey:@"54"];
    [dic setObject:@"陕西" forKey:@"61"];
    [dic setObject:@"甘肃" forKey:@"62"];
    [dic setObject:@"青海" forKey:@"63"];
    [dic setObject:@"宁夏" forKey:@"64"];
    [dic setObject:@"新疆" forKey:@"65"];
    [dic setObject:@"台湾" forKey:@"71"];
    [dic setObject:@"香港" forKey:@"81"];
    [dic setObject:@"澳门" forKey:@"82"];
    [dic setObject:@"国外" forKey:@"91"];
    
    if ([dic objectForKey:code] == nil) {
        
        return NO;
    }
    return YES;
}
/**
 *  是否6-8位数字或者字母组合
 *
 *  @param BOOL 验证密码
 *
 *  @return 返回结果
 */
+ (BOOL)isPassWord:(NSString *)strPassword
{
    NSString *regex = @"^[A_Za-z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:strPassword];
    
    return isMatch;
}
/**
 * 功能:获取指定范围的字符串
 * 参数:字符串的开始小标
 * 参数:字符串的结束下标
 */
/*
 +(NSString *)getStringWithRange:(NSString *)str Value1:(int)value1 Value2:(int )value2;
 {
 return [str substringWithRange:NSMakeRange(value1, value2)];
 }*/

/**
 * 功能:验证一个数是否是浮点数
 * 参数:浮点数
 
 #pragma mark 验证一个数是否是浮点数
 + (BOOL)isFloatingNumber:(NSString *)fnumber{
 NSString *floatRegex = @"/^-?([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0)$/";
 NSPredicate *floatTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", floatRegex];
 return [floatTest evaluateWithObject:fnumber];
 }*/

/**
 生成当前时间字符串
 @returns 当前时间字符串
 */
//获取当前时间 作为录音的名称
+(NSString *) getCurrentTimeString
{
    //用时间命名//
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy_MM_dd_HHmmss"];
    
    NSString *timeString = [NSString stringWithString:[dateFormatter stringFromDate:date]];
    return timeString;
}


//获取存储路径字符串函数 参数：录音名称 存储类型
+(NSString *)getPathString:(NSString *)pathName type:(NSString *)pathType
{
    //获取路径//
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentDirectory=[paths objectAtIndex:0];
    
    //获取存储URL//
    NSString *soundFilePath = [[documentDirectory stringByAppendingPathComponent:pathName] stringByAppendingPathExtension:pathType];
    return soundFilePath;
}
/**
 获取缓存路径
 @returns 缓存路径
 */
+ (NSString*)getCacheDirectory
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    return [paths objectAtIndex:0];
}

/**
 判断文件是否存在
 @param _path 文件路径
 @returns 存在返回yes
 */
+ (BOOL)fileExistsAtPath:(NSString*)_path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:_path];
}

/**
 删除文件
 @param _path 文件路径
 @returns 成功返回yes
 */
+ (BOOL)deleteFileAtPath:(NSString*)_path
{
    return [[NSFileManager defaultManager] removeItemAtPath:_path error:nil];
}

/**
 获取当前系统日期
 @returns 月日
 */
+(NSString *)getSystemDate{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM月dd日"];
    return [dateformatter stringFromDate:senddate];
}
+(NSString *)getSystemDateyyyy{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    return [dateformatter stringFromDate:senddate];
}
/**
 @param strdate 日期字符
 @returns 转换后的日期
 */
+(NSDate *)stringToDate:(NSString *)strdate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strdate];
    return retdate;
}
/**
 NSDate 转 NSString
 @param date 要转的日期
 @returns 转后的日期字符
 */
+(NSString *)dateToString:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSString *)dateAfterDay:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *strDate = [dateFormatter stringFromDate:dateAfterDay];
    
    return strDate;
}
//返回day天后的日期(若day为负数,则为|day|天前的日期)
+ (NSString *)dateAfterDay2:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:[NSDate date] options:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:dateAfterDay];
    
    return strDate;
}
/**
 *  .时间返回与刷新时间比较：两分钟内刚刚，2-60分内，1-23小时，一天，昨天，几天前，几个月前
 *
 *  @param str1 时间字符串
 *
 *  @return 显示时间
 */
+(NSString *) stringTimeWithString:(NSString *)str1
{
    NSString * str = [[[str1 stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate* inputDate = [inputFormatter dateFromString:str];
    NSLog(@"date = %@", inputDate);
    
    NSTimeInterval inputtimer = [inputDate timeIntervalSince1970];
    NSLog(@"inputtimer:%f",inputtimer);
    
    NSDate *dateNow = [NSDate date];
    NSTimeInterval nowTimer = [dateNow timeIntervalSince1970];
    NSLog(@"nowTimer:%f",nowTimer);
    
    NSTimeInterval inteval = nowTimer - inputtimer;
    
    if (inteval<60*2 )//两分钟内
    {
        return @"刚刚";
    }
    else if (inteval > 60*2 && inteval <= 3600)//一小时内
    {
        return @"一小时内";
    }
    else if(inteval > 3600 && inteval< 3600*24)//大于一小时，小于一天
    {
        int t = inteval/3600;
        return [NSString stringWithFormat:@"%d小时前",t];
        
    }
    else if (inteval >= 86400 && inteval<= 86400*2)//昨天
    {
        return @"昨天";
    }
    else if (inteval>86400*2 && inteval<=86400*30)//第二天到一个月内
    {
        int t = inteval/86400;
        return [NSString stringWithFormat:@"%d天前",t];
        
    }
    else if (inteval > 2592000 && inteval <= 2592000*12)//一年内
    {
        int t = inteval/2592000;
        return [NSString stringWithFormat:@"%d个月前",t];
        
    }
    else //if (inteval> 86400*30*12)
    {
        int t = inteval/31104000;
        return [NSString stringWithFormat:@"%d年前",t];
    }
    
    
}
+(BOOL)isNetWorkStatus{
//    NetworkStatus networkStatus = [Reachability reachabilityForInternetConnection].currentReachabilityStatus;
//    if (networkStatus == NotReachable) {
//        return NO;
//    }
    return YES;
}
//笨方法判断手机和座机号码
- (BOOL)isMobileOrTelWithText:(NSString *)telOrMobileNum
{
    BOOL isMoblieOrTel = NO;
    BOOL isMobile = NO;
    BOOL isTel = NO;
    
    NSError * mobileError = nil;
    NSString * mobileRegulation = @"^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})$";
    
    NSRegularExpression * mobileRegex = [NSRegularExpression regularExpressionWithPattern:mobileRegulation options:NSRegularExpressionCaseInsensitive error:&mobileError];
    NSLog(@"mobileRegex == %@", mobileRegex);
    
    NSArray * mobileMatchesArr = [mobileRegex matchesInString:telOrMobileNum options:NSMatchingReportProgress range:NSMakeRange(0, [telOrMobileNum length])];
    
    NSLog(@"mobileMatchesArr == %@, and count == %lu", mobileMatchesArr, (unsigned long)[mobileMatchesArr count]);
    for (NSTextCheckingResult * match in mobileMatchesArr) {
        NSString * substringForMatch = [telOrMobileNum substringWithRange:match.range];
        NSLog(@"mobile substringForMatch == %@", substringForMatch);
    }
    
    if ([mobileMatchesArr count] > 0) {
        isMobile = YES;
    } else {
        isMobile = NO;
    }
    
    
    NSError * telError = nil;
    NSString * telRegulation = @"^(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$";
    
    NSRegularExpression * telRegex = [NSRegularExpression regularExpressionWithPattern:telRegulation options:NSRegularExpressionCaseInsensitive error:&telError];
    NSLog(@"telRegex == %@", telRegex);
    
    NSArray * telMatchesArr = [telRegex matchesInString:telOrMobileNum options:NSMatchingReportProgress range:NSMakeRange(0, [telOrMobileNum length])];
    
    NSLog(@"telMatchesArr == %@, and count == %lu", telMatchesArr, (unsigned long)[telMatchesArr count]);
    for (NSTextCheckingResult * match in telMatchesArr) {
        NSString * substringForMatch = [telOrMobileNum substringWithRange:match.range];
        NSLog(@"tel substringForMatch == %@", substringForMatch);
    }
    
    if ([telMatchesArr count] > 0) {
        isTel = YES;
    } else {
        isTel = NO;
    }
    
    isMoblieOrTel = isTel || isMobile;
    
    return isMoblieOrTel;
}
//正则-提取手机号码，电话号码，网址
- (NSMutableArray *)getUrlWithString:(NSString *)string
{
    NSMutableArray * newTotalArr = [[NSMutableArray alloc] initWithCapacity:0];
    NSError * error = nil;
    // 这个也可以，下面的提取能力更好
    //    NSString *regulaStr = @"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    
    // ((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    for (NSTextCheckingResult * match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [newTotalArr addObject:substringForMatch];
    }
    
    return newTotalArr;
}

- (NSMutableArray *)getTelNumWithString:(NSString *)string
{
    NSLog(@"getMobile");
    
    NSMutableArray * totalTelArr = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray * newTotalArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray * arrayOfAllMatches = nil;
    NSRegularExpression * regex = nil;
    NSError * error = nil;
    
    NSString *regulaStr1 = @"(0\\d{2}-\\d{8})";
    regex = [NSRegularExpression regularExpressionWithPattern:regulaStr1 options:NSRegularExpressionCaseInsensitive error:&error];
    arrayOfAllMatches = [regex matchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    NSLog(@"arrayOfAllMatches == %@", arrayOfAllMatches);
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [totalTelArr addObject:substringForMatch];
    }
    
    NSString *regulaStr2 = @"(0\\d{2}-\\d{8}-\\d{4})";
    regex = [NSRegularExpression regularExpressionWithPattern:regulaStr2 options:NSRegularExpressionCaseInsensitive error:&error];
    arrayOfAllMatches = [regex matchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    NSLog(@"arrayOfAllMatches == %@", arrayOfAllMatches);
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [totalTelArr addObject:substringForMatch];
    }
    
    NSString *regulaStr3 = @"(0\\d{3}-\\d{7})";
    regex = [NSRegularExpression regularExpressionWithPattern:regulaStr3 options:NSRegularExpressionCaseInsensitive error:&error];
    arrayOfAllMatches = [regex matchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    NSLog(@"arrayOfAllMatches == %@", arrayOfAllMatches);
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [totalTelArr addObject:substringForMatch];
    }
    
    NSString *regulaStr4 = @"(0\\d{3}-\\d{7}-\\d{4})";
    regex = [NSRegularExpression regularExpressionWithPattern:regulaStr4 options:NSRegularExpressionCaseInsensitive error:&error];
    arrayOfAllMatches = [regex matchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    NSLog(@"arrayOfAllMatches == %@", arrayOfAllMatches);
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [totalTelArr addObject:substringForMatch];
    }
    
    for (NSUInteger i = 0; i < [totalTelArr count]; i++) {
        NSString * telNum = [totalTelArr objectAtIndex:i];
        if (![newTotalArr containsObject:telNum]) {
            [newTotalArr addObject:telNum];
        }
    }
    
    NSLog(@"totalTelArr == %@", totalTelArr);
    NSLog(@"newTotalArr == %@", newTotalArr);
    
    return newTotalArr;
}

- (NSMutableArray *)getMobileNumWithString:(NSString *)string
{
    NSMutableArray * totalTelArr = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray * newTotalArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSArray * arrayOfAllMatches = nil;
    NSRegularExpression * regex = nil;
    NSError *error = nil;
    
    NSString *regulaStr4 = @"(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})";
    regex = [NSRegularExpression regularExpressionWithPattern:regulaStr4 options:NSRegularExpressionCaseInsensitive error:&error];
    arrayOfAllMatches = [regex matchesInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, [string length])];
    NSLog(@"arrayOfAllMatches == %@", arrayOfAllMatches);
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString* substringForMatch = [string substringWithRange:match.range];
        NSLog(@"substringForMatch == %@", substringForMatch);
        [totalTelArr addObject:substringForMatch];
    }
    
    for (NSUInteger i = 0; i < [totalTelArr count]; i++) {
        NSString * telNum = [totalTelArr objectAtIndex:i];
        if (![newTotalArr containsObject:telNum]) {
            [newTotalArr addObject:telNum];
        }
    }
    
    NSLog(@"mobile newTotalArr == %@", newTotalArr);
    return newTotalArr;
}

//+(NSString *)md5ToHash:(NSString *)str {
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, strlen(cStr), result );
//    NSString *md5Result = [NSString stringWithFormat:
//                           @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//                           result[0], result[1], result[2], result[3],
//                           result[4], result[5], result[6], result[7],
//                           result[8], result[9], result[10], result[11],
//                           result[12], result[13], result[14], result[15]
//                           ];
//    return md5Result;
//}

//+ (NSString *)mYRegularExpressions:(NSString *)url
//{
//    //remove <script></script> from comment content
//    NSError *error = NULL;
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*?>.*?</script>" options:NULL error:&error];
//    NSString *lowercaseString = [url lowercaseStringWithLocale:[NSLocale currentLocale]];
//    NSString *modifedContent = [regex stringByReplacingMatchesInString:lowercaseString options:0 range:NSMakeRange(0,[lowercaseString length]) withTemplate:@""];
//
//    NSString *finalUrl = nil;
//
//    if (modifedContent.length < lowercaseString.length)
//    {
//        finalUrl = modifedContent;
//    }else
//    {
//        finalUrl = url;
//    }
//    return finalUrl;
//}

/**
 验证当前日期是否过期
 @param beginDateStr 开始的日期
 @param endDateStr 结束的日期
 @returns 未过期YES
 */
+ (BOOL)isValidateDate:(NSString *)beginDateStr andDate:(NSString *)endDateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMdd"]; //设置日期格式
    NSDate *today = [NSDate date]; //当前日期
    NSDate *beginDate = [dateFormatter dateFromString:beginDateStr];//开始日期
    NSDate *endDate = [dateFormatter dateFromString:endDateStr];//结束日期
    if ([today compare:beginDate] == NSOrderedAscending){
        NSLog(@"已过期");
        return NO;
    }
    if ([today compare:endDate] == NSOrderedDescending){
        NSLog(@"已过期");
        return NO;
    }
    NSLog(@"未过期");
    return YES;
}
//获得屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView
{
    
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+(UIImage *)fullScreenshots{
    
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    
    UIGraphicsBeginImageContext(screenWindow.frame.size);//全屏截图，包括window
    
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return viewImage;
    
    //  UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
}

//图片角标，0 普通，1热门，2原创，3，推广，4专题，5推荐，6头条客
+(UIImage *)returnImagearticleTypeLogo:(NSInteger)type;
{
    UIImage *image;
    
    switch (type) {
        case 0:
        {
            image =nil;
        }break;
        case 1:
        {
            image = [UIImage imageNamed:@"hotHome"];
            
        }break;
        case 2:
        {
            image = [UIImage imageNamed:@"yc"];
 
        }break;
        case 3:
        {
            image = [UIImage imageNamed:@"tg"];

            
        }break;
        case 4:
        {
            image = [UIImage imageNamed:@"zt"];

            
        }break;
        case 5:
        {
            image = [UIImage imageNamed:@"tj"];
            
        }break;
        case 6:
        {
            image = [UIImage imageNamed:@"toutiaoke"];
        }break;
        default:
            return image;
            break;
    }
    
    return image;

}
+(NSString *)returnURLWithStr:(NSString *)str;
{
    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:str];
    if ([string hasPrefix:@"http"])
    {
        return string;
        
    }
    else
        return str;
}
@end
