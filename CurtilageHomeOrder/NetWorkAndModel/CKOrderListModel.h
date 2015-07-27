//
//  CKOrderListModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/27.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKOrderListModel : NSObject
@property (nonatomic,strong) NSString *orderToken;
@property (nonatomic,strong) NSString *merchantToken;
@property (nonatomic,strong) NSString *merchantPictrue;
@property (nonatomic,strong) NSString *merchantName;
@property (nonatomic,strong) NSString *preferentialPrice;
@property (nonatomic,strong) NSString *payType;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *insertDateTimeStr;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
