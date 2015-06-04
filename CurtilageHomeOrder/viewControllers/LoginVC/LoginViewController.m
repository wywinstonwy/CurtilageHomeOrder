//
//  LoginViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = setNaviColor;
    self.btnLogin.layer.cornerRadius = self.btnRegister.layer.cornerRadius = 4.0f;
    self.btnLogin.backgroundColor = self.btnRegister.backgroundColor = setNaviColor;
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)popBack
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)btnClickLogin:(id)sender
{
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"" parameters:nil forSucess:^(id result) {
        
    } forFail:^(NSError *error) {
        
    }];
}
- (IBAction)btnClickforgetPd:(id)sender
{

}

- (IBAction)btnClickRegister:(id)sender
{

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
