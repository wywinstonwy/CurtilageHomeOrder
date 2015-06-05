//
//  viewSelectList.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/5.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "viewSelectList.h"

@implementation viewSelectList
@synthesize tableview;

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
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self addSubview:tableview];
}
- (void)setSelectDataSource:(NSMutableArray *)arr
{
    [self.arraySource removeAllObjects];
    tableview.height = arr.count*44;
    if (tableview.height>SCREEN_HEIGHT - 64)
    {
        tableview.height = SCREEN_HEIGHT - 64;
    }
    self.arraySource = arr;
    [tableview reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arraySource.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    cell.textLabel.text = [self.arraySource objectAtIndex:indexPath.row];
    
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
