//
//  HomeCell.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"
@implementation HomeCell

- (void)awakeFromNib
{
}
-(void)setCellContentWithModel:(CKMerchantModel *)dataModel;
{
    [self.imageVhead sd_setImageWithURL:[NSURL URLWithString:dataModel.merchantPictrue] placeholderImage:nil];
    self.lblTitle.text = dataModel.merchantName;
    self.lblTitle.width = SCREEN_WIDTH -170;
    [self.lblTitle sizeToFit];
    
    //
    dataModel.isSuportMainDelivery = @"1";
    dataModel.isSuportOnLinePay = @"1";
    
    //是否开发票
    if ([dataModel.isSuportOnLinePay boolValue])
    {
        self.imageVticket.hidden = NO;
        self.imageVticket.width = 22;
    }
    else
    {
        self.imageVticket.hidden = YES;
        self.imageVticket.width = 0;
    }
    //是否支持在线支付
    if ([dataModel.isSuportOnLinePay boolValue])
    {
        self.imageVPay.hidden = NO;
        self.imageVPay.width = 22;
    }
    else
    {
        self.imageVPay.hidden = YES;
        self.imageVPay.width = 0;

    }
    //是否支持配送
    if ([dataModel.isSuportMainDelivery boolValue])
    {
        self.imageVSend.hidden = NO;
        self.imageVSend.width = 22;
        
    }
    else
    {
        self.imageVSend.hidden = YES;
        self.imageVSend.width = 0;
    }
    self.imageVticket.left  = self.lblTitle.right+5;
    self.imageVPay.left = self.imageVticket.right;
    self.imageVSend.left = self.imageVPay.right;
    
    NSInteger score = [dataModel.score integerValue];
    [self.viewStart setStartcount:score];
    
    self.lblHasSaleCount.text = [NSString stringWithFormat:@"已售%@份",dataModel.score];
    
    self.lblInfo.text = [NSString stringWithFormat:@"起送价格￥%@|配送费￥%@|%@分钟到达",dataModel.orderMinPrice,dataModel.deliveryPrice,dataModel.deliveryPrice];
    
    self.lblNew.text = dataModel.isSuportNewStr;
    self.lblZeng.text = dataModel.isSuportGiveStr;
    self.lblMian.text = dataModel.isSuportFreeStr;
    self.lblZhe.text = dataModel.isSuportDiscountStr;
    
#warning test
    dataModel.isSuportNew = @"1";
    dataModel.isSuportGive = @"1";
    dataModel.isSuportFree = @"1";
    dataModel.isSuportDiscount = @"1";
    
    //新
    if ([dataModel.isSuportNew boolValue])
    {
        self.imageNew.width = 22;
        self.imageNew.height = 22;
        self.imageNew.hidden = NO;
        self.lblNew.height = 30;
        self.lblNew.hidden = NO;
    }
    else
    {
        self.imageNew.width = 0;
        self.imageNew.height = 0;
        self.imageNew.hidden = YES;
        self.lblNew.height = 0;
        self.lblNew.hidden = YES;
        self.lblNew.text = @"";

    }
    //增
    if ([dataModel.isSuportGive boolValue])
    {
        self.imageZeng.width = 22;
        self.imageZeng.height = 22;
        self.imageZeng.hidden = NO;
        self.lblZeng.height = 30;
        self.lblZeng.height = NO;

    }
    else
    {
        self.imageZeng.width = 0;
        self.imageZeng.height = 0;
        self.imageZeng.hidden = YES;
        self.lblZeng.height = 0;
        self.lblZeng.hidden = YES;
        self.lblZeng.text = @"";


    }
    //免
    if ([dataModel.isSuportFree boolValue])
    {
        self.imageMian.width = 22;
        self.imageMian.height = 22;
        self.imageMian.hidden = NO;
        self.lblMian.height = 30;
        self.lblMian.hidden = NO;

    }
    else
    {
        self.imageMian.width = 0;
        self.imageMian.height = 0;
        self.imageMian.hidden = YES;
        self.lblMian.height = 0;
        self.lblMian.hidden = YES;
        self.lblMian.text = @"";


    }
    //折
    if ([dataModel.isSuportDiscount boolValue])
    {
        self.imageZhe.width = 22;
        self.imageZhe.height = 22;
        self.imageZhe.hidden = NO;
        self.lblZhe.height = 30;
        self.lblZhe.hidden = NO;


    }
    else
    {
        self.imageZhe.width = 0;
        self.imageZhe.height = 0;
        self.imageZhe.hidden = YES;
        self.lblZhe.height = 0;
        self.lblZhe.hidden = YES;
        self.lblZhe.text = @"";


    }

    //新增免折
    if(!dataModel.isOpen)
    {
       
        self.imageNew.left  = 114;
        self.imageZeng.left = self.imageNew.right;
        self.imageMian.left = self.imageZeng.right;
        self.imageZhe.left  = self.imageMian.right;
        self.imageNew.top   = self.imageZeng.top = self.imageZhe.top    = self.imageMian.top = 78;
        
        self.lblNew.hidden = YES;
        self.lblZeng.hidden = YES;
        self.lblZhe.hidden = YES;
        self.lblMian.hidden = YES;
        
        self.btnDiscontDetail.left = self.imageZhe.right+5;
        
        self.btnDiscontDetail.width = SCREEN_WIDTH- (self.imageZhe.right+5);
    }
    else
    {
        //新增免折
        self.imageNew.left = self.imageZeng.left = self.imageZhe.left = self.imageMian.left = 114;

       
       
        self.lblNew.hidden = NO;
        self.lblZeng.hidden = NO;
        self.lblZhe.hidden = NO;
        self.lblMian.hidden = NO;
        
       
        
        self.lblZeng.top = self.lblNew.bottom;
        self.lblMian.top = self.lblZeng.bottom;
        self.lblZhe.top = self.lblMian.bottom;
        
        self.imageNew.top = self.lblNew.top;
        self.imageZeng.top =self.lblZeng.top;
        self.imageMian.top =self.lblMian.top;
        self.imageZhe.top =self.lblZhe.top;
        
        self.btnDiscontDetail.width = SCREEN_WIDTH- 120;
        self.btnDiscontDetail.left = 110;
    
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
