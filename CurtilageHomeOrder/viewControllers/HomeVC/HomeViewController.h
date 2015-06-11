//
//  HomeViewController.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"
#import "viewSelectList.h"
@interface HomeViewController : BaseViewController
@property (nonatomic, strong) UITextField *textSearch;
@property (nonatomic, strong) IBOutlet UITableView *tableview;
//@property (nonatomic, weak) IBOutlet UIButton *btnCitySelect;
@property (nonatomic, weak) IBOutlet UILabel *lblCity;
@property (nonatomic, weak) IBOutlet UIImageView *imageVCity;
@property (nonatomic, weak) IBOutlet viewSelectList *viewSelectCity;
@end
