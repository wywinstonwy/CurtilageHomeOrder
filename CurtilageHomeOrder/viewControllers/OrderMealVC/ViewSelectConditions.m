//
//  ViewSelectConditions.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/7.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "ViewSelectConditions.h"

@implementation ViewSelectConditions
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createListViewWithFrame:frame];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    
    return self;
}
- (void)createListViewWithFrame:(CGRect)frame
{
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*7) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self addSubview:self.tableview];
    
    //[self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.tableview registerNib:[UINib nibWithNibName:@"CKSelectListCell" bundle:nil] forCellReuseIdentifier:@"CKSelectListCell"];
//    UIView *footerView = [[UIView alloc] init];
//    footerView.backgroundColor = [UIColor clearColor];
//    self.tableview.tableFooterView = footerView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
    
    
}
- (void)tap
{
    self.tapCancelBlock(@"cancel");
}
- (void)setSelectDataSource:(NSMutableArray *)arr
{
    [self.arraySource removeAllObjects];
    self.tableview.height = arr.count*44;
    if (self.tableview.height>SCREEN_HEIGHT - 64)
    {
        self.tableview.height = SCREEN_HEIGHT - 64;
    }
    self.arraySource = arr;
    
    [self.tableview reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    return self.arraySource.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKSelectListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKSelectListCell"];
    cell.textLabel.text = [self.arraySource objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // self.selectresultBlock(@(indexPath.row));
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
