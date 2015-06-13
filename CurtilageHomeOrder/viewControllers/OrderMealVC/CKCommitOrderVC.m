//
//  CKCommitOrderVC.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/13.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKCommitOrderVC.h"
#import "CKAddressCell.h"
#import "CKSelectPayCell.h"
#import "CKSelectMeaNoteCell.h"
#import "CKOderResultCell.h"
#import "CKWriteNoteVC.h"

@interface CKCommitOrderVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arraySource;
}
@end

@implementation CKCommitOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"CKAddressCell" bundle:nil] forCellReuseIdentifier:@"CKAddressCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"CKSelectPayCell" bundle:nil] forCellReuseIdentifier:@"CKSelectPayCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"CKSelectMeaNoteCell" bundle:nil] forCellReuseIdentifier:@"CKSelectMeaNoteCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"CKOderResultCell" bundle:nil] forCellReuseIdentifier:@"CKOderResultCell"];
    
    self.tableview.tableFooterView = [[UIView alloc] init];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 1;
    if (section == 1 || section == 2) {
        return 2;
    }
    
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 44;
    }
    else
        return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    if (section == 0) {
        return 67;
    }
    
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHead ;
    if (section == 1) {
        viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        UILabel *lbltitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 44)];
        lbltitle.text = @"支付方式";
        [viewHead addSubview:lbltitle];
    }
    else
    {
        viewHead = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];

    }
    viewHead.backgroundColor = [UIColor groupTableViewBackgroundColor];

    return viewHead;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    
    if(section == 0)
    {
        CKAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKAddressCell"];
        return cell;
    }
    else if (section == 1)
    {
        CKSelectPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKSelectPayCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *arr = @[@"餐到付款",@"在线支付",@"000"];
        cell.lblTitle.text = [arr objectAtIndex:indexPath.row];
        return cell;
    }
    else if (section == 2)
    {
        CKSelectMeaNoteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKSelectMeaNoteCell"];
        NSArray *arr = @[@"送餐时间",@"送餐备注"];
        cell.lblTitle.text = [arr objectAtIndex:indexPath.row];
        return cell;
    }
    else if (section == 3)
    {
        CKOderResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKOderResultCell"];
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section =[indexPath section];
    if (section == 2 && indexPath.row == 1)
    {
        [self gotoWriteNote];
        
    }
}
- (void)gotoWriteNote
{
    CKWriteNoteVC *viewFlag = [CKWriteNoteVC new];
    [self pushToViewController:viewFlag anmation:YES];
}

#pragma methos
- (IBAction)btnClickSureCommitOrder:(id)sender;
{
    [SVProgressHUD showWithStatus:@"提交中..."];
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
