//
//  HomeCell.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKViewStars.h"
#import "CKMerchantModel.h"
@interface HomeCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *lblTitle;
@property (nonatomic,weak) IBOutlet UIImageView *imageVhead;
@property (nonatomic,weak) IBOutlet UIImageView *imageVticket;
@property (nonatomic,weak) IBOutlet UIImageView *imageVPay;
@property (nonatomic,weak) IBOutlet UIImageView *imageVSend;
@property (nonatomic,weak) IBOutlet CKViewStars *viewStart;
@property (nonatomic,weak) IBOutlet UILabel *lblHasSaleCount;//已经销售数量
@property (nonatomic,weak) IBOutlet UILabel *lblInfo;//配送信息
/**
 *  优惠详情按钮
 */
@property (nonatomic,weak) IBOutlet UIButton *btnDiscontDetail;
//新增免折
@property (nonatomic,weak) IBOutlet UIImageView *imageNew;
@property (nonatomic,weak) IBOutlet UIImageView *imageZhe;
@property (nonatomic,weak) IBOutlet UIImageView *imageZeng;
@property (nonatomic,weak) IBOutlet UIImageView *imageMian;

@property (nonatomic,weak) IBOutlet UILabel *lblNew;
@property (nonatomic,weak) IBOutlet UILabel *lblZhe;
@property (nonatomic,weak) IBOutlet UILabel *lblZeng;
@property (nonatomic,weak) IBOutlet UILabel *lblMian;

/**
 *  设置cell中信息
 *
 *  @param dataModel 数据模型
 */
-(void)setCellContentWithModel:(CKMerchantModel *)dataModel;

@end
