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
@property(nonatomic,weak)IBOutlet UIView *viewStoreNotifi;//店内通知
//菜单切换按钮，选餐，评论，商户详情
- (IBAction)btnSelectMenuFunction:(UIButton *)sender;
//关闭店内通知
- (IBAction)btnClickCloseStoreNotifi:(UIButton *)sender;
@end
