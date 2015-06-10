//
//  CKBusinessCommentViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKBusinessCommentViewController.h"
#import "CommentCell.h"

@interface CKBusinessCommentViewController ()

@end

@implementation CKBusinessCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arraySource = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    [self.tableViewComment registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCell"];
    self.tableViewComment.tableHeaderView = self.viewHeader;
    // Do any additional setup after loading the view from its nib.
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
