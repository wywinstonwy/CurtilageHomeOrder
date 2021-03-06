//
//  OrderListViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "OrderListViewController.h"
#import "LoginViewController.h"
#import "CKOrderListCell.h"
#import "OrderDetailViewController.h"
#import "CKOrderListModel.h"
#import "MJRefresh.h"
@interface OrderListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger page;
    NSMutableArray *arraySource;
}
@end

@implementation OrderListViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    if([CKUserManager isLogin])
    {
        self.tableview.hidden = NO;
        self.viewLogin.hidden = YES;
       // [CKUserManager saveValue:@"" ForKey:USER_ID];
    }
    else
    {
        self.tableview.hidden = YES;
        self.viewLogin.hidden = NO;
       // [CKUserManager saveValue:@"1" ForKey:USER_ID];

    }
    [self getMyOrderList];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
  //  self.view.backgroundColor = setNaviColor;
    self.btnLogin.cornerRadius = 5.0f;
    self.btnLogin.backgroundColor = setNaviColor;
    self.btnLogin.layer.cornerRadius = 5.0f;
    [self.tableview registerNib:[UINib nibWithNibName:@"CKOrderListCell" bundle:nil] forCellReuseIdentifier:@"CKOrderListCell"];
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    arraySource = [[NSMutableArray alloc] initWithCapacity:0];

}

-(void)getMyOrderList
{
    NSDictionary *param = [[NSDictionary alloc] initWithObjectsAndKeys:[CKUserManager getValueForKey:USER_ID],@"userToken",@(page),@"pageIndex",@(20),@"pageSize",@"",@"timeStamp", nil];
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/getMyOrderList.action" parameters:param forSucess:^(id result) {
        NSLog(@"我的订单列表：%@",result);
        NSInteger resultMessage = [[result objectForKey:@"resultMessage"] integerValue];
        if (resultMessage == 0)
        {
            NSArray *arr = [result objectForKey:@"resultList"];
            
            if ([arr isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *dict in arr)
                {
                    CKOrderListModel *dataModel = [[CKOrderListModel alloc] init];
                    [dataModel setValuesForKeysWithDictionary:dict];
                    [arraySource addObject:dataModel];
                    
                }
            }
        }
        else
            [SVProgressHUD showErrorWithStatus:[result objectForKey:@"resultMessage"]];
        [self.tableview reloadData];
        [self.tableview.legendFooter endRefreshing];
        [self.tableview.legendHeader endRefreshing];
        
    } forFail:^(NSError *error) {
        [self.tableview.legendFooter endRefreshing];
        [self.tableview.legendHeader endRefreshing];
    }];
    

}
#pragma mark uitableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arraySource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKOrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKOrderListCell"];
    CKOrderListModel *dataModel = [arraySource objectAtIndex:indexPath.row];
    [cell setCellContentWithModel:dataModel];
    
//    NSInteger section = [indexPath section];
    
   // cell.lbltitle.text = [arr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailViewController *viewFlag = [OrderDetailViewController new];
    [self pushToViewController:viewFlag anmation:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)login
{
    LoginViewController *viewFlag = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewFlag];
    navi.navigationBar.tintColor = setNaviColor;
    navi.navigationBar.translucent = NO;
    [navi.navigationBar setBarStyle:(UIBarStyleDefault)];

    [self presentViewController:navi animated:YES completion:^{
        
    }];

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
