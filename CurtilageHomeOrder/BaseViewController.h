//
//  BaseViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
@interface BaseViewController : UIViewController

- (void)addNavgationBarColor:(UIColor *)color andTitleTextAttributes:(NSDictionary *)dict;

/**
 *  设置导航栏左边按钮功能
 *
 *  @param leftImage  图片
 *  @param leftAction 点击事件
 */
- (void)setLeftBarWithLeftImage:(NSString *)leftImage action:(SEL)leftAction;
- (void)setLeftBarWithLeftTitle:(NSString *)leftTitle action:(SEL)leftAction
;
/**
 *  设置导航栏右边的按钮功能
 *
 *  @param rightImage  图片
 *  @param rightAction 方法名 点击事件
 */
- (void)setRightBarWithRightImage:(NSString *)rightImage action:(SEL)rightAction;
/**
 *  设置导航栏右边按钮
 *
 *  @param title       标题
 *  @param target      目标对象
 *  @param rightAction 点击事件
 */
- (void)setRightBarTitle:(NSString *)title target:(id)target action:(SEL)rightAction;

- (IBAction)popBack;
-(void)pushToViewController:(UIViewController *)vc anmation:(BOOL) anmation;
@end
