//
//  CKOrderReadModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/19.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  点餐必读信息
 
 ➢	提交方式：POST
 ➢	接口URL：zj/v1/getMerchantUserNotice.action
 
 序号	参数描述	参数名称	约束	参数类型	备注
 请求参数	商户加密ID	merchantToken	必填	String
 返回数据	商家说明	notice		String
	新	isSuportNew		int
	免	isSuportFree		int
	折	isSuportDiscount		int
	赠	isSuportGive		int
	新字符串	isSuportNewStr		String
	免字符串	isSuportFreeStr		String
	折字符串	isSuportDiscountStr		String
	赠字符串	isSuportGiveStr		String
 */
@interface CKOrderReadModel : NSObject
@property (nonatomic,strong) NSString *notice;
@property (nonatomic,strong) NSString *isSuportNew;
@property (nonatomic,strong) NSString *isSuportFree;
@property (nonatomic,strong) NSString *isSuportDiscount;
@property (nonatomic,strong) NSString *isSuportGive;
@property (nonatomic,strong) NSString *isSuportNewStr;
@property (nonatomic,strong) NSString *isSuportFreeStr;
@property (nonatomic,strong) NSString *isSuportDiscountStr;
@property (nonatomic,strong) NSString *isSuportGiveStr;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
