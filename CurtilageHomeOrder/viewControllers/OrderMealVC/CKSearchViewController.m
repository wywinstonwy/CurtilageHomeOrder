//
//  CKSearchViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/10.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKSearchViewController.h"
#import "MyCell.h"
@interface CKSearchViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CKSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewSearch registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    cell.lbltitle.text = @"";
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
