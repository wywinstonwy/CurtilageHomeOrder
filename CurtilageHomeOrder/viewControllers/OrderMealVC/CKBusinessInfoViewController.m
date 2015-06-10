//
//  CKBusinessInfoViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKBusinessInfoViewController.h"
#import "MyCell.h"
@interface CKBusinessInfoViewController ()

@end

@implementation CKBusinessInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    
    self.tableview.tableHeaderView = self.viewHeader;
    self.tableview.tableFooterView = [UIView new];
    self.tableview.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // Do any additional setup after loading the view from its nib.
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
