//
//  CKCommitOrderVC.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/13.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface CKCommitOrderVC : BaseViewController
@property(nonatomic,weak) IBOutlet UITableView *tableview;
- (IBAction)btnClickSureCommitOrder:(id)sender;
@end
