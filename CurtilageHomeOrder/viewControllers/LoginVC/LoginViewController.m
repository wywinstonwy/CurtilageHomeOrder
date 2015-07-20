//
//  LoginViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPdViewController.h"
@interface LoginViewController ()
{
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.navigationController.navigationBar.tintColor = setNaviColor;
    self.btnLogin.layer.cornerRadius = self.btnRegister.layer.cornerRadius = 4.0f;
    self.btnLogin.backgroundColor = self.btnRegister.backgroundColor = setNaviColor;
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    
    self.btnRegister.top = SCREEN_HEIGHT - 128;
    [self addNavgationBarColor:setNaviColor andTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

    // Do any additional setup after loading the view from its nib.
}

- (void)popBack
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)btnClickLogin:(id)sender
{
    if ([Tools isEmptyOrNull:self.textfieldUserName.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入账号"];
        return;
    }
    if ([Tools isEmptyOrNull:self.textfieldPassWord.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:self.textfieldUserName.text,@"mobile",self.textfieldPassWord.text,@"password",@"0",@"userType", nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/loginForUser.action" parameters:param forSucess:^(id result) {
        
        NSInteger statuascode = [[result objectForKey:@"resultNumber"] integerValue];
        if (statuascode == 0) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        else
            [SVProgressHUD showErrorWithStatus:[result objectForKey:@"resultMessage"]];
        
        
    } forFail:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:NETTIPS];
    }];
}
- (IBAction)btnClickforgetPd:(id)sender
{
    ForgetPdViewController *viewFlag = [[ForgetPdViewController alloc] init];
    [self pushToViewController:viewFlag anmation:YES];
}

- (IBAction)btnClickRegister:(id)sender
{

    RegisterViewController *viewFlag = [RegisterViewController new];
    [self pushToViewController:viewFlag anmation:YES];
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
