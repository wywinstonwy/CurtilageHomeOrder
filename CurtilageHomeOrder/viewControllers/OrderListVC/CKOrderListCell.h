//
//  CKOrderListCell.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKOrderListModel.h"
@interface CKOrderListCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UIImageView *imageHeader;
@property (nonatomic,weak) IBOutlet UILabel *lblTitle;
@property (nonatomic,weak) IBOutlet UILabel *lblPrice;
@property (nonatomic,weak) IBOutlet UIImageView *lblpreferentialPrice;
@property (nonatomic,weak) IBOutlet UILabel *lblStatus;
@property (nonatomic,weak) IBOutlet UILabel *lblTime;

-(void)setCellContentWithModel:(CKOrderListModel *)dataModel;
@end
