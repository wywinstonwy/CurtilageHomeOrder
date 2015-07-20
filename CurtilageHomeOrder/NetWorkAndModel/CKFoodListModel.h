//
//  CKFoodListModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/12.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  菜品列表
 ➢	提交方式：POST
 ➢	接口URL：zj/v1/getMerchantDishesList.action
 
 序号	参数描述	参数名称	约束	参数类型	备注
 请求参数	商户加密ID	merchantToken	必填	String
	时间戳	timeStamp		Long
 
 
 
 
 
 
 返回数据	结果列表	dishesList		Json(List)	一级
	菜品加密ID	dishesToken		String
	菜品图片	dishesPicture		String
	菜品名称	dishesName		String
	已售份数	saleAmoun		float
	推荐数量	recommendAmount		float
	原价格	primePrice		float
	优惠价	preferentialPrice		float
	库存份数	stock		float
	最低起订份数要求	isMinAmount	 	int	1有、0无
	起订份数	minAmount		float
	菜品单位	unit		String
	是否有可选规格	isOption		Int	0无、1有
	分类加密ID	dishesGroupToken		String
	菜品结果列表	dishesGroupList		Json(List)	一级
	分类加密ID	dishesGroupToken		String
	商户加密ID	merchantToken		String
	分类名称	dishesGroupName		String
 
 */
@interface CKFoodListModel : NSObject
@property (nonatomic,strong) NSString *foodName;
@property (nonatomic,strong) NSString *foodRecommendCont;//推荐
@property (nonatomic,strong) NSString *foodSoldCount;//已售
@property (nonatomic,strong) NSString *foodPrice;
@property (nonatomic,strong) NSString *foodSelectCount;
@property (nonatomic,strong) NSString *foodID;

@property (nonatomic,assign) NSInteger section;
@property (nonatomic,assign) NSInteger indexRow;




@property (nonatomic,strong) NSString *dishesToken;
@property (nonatomic,strong) NSString *dishesPicture;
@property (nonatomic,strong) NSString *dishesName;
@property (nonatomic,strong) NSString *saleAmoun;
@property (nonatomic,strong) NSString *recommendAmount;
@property (nonatomic,strong) NSString *primePrice;
@property (nonatomic,strong) NSString *preferentialPrice;
@property (nonatomic,strong) NSString *stock;
@property (nonatomic,strong) NSString *isMinAmount;
@property (nonatomic,strong) NSString *minAmount;
@property (nonatomic,strong) NSString *unit;
@property (nonatomic,strong) NSString *isOption;
@property (nonatomic,strong) NSString *dishesGroupToken;
@property (nonatomic,strong) NSString *dishesGroupList;
@property (nonatomic,strong) NSString *merchantToken;
@property (nonatomic,strong) NSString *dishesGroupName;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
