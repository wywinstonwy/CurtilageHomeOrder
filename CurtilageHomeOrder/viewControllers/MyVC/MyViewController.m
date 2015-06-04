//
//  MyViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "MyViewController.h"
#import "MyCell.h"
#import "LoginViewController.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arraySource;
}
@end

@implementation MyViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";

    [self.tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    self.btnLogin.layer.cornerRadius = 8.0f;
    self.tableview.tableHeaderView = self.viewHeader;
    self.tableview.tableFooterView = self.viewFooter;
    arraySource = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *arr1 = @[@"送餐地址",@"我的代金券",@"我的退款"];
    NSArray *arr2 = @[@"我的收藏",@"我的评论",@"修改密码",@"我的信息"];
    [arraySource addObject:arr1];
    [arraySource addObject:arr2];
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return arraySource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [arraySource objectAtIndex:section];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    NSInteger section = [indexPath section];
    NSArray *arr = [arraySource objectAtIndex:section];

    cell.lbltitle.text = [arr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)login
{
    LoginViewController *viewFlag = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewFlag];
    navi.navigationBar.tintColor = setNaviColor;
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
