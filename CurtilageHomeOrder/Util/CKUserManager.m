//
//  CKUserManager.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKUserManager.h"

@implementation CKUserManager
+(void)saveValue:(id)value ForKey:(NSString *)key;
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
+(id)getValueForKey:(NSString *)key;
{
    id result = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return result;
}
+(BOOL)isLogin;
{
    if (![Tools isEmptyOrNull:[CKUserManager getValueForKey:USER_ID]]) {
        return YES;
    }
    
    return NO;
}
//清楚用户登录信息
+(void)cleanUserInfo
{
    //    [UserManager saveValue:nil ForKey:USER_TOKEN];
    //    [UserManager saveValue:nil ForKey:USER_PHONENUMER];
    //    [UserManager saveValue:@"" ForKey:USER_NAME];
    [CKUserManager saveValue:@"" ForKey:USER_IMAGE];
    [CKUserManager saveValue:@"" ForKey:USER_ID];
    [CKUserManager saveValue:@"" ForKey:USER_VERIFYKEY];
    [CKUserManager saveValue:@"" ForKey:USER_NICKNAME];
    
}
@end
