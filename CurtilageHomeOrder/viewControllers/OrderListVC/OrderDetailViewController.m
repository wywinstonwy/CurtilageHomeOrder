//
//  OrderDetailViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "CKOrderDetailCell.h"
#import "CKOrderStateCell.h"
@interface OrderDetailViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    // Do any additional setup after loading the view from its nib.
    [self setContenViewFrame];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
-(void)setContenViewFrame
{
    [self.tableOrderState registerNib:[UINib nibWithNibName:@"CKOrderStateCell" bundle:nil] forCellReuseIdentifier:@"CKOrderStateCell"];
    [self.tableOrderDetail registerNib:[UINib nibWithNibName:@"CKOrderDetailCell" bundle:nil] forCellReuseIdentifier:@"CKOrderDetailCell"];
    self.mainScrollView.height = SCREEN_HEIGHT - 108;
    self.tableOrderState.height = self.tableOrderDetail.height = self.mainScrollView.height;
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-108)];
    self.tableOrderState.left = 0;
    self.tableOrderDetail.left = SCREEN_WIDTH;
}
-(IBAction)btnClickSelect:(UIButton *)sender;
{
    for (int i = 0; i<2; i++) {
        UIButton *btnSelect = (UIButton *)[self.view viewWithTag:i+10];
        [btnSelect setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    [sender setTitleColor:setNaviColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.lblLineCurrent.left = sender.left;
    } completion:^(BOOL finished) {
        
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        CKOrderStateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKOrderStateCell"];
        cell.lblTitleStatus.text = @"商家已发货";
        return cell;
    }
    else
    {
        CKOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKOrderDetailCell"];
        return cell;
    }
    
    
  
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/SCREEN_WIDTH;
    
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
