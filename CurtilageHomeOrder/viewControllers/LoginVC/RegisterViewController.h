//
//  RegisterViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController
@property (nonatomic,weak)  IBOutlet UITextField *textNickName;
@property (nonatomic,weak)  IBOutlet UITextField *textPhone;
@property (nonatomic,weak)  IBOutlet UITextField *textCode;
@property (nonatomic,weak)  IBOutlet UITextField *textpsd;
@property (nonatomic,weak)  IBOutlet UITextField *textpsdAgain;
@property (nonatomic,weak) IBOutlet UIButton *btnAgreen;
@property (nonatomic,weak)  IBOutlet UIButton *btnRegister;



@end
