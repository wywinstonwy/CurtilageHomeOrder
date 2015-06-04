//
//  LoginViewController.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^loginResultBlock)(id result);
@interface LoginViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UITextField *textfieldUserName;
@property (nonatomic, weak) IBOutlet UITextField *textfieldPassWord;
@property (nonatomic, weak) IBOutlet UIButton *btnLogin;
@property (nonatomic, weak) IBOutlet UIButton *btnForgetPd;
@property (nonatomic, weak) IBOutlet UIButton *btnRegister;
@property (nonatomic, weak) loginResultBlock loginresultBlock;

- (IBAction)btnClickLogin:(id)sender;
- (IBAction)btnClickforgetPd:(id)sender;

- (IBAction)btnClickRegister:(id)sender;

@end
