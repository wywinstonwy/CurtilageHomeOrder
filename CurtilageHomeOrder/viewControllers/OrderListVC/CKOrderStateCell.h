//
//  CKOrderStateCell.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-25.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKOrderStateCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *lblTitleStatus;
@property (nonatomic,weak) IBOutlet UILabel *lblTime;
@property (nonatomic,weak) IBOutlet UILabel *lblOrderID;
@end
