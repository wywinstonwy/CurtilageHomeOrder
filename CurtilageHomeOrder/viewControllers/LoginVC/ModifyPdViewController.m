//
//  ModifyPdViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "ModifyPdViewController.h"

@interface ModifyPdViewController ()

@end

@implementation ModifyPdViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    self.title = @"重置密码";
    self.btnSubmit.layer.cornerRadius = 6.0f;
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)btnClickSubmit:(id)sender
{
    if ([Tools isEmptyOrNull:self.textPsd.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    if ([Tools isEmptyOrNull:self.textPsd.text])
    {
        [SVProgressHUD showErrorWithStatus:@"请输入新密码"];
        return;
    }
    NSString *userId = [CKUserManager getValueForKey:USER_ID];
    
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:userId,@"userToken",self.textPsd.text,@"oldPassord",self.textPsdAgain.text,@"newPassord",nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/updatePassForUser.action" parameters:param forSucess:^(id result) {
        
        NSInteger statuascode = [[result objectForKey:@"resultNumber"] integerValue];
        if (statuascode == 0) {
            [SVProgressHUD showSuccessWithStatus:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
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
