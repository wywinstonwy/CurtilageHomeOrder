//
//  BusinessDetailsViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BusinessDetailsViewController.h"
#import "BusinessCommentView.h"
#import "CKFoodCell.h"
#import "CKBusinessInfoView.h"
@interface BusinessDetailsViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrayFoodClass;
    NSMutableArray *arrayFoodList;
}
@end

@implementation BusinessDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView.width = SCREEN_WIDTH;
    self.mainScrollView.height = SCREEN_HEIGHT-94;
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-94)];
    self.mainScrollView.pagingEnabled = YES;
    
    
    [self.tableViewFoodClass registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableViewFoodList registerNib:[UINib nibWithNibName:@"CKFoodCell" bundle:nil] forCellReuseIdentifier:@"CKFoodCell"];
    
    self.tableViewFoodClass.tableFooterView =[[UIView alloc] init];
    self.tableViewFoodClass.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableViewFoodList.height = self.mainScrollView.height;
    self.tableViewFoodClass.height = self.mainScrollView.height;
    //评论列表
    BusinessCommentView *viewComment = [[BusinessCommentView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.mainScrollView.height)];
    [self.mainScrollView addSubview:viewComment];
    //商户详情
    CKBusinessInfoView *viewBusinessInfo = [[CKBusinessInfoView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.mainScrollView.height)];
    viewBusinessInfo.backgroundColor = setNaviColor;
    [self.mainScrollView addSubview:viewBusinessInfo];
    
    arrayFoodClass = [[NSMutableArray alloc] initWithObjects:@"法师鲜奶",@"巧克力",@"苏轼拉面", nil];
    arrayFoodList = [[NSMutableArray alloc] init];
    NSArray *arr1 = @[@"新鲜蛋糕",@"巧克力蛋糕",@"奶油蛋糕"];
    NSArray *arr2 = @[@"话是签了里",@"巧克力棒",@"千克力并"];
    NSArray *arr3 = @[@"加州拉面",@"兰州拉面",@"普通拉面",@"刀削面"];
    [arrayFoodList addObject:arr1];
    [arrayFoodList addObject:arr2];
    [arrayFoodList addObject:arr3];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark UITableViewDelagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag ==1) {
        return arrayFoodClass.count;
    }
    else
    {
        NSArray *arr = [arrayFoodList objectAtIndex:section];
      return  arr.count;
    }
  
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag ==1) {
        return 1;
    }
    else
        return arrayFoodList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 44;
    }
    else
    {
        return 100;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return nil;
    }
    else
        return @"法师蛋糕";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.textLabel.text = [arrayFoodClass objectAtIndex:indexPath.row];
        return cell;
    }
    else
    {//CKFoodCell
        CKFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKFoodCell"];
        NSArray *arr = [arrayFoodList objectAtIndex:[indexPath section]];
 
        cell.lblName.text = [arr objectAtIndex:indexPath.row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        [self.tableViewFoodList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
    }
    else
    {
    
    }
}
- (IBAction)btnSelectMenuFunction:(UIButton *)sender;
{
    [self.mainScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*(sender.tag-100), 0) animated:YES];
    [self setCurrenSelectWithTag:sender.tag];

}
- (void)setCurrenSelectWithTag:(NSInteger)sengderTag
{
    for (int i = 0; i<3; i++)
    {
        UIButton *btn = (UIButton *)[self.view viewWithTag:100+i];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    UIButton *sender = (UIButton *)[self.view viewWithTag:sengderTag];
    [sender setTitleColor:setNaviColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.lblLine.centerX = sender.centerX;
        
    } completion:^(BOOL finished) {
        
    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.mainScrollView)
    {
        NSInteger page = scrollView.contentOffset.x/SCREEN_WIDTH;
        [self setCurrenSelectWithTag:100+page];
    }
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
