//
//  OrderListViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "OrderListViewController.h"
#import "LoginViewController.h"
@interface OrderListViewController ()

@end

@implementation OrderListViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.view.backgroundColor = setNaviColor;
    self.btnLogin.cornerRadius = 5.0f;
    self.btnLogin.backgroundColor = setNaviColor;
    self.btnLogin.layer.cornerRadius = 5.0f;
}
- (IBAction)login
{
    LoginViewController *viewFlag = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewFlag];
    navi.navigationBar.tintColor = setNaviColor;
    [self presentViewController:navi animated:YES completion:^{
        
    }];

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
