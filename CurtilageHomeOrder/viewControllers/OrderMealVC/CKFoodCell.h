//
//  CKFoodCell.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/9.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKFoodListModel.h"
@interface CKFoodCell : UITableViewCell
@property (nonatomic ,weak) IBOutlet UIButton *btnSelectStandard;//可选规格
@property (nonatomic ,weak) IBOutlet UILabel *lblName;//
@property (nonatomic ,weak) IBOutlet UIButton *btnReduce;//——
@property (nonatomic ,weak) IBOutlet UIButton *btnPlus;//+
@property (nonatomic ,weak) IBOutlet UILabel *lblCount;//数量

- (void)setCellContent:(CKFoodListModel *)model indexPath:(NSIndexPath *)indePath;

@end
