//
//  CKChooseMealViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-11.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface CKChooseMealViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView *tableViewFoodClass;
@property(nonatomic,weak) IBOutlet UITableView *tableViewFoodList;
@property(nonatomic,weak) IBOutlet UITableView *tableViewSelectResult;
@property(nonatomic,weak) IBOutlet UIView *viewSelectResult;
@property(nonatomic,weak) IBOutlet UILabel *lblOderCount;
@property(nonatomic,weak) IBOutlet UIButton *btnBuy;
@property(nonatomic,weak) IBOutlet UILabel *lblTotalPrice;
@property (nonatomic,weak) IBOutlet UIView *viewSelectResultHeader;
//点击购买
- (IBAction)btnClickToBuy:(UIButton *)sender;
-(IBAction)btnClickShowShopingCart:(id)sender;
- (IBAction)hiddenShopingCart;
//清除购物车
- (IBAction)clearShopingCar:(id)sender;


@end
