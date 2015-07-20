//
//  MacroDefinition.h
//  CarModelHeadlines
//
//  Created by wy on 15/3/20.
//  Copyright (c) 2015年 北京智阅网络科技有限公司. All rights reserved.
//

#ifndef CarModelHeadlines_MacroDefinition_h
#define CarModelHeadlines_MacroDefinition_h

//系统
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)

#define IOS7 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0)


//屏幕
#define SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT     [[UIScreen mainScreen] bounds].size.height
//颜色
#define setNaviColor    [UIColor colorWithRed:0.898 green:0.208 blue:0.431 alpha:1.000]
#define setMenuBack      [UIColor colorWithRed:56.0/255 green:62.0/255 blue:75.0/255 alpha:1.0]

#define setBackGrayColor [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]
//灰色字体颜色
#define setGrayFontColor [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1]
//分割线
#define setSeparatorColor    [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]
//设置大标题颜色
#define setTitlecolor    [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
//#define ImagePlaceholder21  [UIImage imageNamed:@"Default21"]
//#define ImagePlaceholder32  [UIImage imageNamed:@"Default32"]
//#define ImagePlaceholder11  [UIImage imageNamed:@"Default11"]

//字体
#define Font15          [UIFont systemFontOfSize:15]
#define Font12          [UIFont systemFontOfSize:12]
#define Font13          [UIFont systemFontOfSize:13]
#define Font18          [UIFont systemFontOfSize:18]

//接口地址//  http://42.96.167.31:8080/
#define SERVER_URL @"http://42.96.167.31:8080/"



#define USER_NAME       @"USER_NAME1"//用户名
#define USER_NICKNAME   @"USER_NICKNAME"//昵称
#define USER_VERIFYKEY  @"USER_verifyKey"//用户验证key
#define USER_PHONENUMER @"USER_PHONENUMER"//用户手机号
#define USER_IMAGE      @"USER_IMAGE"//用户头像
#define USER_PASSWORD   @"USER_PASSWORD"//用户密码
#define USER_ID         @"USER_ID"//用户id

#define NETTIPS         @"网络异常，请稍后重试！"


#endif
