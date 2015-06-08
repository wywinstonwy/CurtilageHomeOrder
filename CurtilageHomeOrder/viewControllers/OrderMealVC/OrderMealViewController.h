//
//  OrderMealViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface OrderMealViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UILabel *lblNavititle;
@property (nonatomic, weak) IBOutlet UITableView *tableview;
@property (nonatomic, weak) IBOutlet UIButton *btnCanTClass;
@property (nonatomic, weak) IBOutlet UIButton *btnPaixu;
@property (nonatomic, weak) IBOutlet UIButton *btnFuLi;
//下拉选择菜单
- (IBAction)btnClickfunction:(UIButton *)sender;
@end
