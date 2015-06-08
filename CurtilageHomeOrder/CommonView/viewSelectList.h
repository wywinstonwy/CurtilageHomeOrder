//
//  viewSelectList.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/5.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectResultBlock)(id result);//block回调
@interface viewSelectList : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSMutableArray *arraySource;
@property (nonatomic, strong) selectResultBlock selectresultBlock;

- (void)setSelectDataSource:(NSMutableArray *)arr;
@end
