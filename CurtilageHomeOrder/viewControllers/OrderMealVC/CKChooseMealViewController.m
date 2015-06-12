//
//  CKChooseMealViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-11.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKChooseMealViewController.h"
#import "CKFoodCell.h"
@interface CKChooseMealViewController ()
{
    NSMutableArray *arrayFoodClass;
    NSMutableArray *arrayFoodList;

}
@end

@implementation CKChooseMealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewFoodClass registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableViewFoodList registerNib:[UINib nibWithNibName:@"CKFoodCell" bundle:nil] forCellReuseIdentifier:@"CKFoodCell"];
    
    self.tableViewFoodClass.tableFooterView =[[UIView alloc] init];
    self.tableViewFoodClass.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
//    self.tableViewFoodList.height = self.mainScrollView.height;
//    self.tableViewFoodClass.height = self.mainScrollView.height;
    arrayFoodClass = [[NSMutableArray alloc] initWithObjects:@"法师鲜奶",@"巧克力",@"苏轼拉面", nil];
    arrayFoodList = [[NSMutableArray alloc] init];
    NSArray *arr1 = @[@"新鲜蛋糕",@"巧克力蛋糕",@"奶油蛋糕"];
    NSArray *arr2 = @[@"话是签了里",@"巧克力棒",@"千克力并"];
    NSArray *arr3 = @[@"加州拉面",@"兰州拉面",@"普通拉面",@"刀削面"];
    [arrayFoodList addObject:arr1];
    [arrayFoodList addObject:arr2];
    [arrayFoodList addObject:arr3];
    
    self.lblOderCount.layer.cornerRadius = 6;
//    self.lblOderCount.layer.masksToBounds = YES;
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
