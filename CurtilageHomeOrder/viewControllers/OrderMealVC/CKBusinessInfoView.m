//
//  CKBusinessInfoView.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKBusinessInfoView.h"
#import "MyCell.h"

@implementation CKBusinessInfoView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, frame.size.height) style:(UITableViewStylePlain)];
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        
        [self addSubview:self.tableview];
        
        [self.tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];

        self.tableview.tableHeaderView = [self tableviewHeader];
        self.tableview.tableFooterView = [UIView new];
        self.tableview.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    
    return self;
}
- (UIView *)tableviewHeader
{
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:viewHeader.frame];
    
    [viewHeader addSubview:imageView];
    //
    UIView *viewBack = [[UIView alloc] initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH, 60)];
    viewHeader.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [viewHeader addSubview:viewBack];
    
    
    return viewHeader;
    
}
#pragma mark tableViewdelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
