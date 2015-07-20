//
//  ForgetPdViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "ForgetPdViewController.h"

@interface ForgetPdViewController ()

@end

@implementation ForgetPdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];

    self.btnSubmit.layer.cornerRadius = 6.0f;
    // Do any additional setup after loading the view from its nib.
}


-(IBAction)btnClickSubmit:(id)sender
{
    if ([Tools isEmptyOrNull:self.textPhone.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    if (![Tools isMobileNumber:self.textPhone.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号输入有误，请重新输入！"];
        return;
    }

    if([Tools isEmptyOrNull:self.textCode.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
    }
    
    if ([Tools isEmptyOrNull:self.textpsd.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if (![self.textpsd.text isEqualToString:self.textpsdAgain.text])
    {
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致，请检查"];
        return;
    }
    
    
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:self.textPhone.text,@"mobile", self.textCode.text,@"validateCode",self.textpsd.text,@"password",self.textpsdAgain.text,@"confirmPassword",nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/findForgetPassForUser.action" parameters:param forSucess:^(id result) {
        
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
