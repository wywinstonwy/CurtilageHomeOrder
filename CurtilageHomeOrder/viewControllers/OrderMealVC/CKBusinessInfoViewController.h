//
//  CKBusinessInfoViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface CKBusinessInfoViewController : BaseViewController
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UIView *viewHeader;
@property (nonatomic,strong) IBOutlet UITableView *tableview;
@end
