//
//  CKAddressListVC.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/14.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKAddressListVC.h"
#import "CKAdressCell.h"
#import "CKAddressEditVC.h"
@interface CKAddressListVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arraySource;
}

@end

@implementation CKAddressListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"CKAdressCell" bundle:nil] forCellReuseIdentifier:@"CKAdressCell"];
    self.tableview.tableFooterView = [[UIView alloc] init];
    // Do any additional setup after loading the view from its nib.
    arraySource = [[NSMutableArray alloc] initWithCapacity:0];
    [arraySource addObject:@""];
    [arraySource addObject:@""];
    [arraySource addObject:@""];
    [arraySource addObject:@""];
    [arraySource addObject:@""];
    [arraySource addObject:@""];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arraySource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKAdressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKAdressCell"];
    [cell.btnEdit addTarget:self action:@selector(btnClickAddressEdit:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)btnClickAddressEdit:(UIButton *)sender
{
    CKAddressEditVC *viewFlag = [CKAddressEditVC new];
    [self pushToViewController:viewFlag anmation:YES];

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
