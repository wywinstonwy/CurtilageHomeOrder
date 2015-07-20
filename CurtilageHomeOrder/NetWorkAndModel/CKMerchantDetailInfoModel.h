//
//  CKMerchantDetailInfoModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/19.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  商户详情信息
 ➢	提交方式：POST
 ➢	接口URL：zj/v1/getMerchantsDetailsInfo.action
 
 序号	参数描述	参数名称	约束	参数类型	备注
 请求参数	商户加密ID	merchantToken	必填	String
	用户加密ID 	userToken		String
	经度	longitudeStr		String
	纬度	latitudeStr		String
 
 返回数据	商户加密ID	merchantToken		String
	商户图标	merchantPictrue		String
	商户背景图	merchantBgPic		String
	商户名称	merchantName		String
	商家电话	telephone		String
	评分	score		float
	营业时间	bussinessTimeStr		String
	营业状态	status		int
	起送价	orderMinPrice		float
	配送费	deliveryPrice		float
	餐盒费	foodBoxPrice		float
	商户地址	address		String
	距离	juli		String
	经度	longitude		Double
	纬度	latitude		Double
	订餐说明	tips		String
	介绍	note		String
	收藏状态	isCollectStatus		float	1已收藏、0未收藏
 
 
	一下是商户配置参数（下订单时候会用到）
	新	isSuportNew		int	0：否；1：是
	免	isSuportFree		int	0：否；1：是
	免配送费起步价	freeDeliveryFee		Float	消费满X元，免配送费
	折	isSuportDiscount		int	0：否；1：是
	赠	isSuportGive		int	0：否；1：是
	赠送金额起步价X	giveFeeMin		Float	消费满X元，曾送Y东西
	赠送东西Y	freeObject		String
	是否支持宅家配送	isSuportMainDelivery		int	0：否；1：是
	是否支持在线支付	isSuportOnLinePay		int	0：否；1：是
	新字符串	isSuportNewStr		String
	免字符串	isSuportFreeStr		String
	折字符串	isSuportDiscountStr		String
	赠字符串	isSuportGiveStr		String
 */
@interface CKMerchantDetailInfoModel : NSObject
@property (nonatomic,strong) NSString *merchantToken;
@property (nonatomic,strong) NSString *merchantPictrue;
@property (nonatomic,strong) NSString *merchantBgPic;
@property (nonatomic,strong) NSString *merchantName;
@property (nonatomic,strong) NSString *telephone;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSString *score;
@property (nonatomic,strong) NSString *bussinessTimeStr;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *orderMinPrice;
@property (nonatomic,strong) NSString *deliveryPrice;
@property (nonatomic,strong) NSString *foodBoxPrice;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *juli;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *latitude;
@property (nonatomic,strong) NSString *tips;
@property (nonatomic,strong) NSString *note;
@property (nonatomic,strong) NSString *isCollectStatus;
//一下是商户配置参数（下订单时候会用到）
@property (nonatomic,strong) NSString *isSuportNew;
@property (nonatomic,strong) NSString *isSuportFree;
@property (nonatomic,strong) NSString *freeDeliveryFee;
@property (nonatomic,strong) NSString *isSuportDiscount;
@property (nonatomic,strong) NSString *isSuportGive;
@property (nonatomic,strong) NSString *giveFeeMin;
@property (nonatomic,strong) NSString *freeObject;
@property (nonatomic,strong) NSString *isSuportMainDelivery;
@property (nonatomic,strong) NSString *isSuportOnLinePay;
@property (nonatomic,strong) NSString *isSuportNewStr;
@property (nonatomic,strong) NSString *isSuportFreeStr;
@property (nonatomic,strong) NSString *isSuportDiscountStr;
@property (nonatomic,strong) NSString *isSuportGiveStr;




-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
