//
//  CKBusinessInfoView.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKBusinessInfoView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UIView *viewHeader;
@property (nonatomic,strong) IBOutlet UITableView *tableview;
@end
