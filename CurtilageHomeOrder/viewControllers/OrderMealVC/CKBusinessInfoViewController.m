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
{
    NSMutableArray *arraySource;
}
@end

@implementation CKBusinessInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    
    self.tableview.tableHeaderView = self.viewHeader;
    self.tableview.tableFooterView = [UIView new];
    self.tableview.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    NSArray *arr1 = @[@"10:00-24:00",@"昌平区天通苑站北一区",@"本店欢迎下单，用餐高峰请提前下单，"];
    NSArray *arr2 = @[@"新客户李减44",@"下单满25元减12元",@"代金券"];
    arraySource = [[NSMutableArray alloc] initWithCapacity:0];
    [arraySource addObject:arr1];
    [arraySource addObject:arr2];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark tableViewdelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arraySource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [arraySource objectAtIndex:section];
    return arr.count;
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
    cell.imageVArrow.hidden = YES;
    NSInteger section = [indexPath section];
    NSArray *arr = [arraySource objectAtIndex:section];
    cell.lbltitle.width = SCREEN_WIDTH - 60;
    if (section == 0) {
        NSArray *arrImages = @[@"time",@"My00",@"storeNotification"];
        cell.imageViewHead.image = [UIImage imageNamed:[arrImages objectAtIndex:indexPath.row]];
    }
    else
    {
        NSArray *arrImages = @[@"xin",@"zeng",@"zhe"];
        cell.imageViewHead.image = [UIImage imageNamed:[arrImages objectAtIndex:indexPath.row]];

  
    }
    cell.lbltitle.text = [arr objectAtIndex:indexPath.row];

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
