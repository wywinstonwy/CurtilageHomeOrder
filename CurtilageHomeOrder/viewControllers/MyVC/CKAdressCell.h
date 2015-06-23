//
//  CKAdressCell.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/21.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKAdressCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UIButton *btnEdit;
@property (nonatomic,weak) IBOutlet UILabel *lblName;
@property (nonatomic,weak) IBOutlet UILabel *lblPhone;
@property (nonatomic,weak) IBOutlet UILabel *lblAddress;

@end
