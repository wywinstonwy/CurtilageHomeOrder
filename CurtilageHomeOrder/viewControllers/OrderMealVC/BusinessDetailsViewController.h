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

//新增免折
@property (nonatomic,weak) IBOutlet UIImageView *imageNew;
@property (nonatomic,weak) IBOutlet UIImageView *imageZhe;
@property (nonatomic,weak) IBOutlet UIImageView *imageZeng;
@property (nonatomic,weak) IBOutlet UIImageView *imageMian;

//新增免折
@property (nonatomic,weak) IBOutlet UILabel *lblNew;
@property (nonatomic,weak) IBOutlet UILabel *lblZhe;
@property (nonatomic,weak) IBOutlet UILabel *lblZeng;
@property (nonatomic,weak) IBOutlet UILabel *lblMian;


//菜单切换按钮，选餐，评论，商户详情
- (IBAction)btnSelectMenuFunction:(UIButton *)sender;
//关闭店内通知
- (IBAction)btnClickCloseStoreNotifi:(UIButton *)sender;
@end
