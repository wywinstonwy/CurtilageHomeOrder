//
//  CKSelectResultCell.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/12.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKButton.h"
#import "CKFoodListModel.h"
@interface CKSelectResultCell : UITableViewCell
@property (nonatomic ,weak) IBOutlet UILabel *lblName;//
@property (nonatomic ,weak) IBOutlet UILabel *lblPrice;//
@property (nonatomic ,weak) IBOutlet CKButton *btnReduce;//——
@property (nonatomic ,weak) IBOutlet CKButton *btnPlus;//+
@property (nonatomic ,weak) IBOutlet UILabel *lblCount;//数量

- (void)setCellContent:(CKFoodListModel *)model indexPath:(NSIndexPath *)indePath;

@end
