//
//  BusinessCommentView.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BusinessCommentView.h"

@implementation BusinessCommentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTableViewWithFrame:frame];
        
        self.arraySource = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    }
    
    return self;
}
- (void)createTableViewWithFrame:(CGRect)frame
{
    self.tableViewComment = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, frame.size.height)];
    self.tableViewComment.delegate = self;
    self.tableViewComment.dataSource = self;
    [self addSubview:self.tableViewComment];
    
    [self.tableViewComment registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCell"];
    
}
#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arraySource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 113;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
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
