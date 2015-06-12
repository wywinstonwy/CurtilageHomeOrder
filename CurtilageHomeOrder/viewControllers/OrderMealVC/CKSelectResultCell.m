//
//  CKSelectResultCell.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/12.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKSelectResultCell.h"

@implementation CKSelectResultCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setCellContent:(CKFoodListModel *)model indexPath:(NSIndexPath *)indePath;
{
    self.lblName.text = model.foodName;
    self.lblPrice.text = [NSString stringWithFormat:@"￥%.1f",[model.foodPrice floatValue]*[model.foodSelectCount integerValue]];
    self.lblCount.text = model.foodSelectCount;
    if ([model.foodSelectCount integerValue]>0)
    {
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

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
