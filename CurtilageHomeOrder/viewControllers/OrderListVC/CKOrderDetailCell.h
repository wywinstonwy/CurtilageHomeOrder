//
//  CKOrderDetailCell.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-25.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKOrderDetailCell : UITableViewCell
@property(nonatomic,weak) IBOutlet UILabel *lblName;
@property(nonatomic,weak) IBOutlet UILabel *lblCount;
@property(nonatomic,weak) IBOutlet UILabel *lblPrice;

@end
