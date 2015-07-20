//
//  ModifyPdViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface ModifyPdViewController : BaseViewController
@property(nonatomic,weak) IBOutlet UITextField *textPsd;
@property(nonatomic,weak) IBOutlet UITextField *textPsdAgain;
@property(nonatomic,weak) IBOutlet UIButton *btnSubmit;

@end
