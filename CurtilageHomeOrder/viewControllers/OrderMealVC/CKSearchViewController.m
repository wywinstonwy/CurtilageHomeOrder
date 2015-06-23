//
//  CKSearchViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKSearchViewController.h"
#import "MyCell.h"
#import "OrderMealViewController.h"
@interface CKSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSString *strSearchKey;
}
@end

@implementation CKSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewSearch registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    self.tableViewSearch.tableFooterView = [[UIView alloc] init];
    strSearchKey = [[NSString alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    cell.lbltitle.text = strSearchKey;
    NSArray *array = @[[UIImage imageNamed:@"zhongshizhengcan1"],[UIImage imageNamed:@"kuaican1"],[UIImage imageNamed:@"xindiantuijian1"]];
    cell.imageViewHead.image = [array objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (strSearchKey.length>0) {
        OrderMealViewController *viewFlag = [OrderMealViewController new];
        [self pushToViewController:viewFlag anmation:YES];
    }
   
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.tableViewSearch.hidden = NO;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    strSearchKey = searchText;
    [self.tableViewSearch reloadData];
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
