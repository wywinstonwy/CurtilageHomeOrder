//
//  SettingViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "SettingViewController.h"
#import "MyCell.h"
#import "CKFeedBackVC.h"
#import "CKAbourtUSVC.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arraySource;
    
}
@end

@implementation SettingViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    arraySource = [[NSMutableArray alloc] initWithObjects:@"意见反馈",@"服务条款",@"检查更新",@"关于我们",nil];
    [self.tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];

    // Do any additional setup after loading the view from its nib.
}
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
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    cell.lbltitle.text = [arraySource objectAtIndex:indexPath.row];
    NSString *imageName = [NSString stringWithFormat:@"Set%ld",indexPath.row+1];
    cell.imageViewHead.image =[UIImage imageNamed:imageName];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            CKFeedBackVC *viewFlag = [[CKFeedBackVC alloc] init];
            [self pushToViewController:viewFlag anmation:YES];
            
        }break;
        case 1:
        {
            
        }break;
        case 2:
        {
            
        }break;
        case 3:
        {
            CKAbourtUSVC *viewFlag = [[CKAbourtUSVC alloc] init];
            [self pushToViewController:viewFlag anmation:YES];
        }break;
            
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
