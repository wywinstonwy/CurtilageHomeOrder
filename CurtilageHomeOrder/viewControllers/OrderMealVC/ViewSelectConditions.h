//
//  ViewSelectConditions.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/7.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKSelectListCell.h"
#import "CKMerchantClassModel.h"//商家分类条件选择
typedef void (^TapCancelBlock)(id index);//点击空白执行取消点击事件

@interface ViewSelectConditions : UIView<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *arraySource;
@property (nonatomic, strong) TapCancelBlock tapCancelBlock;
@end
