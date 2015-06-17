//
//  CKMerchantModel.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/17.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKMerchantModel : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *soldCount;//
@property (nonatomic,strong) NSString *sendPrice;//起送价格
@property (nonatomic,strong) NSString *starsCount;
@property (nonatomic,strong) NSString *foodSelectCount;
@property (nonatomic,strong) NSString *foodID;
@property (nonatomic,assign) BOOL isOpen;
@end
