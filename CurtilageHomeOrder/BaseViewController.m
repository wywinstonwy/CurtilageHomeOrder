//
//  BaseViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //7.0以上版本通过一句代码解决高度上升问题
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0) {
        
        self.edgesForExtendedLayout=UIRectEdgeNone;
        
    }

    //设置导航栏字体为白色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], UITextAttributeTextColor,
                                                                     [UIColor whiteColor], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont systemFontOfSize:18], UITextAttributeFont,
                                                                     nil]];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
  //  self.navigationController.navigationBar.barTintColor =  [UIColor blueColor];

    
    // Do any additional setup after loading the view.
}
//设置导航栏颜色和导航栏字体颜色
- (void)addNavgationBarColor:(UIColor *)color andTitleTextAttributes:(NSDictionary *)dict
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        
        // self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.barTintColor = color;
        
    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
}
/**
 *  设置导航栏左边按钮功能
 *
 *  @param leftImage  图片
 *  @param leftAction 点击事件
 */
- (void)setLeftBarWithLeftImage:(NSString *)leftImage action:(SEL)leftAction
{
    UIButton *btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_back.frame = CGRectMake(0, 0, 22, 22);
    if (leftImage) {
        [btn_back setBackgroundImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    }
    if (leftAction) {
        [btn_back addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
    } else {
        [btn_back addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    }
    // btn_back.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn_back];
    //  backItem.customView.backgroundColor = setCyanColor;
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setLeftBarWithLeftTitle:(NSString *)leftTitle action:(SEL)leftAction
{
    UIButton *btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_back.frame = CGRectMake(0, 0, 60, 22);
    if (leftTitle) {
        [btn_back setTitle:leftTitle forState:UIControlStateNormal];
    }
    
    
    if (leftAction) {
        [btn_back addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
    } else {
        [btn_back addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    }
    // btn_back.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn_back];
      backItem.customView.backgroundColor = setMenuBack;
    self.navigationItem.leftBarButtonItem = backItem;
}
/**
 *  设置导航栏右边的按钮功能
 *
 *  @param rightImage  图片
 *  @param rightAction 方法名 点击事件
 */
- (void)setRightBarWithRightImage:(NSString *)rightImage action:(SEL)rightAction
{
    UIButton *btn_rihgt = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_rihgt.frame = CGRectMake(0, 0, 22, 22);
    if (rightImage) {
        [btn_rihgt setBackgroundImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    }
    if(rightAction)
    {
        [btn_rihgt addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [btn_rihgt addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    }
    // btn_rihgt.backgroundColor = [UIColor greenColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn_rihgt];
    self.navigationItem.rightBarButtonItem = rightItem;

}
/**
 *  设置导航栏右边按钮
 *
 *  @param title       标题
 *  @param target      目标对象
 *  @param rightAction 点击事件
 */
- (void)setRightBarTitle:(NSString *)title target:(id)target action:(SEL)rightAction
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:rightAction];
    rightItem.tintColor = [UIColor greenColor];
    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)popBack;
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pushToViewController:(UIViewController *)vc anmation:(BOOL) anmation;
{
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    [self.navigationController pushViewController:vc animated:anmation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
