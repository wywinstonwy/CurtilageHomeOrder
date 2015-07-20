//
//  CKMerchantMapListModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/19.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  商家列表——地图
 ➢	提交方式：POST
 ➢	接口URL：zj/v1/getMerchantsListForMap.action
 
 序号	参数描述	参数名称	约束	参数类型	备注
 请求参数	系统ID加密	systemToken	必填	String
 返回数据	结果列表	resultList		Json
	商户加密ID	merchantToken		String
	商户名称	merchantName		String
	商户地址	address		String
	经度	longitude		Double
	纬度	latitude		Double
 
 */
@interface CKMerchantMapListModel : NSObject
@property (nonatomic,strong) NSString *merchantName;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *latitude;
//@property (nonatomic,strong) NSString *merchantName;
//@property (nonatomic,strong) NSString *merchantName;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
