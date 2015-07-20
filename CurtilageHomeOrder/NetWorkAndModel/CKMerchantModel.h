//
//  CKMerchantModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/17.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  商家列表信息
 
 商户类型	merchantType	必填	String	1-外卖订餐(默认)；2-生活；3-鲜花
 排序类型	orderType		int	0-	默认、1-距离最近、2-评分最高、
 3-起送价最低、4销量最高
 商户分类
 加密ID	merchantGroupToken		String	默认为0
 福利条件	conditionType		Int 	0-默认、1-新、2-免、3-折、
 4-赠、5-在线支付、6-宅家配送
 经度	longitude		String
 纬度	latitude		String
 请求页码	pageIndex		Int
 每页记录	pageSize		Int
 请求页码	pageIndex		Int
 每页记录	pageSize		Int
 数据总量	total		Int
 返回数据量	size		Int
 结果列表	resultList		Json
 商户加密ID	merchantToken		String
 商户图片	merchantPictrue		String
 商户名称	merchantName		String
 评分	score		float
 营业状态	status		int	1营业中、2预定中、0休息中
 是否支持宅家配送	isSuportMainDelivery		int	0：否；1：是
 是否支持在线支付	isSuportOnLinePay		int	0：否；1：是
 起送价	orderMinPrice		float
 配送费	deliveryPrice		float
 新	isSuportNew		int	0：否；1：是
 新字符串	isSuportNewStr		String
 免	isSuportFree		int	0：否；1：是
 免配送费起步价	freeDeliveryFee		Float	消费满X元，免配送费
 免字符串	isSuportFreeStr		String
 折	isSuportDiscount		int	0：否；1：是
 折字符串	isSuportDiscountStr		String
 赠	isSuportGive		int	0：否；1：是
 赠送金额起步价X	giveFeeMin		Float	消费满X元，曾送Y东西
 赠送东西Y	freeObject		String
 赠字符串	isSuportGiveStr		String
 距离	juli		String
 经度	longitude		Double
 纬度	latitude		Double
 */
@interface CKMerchantModel : NSObject

@property (nonatomic,strong) NSString *pageIndex;
@property (nonatomic,strong) NSString *pageSize;
@property (nonatomic,strong) NSString *total;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSString *resultList;
@property (nonatomic,strong) NSString *merchantToken;
@property (nonatomic,strong) NSString *merchantPictrue;
@property (nonatomic,strong) NSString *merchantName;
@property (nonatomic,strong) NSString *score;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *isSuportMainDelivery;
@property (nonatomic,strong) NSString *isSuportOnLinePay;
@property (nonatomic,strong) NSString *orderMinPrice;
@property (nonatomic,strong) NSString *deliveryPrice;
@property (nonatomic,strong) NSString *isSuportNew;
@property (nonatomic,strong) NSString *isSuportNewStr;
@property (nonatomic,strong) NSString *isSuportFree;
@property (nonatomic,strong) NSString *freeDeliveryFee;
@property (nonatomic,strong) NSString *isSuportFreeStr;
@property (nonatomic,strong) NSString *isSuportDiscount;
@property (nonatomic,strong) NSString *isSuportDiscountStr;
@property (nonatomic,strong) NSString *isSuportGive;
@property (nonatomic,strong) NSString *giveFeeMin;
@property (nonatomic,strong) NSString *freeObject;
@property (nonatomic,strong) NSString *isSuportGiveStr;
@property (nonatomic,strong) NSString *juli;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *latitude;

@property (nonatomic,assign) BOOL isOpen;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
