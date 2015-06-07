//
//  OrderMealViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "OrderMealViewController.h"
#import "HomeCell.h"
#import "ViewSelectConditions.h"
@interface OrderMealViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    ViewSelectConditions *viewSelectList;
}
@end

@implementation OrderMealViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableview registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];

    // Do any additional setup after loading the view from its nib.
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<=1) {
        return 90;
    }
    return 116;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
        
        return cell;
        
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark methos 
- (IBAction)btnClickfunction:(UIButton *)sender
{
    for(int i = 0;i<3;  i++)
    {
        UIButton *btn = (UIButton *)[self.view viewWithTag:100+i];
        btn.backgroundColor = [UIColor whiteColor];
    
    }
    sender.backgroundColor = [UIColor groupTableViewBackgroundColor];
    if (viewSelectList == nil) {
        __weak OrderMealViewController *weakSelf = self;
        
        viewSelectList = [[ViewSelectConditions alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT- 64-44-49)];
        [self.view addSubview:viewSelectList];
        viewSelectList.tapCancelBlock = ^(NSString *index)
        {
            [weakSelf hiddenSelectList];
        };
    }
    
    
    [self showSelectList];
}
- (void)showSelectList
{
    viewSelectList.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [UIView animateWithDuration:0.3 animations:^{
        viewSelectList.top = 44;
        viewSelectList.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
  
    } completion:^(BOOL finished) {
        
    }];
}
- (void)hiddenSelectList
{
    viewSelectList.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [UIView animateWithDuration:0.3 animations:^{
        viewSelectList.bottom = 0;
        viewSelectList.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        
    } completion:^(BOOL finished) {
        
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
