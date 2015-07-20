//
//  RegisterViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "RegisterViewController.h"
#import "CKUserProcolViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];

    self.btnRegister.layer.cornerRadius = 6.0f;
    // Do any additional setup after loading the view from its nib.
}


-(IBAction)btnAgreen:(id)sender
{
    CKUserProcolViewController *viewFlag = [CKUserProcolViewController new];
    [self pushToViewController:viewFlag anmation:YES];
    
}
//注册
-(IBAction)btnRegister:(id)sender
{
    if ([Tools isEmptyOrNull:self.textNickName.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if([Tools isEmptyOrNull:self.textPhone.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if ([Tools isEmptyOrNull:self.textCode.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
    }
    if (![Tools isMobileNumber:self.textPhone.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号输入有误，请重新输入！"];
        return;
    }
    if ([Tools isEmptyOrNull:self.textpsd.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if (![self.textpsd.text isEqualToString:self.textpsdAgain.text])
    {
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致，请检查"];
        return;
    }
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:self.textPhone.text,@"mobile",self.textCode.text,@"validateCode",self.textpsd.text,@"password",@"0",@"userType", nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/regForUser.action" parameters:param forSucess:^(id result) {
        
        NSInteger statuascode = [[result objectForKey:@"resultNumber"] integerValue];
        if (statuascode == 0) {
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
            [SVProgressHUD showErrorWithStatus:[result objectForKey:@"resultMessage"]];
        
    } forFail:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:NETTIPS];
    }];

}
//获取验证码
-(IBAction)btnGetVerificationCode:(id)sender
{
    if([Tools isEmptyOrNull:self.textPhone.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![Tools isMobileNumber:self.textPhone.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号输入有误，请重新输入！"];
        return;
    }
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:self.textPhone.text,@"mobile",@"",@"clientType", nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/sendValidateCode.action" parameters:param forSucess:^(id result) {
        NSInteger statuascode = [[result objectForKey:@"resultNumber"] integerValue];
        if (statuascode == 0) {
            [SVProgressHUD showSuccessWithStatus:@"验证码发送成功"];
        }
        else
            [SVProgressHUD showErrorWithStatus:[result objectForKey:@"resultMessage"]];
        
        
    } forFail:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:NETTIPS];
    }];
}

-(IBAction)btnAgreenPorocol:(id)sender
{
    CKUserProcolViewController *viewFlag = [[CKUserProcolViewController alloc] init];
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
