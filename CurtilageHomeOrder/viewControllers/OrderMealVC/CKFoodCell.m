//
//  CKFoodCell.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/9.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKFoodCell.h"

@implementation CKFoodCell

- (void)awakeFromNib {
    // Initialization code
    
    self.btnSelectStandard.layer.cornerRadius = 6;
    self.btnSelectStandard.layer.borderColor = [UIColor grayColor].CGColor;
    self.btnSelectStandard.layer.borderWidth = 1;
    
}
- (void)setCellContent:(CKFoodListModel *)dataModel indexPath:(NSIndexPath *)indePath;
{
    
    if ([dataModel.foodSelectCount integerValue]>0) {
        self.btnReduce.hidden = NO;
        self.btnPlus.hidden = NO;
        self.lblCount.hidden = NO;
    }
    else
    {
        self.btnReduce.hidden = YES;
        self.btnPlus.hidden = NO;
        self.lblCount.hidden = NO;
    }
    self.lblCount.text = dataModel.foodSelectCount;
    self.lblName.text = dataModel.foodName;
    self.btnSelectStandard.hidden = YES;
    
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
