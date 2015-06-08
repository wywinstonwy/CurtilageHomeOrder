//
//  BusinessDetailsViewController.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface BusinessDetailsViewController : BaseViewController
@property(nonatomic,weak)IBOutlet UILabel *lblLine;
@property(nonatomic,weak)IBOutlet UIScrollView *mainScrollView;
//菜单切换按钮
- (IBAction)btnSelectMenuFunction:(UIButton *)sender;
@end
