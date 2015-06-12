//
//  CKChooseMealViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-11.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface CKChooseMealViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView *tableViewFoodClass;
@property(nonatomic,weak) IBOutlet UITableView *tableViewFoodList;
@property(nonatomic,weak) IBOutlet UILabel *lblOderCount;
@property(nonatomic,weak) IBOutlet UIButton *btnBuy;
@end
