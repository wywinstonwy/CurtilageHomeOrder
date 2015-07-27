//
//  CKOrderListCell.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKOrderListCell.h"
#import "UIImageView+WebCache.h"
@implementation CKOrderListCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setCellContentWithModel:(CKOrderListModel *)dataModel;
{
    [self.imageHeader sd_setImageWithURLString:dataModel.merchantPictrue placeholderImage:nil];
    self.lblTitle.text = dataModel.merchantName;
    self.lblPrice.text =[NSString stringWithFormat:@"总价共￥%@元",dataModel.preferentialPrice] ;
    self.lblStatus.text =[self setStatusWithIndex:[dataModel.status integerValue]];
    self.lblTime.text = dataModel.insertDateTimeStr;
}

-(NSString *)setStatusWithIndex:(NSInteger)index
{
    NSString *strStutas;
    switch (index) {
        case 0:
        {
          strStutas = @"已取消";
        }break;
        case 1:
        {
            strStutas = @"提交成功";
            
        }break;
        case 2:
        {
           strStutas = @"等待支付";
        }break;
        case 3:
        {
          strStutas = @"已支付";
        }break;
        case 4:
        {
            strStutas = @"商家确认";
        }break;
        case 5:
        {
          strStutas = @"配送员赶往商家取餐";
        }break;
        case 6:
        {
            strStutas = @"配送员已取餐";
            
        }break;
        case 7:
        {
           strStutas = @"已送达";
        }break;
        case 8:
        {
            strStutas = @"待评价";
        }break;
        case 9:
        {
           strStutas = @"订单完成";
        }break;
        case 10:
        {
            strStutas = @"退款中";
            
        }break;
        case 11:
        {
           strStutas = @"已退款";
        }break;
        case 21:
        {
           strStutas = @"商户投诉用户";
        }break;
        case 22:
        {
           strStutas = @"用户投诉用户";
        }break;

    
        default:
            strStutas = @"";
            break;
    }
    return strStutas;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
