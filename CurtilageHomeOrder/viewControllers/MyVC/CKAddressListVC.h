//
//  CKAddressListVC.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/14.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^selectResultBlock)(id result);
@interface CKAddressListVC : BaseViewController
@property (nonatomic,weak) IBOutlet UITableView *tableview;
@property (nonatomic,strong) selectResultBlock selectBlock;//地址选择回调
@end
