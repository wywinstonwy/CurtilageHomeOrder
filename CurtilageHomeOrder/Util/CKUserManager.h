//
//  CKUserManager.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKUserManager : NSObject
//保存用户信息
+(void)saveValue:(id)value ForKey:(NSString *)key;
//获取用户信息
+(id)getValueForKey:(NSString *)key;
//验证是否用户登录
+(BOOL)isLogin;
//清楚用户登录信息
+(void)cleanUserInfo;
@end
