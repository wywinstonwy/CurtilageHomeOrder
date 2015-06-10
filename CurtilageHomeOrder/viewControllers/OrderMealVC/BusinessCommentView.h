//
//  BusinessCommentView.h
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentCell.h"
@interface BusinessCommentView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *tableViewComment;
@property (nonatomic, strong) NSMutableArray *arraySource;
@end
