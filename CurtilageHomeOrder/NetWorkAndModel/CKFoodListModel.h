//
//  CKFoodListModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/12.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKFoodListModel : NSObject
@property (nonatomic,strong) NSString *foodName;
@property (nonatomic,strong) NSString *foodRecommendCont;//推荐
@property (nonatomic,strong) NSString *foodSoldCount;//已售
@property (nonatomic,strong) NSString *foodPrice;
@property (nonatomic,strong) NSString *foodSelectCount;
@property (nonatomic,strong) NSString *foodID;

@property (nonatomic,assign) NSInteger section;
@property (nonatomic,assign) NSInteger indexRow;

@end
