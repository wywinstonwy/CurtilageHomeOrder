//
//  CKMerchantClassModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/19.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  商家分类列表
 ➢	提交方式：POST
 ➢	接口URL：zj/v1/getMerchantGroupList.action
 
 序号	参数描述	参数名称	约束	参数类型	备注
 请求参数	商户类型	merchantType	必填	String	1-外卖订餐(默认)；2-生活；3-鲜花
	时间戳	timeStamp		Long
 返回数据	结果列表	resultList		Json
	分类加密ID	merchantGroupToken		String
	名称	merchantGroupName		String
 
 */
@interface CKMerchantClassModel : NSObject
@property (nonatomic,strong) NSString *merchantGroupToken;
@property (nonatomic,strong) NSString *merchantGroupName;
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
