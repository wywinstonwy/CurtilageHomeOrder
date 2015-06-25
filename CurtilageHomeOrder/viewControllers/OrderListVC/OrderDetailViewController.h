//
//  OrderDetailViewController.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderDetailViewController : BaseViewController
@property (nonatomic,weak) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic,weak) IBOutlet UITableView *tableOrderState;
@property (nonatomic,weak) IBOutlet UITableView *tableOrderDetail;
@property (nonatomic,weak) IBOutlet UILabel *lblLineCurrent;

-(IBAction)btnClickSelect:(UIButton *)sender;
@end
