//
//  CKChooseMealViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-11.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKChooseMealViewController.h"
#import "CKFoodCell.h"
#import "CKFoodListModel.h"
#import "CKButton.h"
#import "CKSelectResultCell.h"
#import "CKCommitOrderVC.h"
#import "CKFoodClassCell.h"

@interface CKChooseMealViewController ()
{
    NSMutableArray *arrayFoodClass;
    NSMutableArray *arrayFoodList;
    NSMutableArray *arraySelectResult;

}
@end

@implementation CKChooseMealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewFoodClass registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableViewFoodClass registerNib:[UINib nibWithNibName:@"CKFoodClassCell" bundle:nil] forCellReuseIdentifier:@"CKFoodClassCell"];
    
    [self.tableViewFoodList registerNib:[UINib nibWithNibName:@"CKFoodCell" bundle:nil] forCellReuseIdentifier:@"CKFoodCell"];
    
    [self.tableViewSelectResult registerNib:[UINib nibWithNibName:@"CKSelectResultCell" bundle:nil] forCellReuseIdentifier:@"CKSelectResultCell"];
    
    self.tableViewFoodClass.tableFooterView =[[UIView alloc] init];
    self.tableViewFoodClass.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.viewSelectResult.top = SCREEN_HEIGHT;
    self.tableViewSelectResult.tableHeaderView = self.viewSelectResultHeader;
    self.tableViewSelectResult.tableFooterView = [[UIView alloc] init];

    arrayFoodClass = [[NSMutableArray alloc] initWithObjects:@"法师鲜奶",@"巧克力",@"苏轼拉面", nil];
    arrayFoodList = [[NSMutableArray alloc] init];
    arraySelectResult = [[NSMutableArray alloc] initWithCapacity:0];
    NSArray *arr1 = @[@"新鲜蛋糕",@"巧克力蛋糕",@"奶油蛋糕"];
    NSArray *arr2 = @[@"话是签了里",@"巧克力棒",@"千克力并"];
    NSArray *arr3 = @[@"加州拉面",@"兰州拉面",@"普通拉面",@"刀削面"];
    
    NSMutableArray *arr11 = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *arr22 = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *arr33 = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<arr1.count; i++)
    {
        CKFoodListModel *dataModel =[[CKFoodListModel alloc] init];
        dataModel.foodName = [arr1 objectAtIndex:i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        dataModel.foodRecommendCont= [NSString stringWithFormat:@"%d",i];
        dataModel.foodSelectCount= [NSString stringWithFormat:@"%d",i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        [arr11 addObject:dataModel];
        
    } for (int i = 0; i<arr2.count; i++)
    {
        CKFoodListModel *dataModel =[[CKFoodListModel alloc] init];
        dataModel.foodName = [arr2 objectAtIndex:i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        dataModel.foodRecommendCont= [NSString stringWithFormat:@"%d",i];
        dataModel.foodSelectCount= [NSString stringWithFormat:@"%d",i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        [arr22 addObject:dataModel];
        
    } for (int i = 0; i<arr3.count; i++)
    {
        CKFoodListModel *dataModel =[[CKFoodListModel alloc] init];
        dataModel.foodName = [arr3 objectAtIndex:i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        dataModel.foodRecommendCont= [NSString stringWithFormat:@"%d",i];
        dataModel.foodSelectCount= [NSString stringWithFormat:@"%d",i];
        dataModel.foodPrice= [NSString stringWithFormat:@"%d",i];
        [arr33 addObject:dataModel];
        
    }
    [arrayFoodList addObject:arr11];
    [arrayFoodList addObject:arr22];
    [arrayFoodList addObject:arr33];
    self.lblOderCount.layer.cornerRadius = self.lblOderCount.height/2.0f;
    self.lblOderCount.layer.masksToBounds = YES;
    // Do any additional setup after loading the view from its nib.
}
#pragma mark UITableViewDelagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag ==1) {
        return arrayFoodClass.count;
    }
    else if(tableView.tag ==2)
    {
        NSArray *arr = [arrayFoodList objectAtIndex:section];
        return  arr.count;
    }
    else
        return arraySelectResult.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag ==1) {
        return 1;
    }
    else if(tableView.tag == 2)
    {
        return arrayFoodList.count;

    }
    else
        return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        return 44;
    }
    else if(tableView.tag ==2)
    {
        return 100;
    }
    else
        return 44;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return nil;
    }
    else if(tableView.tag == 2)
    {
        return @"法师蛋糕";
    }
    else
    {
        return nil;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1) {
        CKFoodClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKFoodClassCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.lblName.text = [arrayFoodClass objectAtIndex:indexPath.row];
        if (cell.selected) {
            cell.backgroundColor = [UIColor whiteColor];
            cell.lblCurrent.hidden = NO;
        }
        else
        {
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
            cell.lblCurrent.hidden = YES;

        }

        
        return cell;
    }
    else if(tableView.tag == 2)
    {//CKFoodCell
        CKFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKFoodCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *arr = [arrayFoodList objectAtIndex:[indexPath section]];
        CKFoodListModel *dataModel = [arr objectAtIndex:indexPath.row];
        dataModel.section = [indexPath section];
        dataModel.indexRow = indexPath.row;
        
        cell.btnPlus.indexRow = indexPath.row;
        cell.btnPlus.section = [indexPath section];
        cell.btnReduce.indexRow = indexPath.row;
        cell.btnReduce.section = [indexPath section];
        [cell.btnPlus addTarget:self action:@selector(btnClickPlus:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnReduce addTarget:self action:@selector(btnClickReduce:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [cell setCellContent:dataModel indexPath:indexPath];
        return cell;
    }
    else
    {
        CKSelectResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CKSelectResultCell"];
        if (indexPath) {
            if (arraySelectResult.count>= indexPath.row+1) {
                CKFoodListModel *dataModel = [arraySelectResult objectAtIndex:indexPath.row];
                cell.btnPlus.indexRow = indexPath.row;
                cell.btnPlus.section = [indexPath section];
                cell.btnReduce.indexRow = indexPath.row;
                cell.btnReduce.section = [indexPath section];
                [cell.btnPlus addTarget:self action:@selector(btnClickSelectResultPlus:) forControlEvents:UIControlEventTouchUpInside];
                [cell.btnReduce addTarget:self action:@selector(btnClickSelectResultReduce:) forControlEvents:UIControlEventTouchUpInside];
                [cell setCellContent:dataModel indexPath:indexPath];
            }
            
        }
       
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 1)
    {
        [self.tableViewFoodList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
    }
    else if(tableView.tag == 2)
    {
        [self.tableViewFoodClass selectRowAtIndexPath:[NSIndexPath indexPathForRow:[indexPath section] inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionTop)];
        
    }
   
}
-(IBAction)btnClickShowShopingCart:(id)sender
{
    [self calculateTotalNumber];
    [self.tableViewSelectResult reloadData];
    if (arraySelectResult.count <= 0) {
        return;
    }
    self.tableViewSelectResult.height = 44*arraySelectResult.count+44;
    if (self.tableViewSelectResult.height>SCREEN_HEIGHT-113) {
        self.tableViewSelectResult.height = SCREEN_HEIGHT-113;
    }
    self.tableViewSelectResult.bottom = SCREEN_HEIGHT - 143;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.viewSelectResult.top = 0;
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)hiddenShopingCart
{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewSelectResult.top = SCREEN_HEIGHT;
    } completion:^(BOOL finished) {
        
    }];
}
//清除购物车
- (IBAction)clearShopingCar:(id)sender;
{
    [arraySelectResult removeAllObjects];

    for (int i = 0; i < arrayFoodList.count; i++)
    {
        NSArray *arr = [arrayFoodList objectAtIndex:i];
        
        for (int j = 0; j<arr.count; j++)
        {
            CKFoodListModel *dataModel = [arr objectAtIndex:j];
            if ([dataModel.foodSelectCount integerValue]>0)
            {
                dataModel.foodSelectCount = @"0";
            }
        }
    }
    [self.tableViewSelectResult reloadData];
    [self.tableViewFoodList reloadData];
    [self calculateTotalNumber];
    
    [self performSelector:@selector(hiddenShopingCart) withObject:nil afterDelay:0.3];
    
}
//点击购买
- (IBAction)btnClickToBuy:(UIButton *)sender
{
    CKCommitOrderVC *viewFlag = [[CKCommitOrderVC alloc] initWithNibName:@"CKCommitOrderVC" bundle:nil];
    [self pushToViewController:viewFlag anmation:YES];
    
}
#pragma mark 选餐数量加减
- (void)btnClickPlus:(CKButton *)sender
{
    NSArray *arr = [arrayFoodList objectAtIndex:sender.section];
    CKFoodListModel *dataModel = [arr objectAtIndex:sender.indexRow];
    
    NSInteger count = [dataModel.foodSelectCount integerValue]+1;
    dataModel.foodSelectCount = [NSString stringWithFormat:@"%ld",(long)count];
    
    [self.tableViewFoodList reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:sender.indexRow inSection:sender.section]] withRowAnimation:(UITableViewRowAnimationFade)];
    
    [self calculateTotalNumber];
    

}
- (void)btnClickReduce:(CKButton *)sender
{
    NSArray *arr = [arrayFoodList objectAtIndex:sender.section];
    CKFoodListModel *dataModel = [arr objectAtIndex:sender.indexRow];
    
    NSInteger count = [dataModel.foodSelectCount integerValue];
    if (count>0) {
        count = count-1;
    }
    dataModel.foodSelectCount = [NSString stringWithFormat:@"%ld",(long)count];
    [self.tableViewFoodList reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:sender.indexRow inSection:sender.section]] withRowAnimation:(UITableViewRowAnimationFade)];
    
    [self calculateTotalNumber];

}

#pragma mark 选择结果加减操作
- (void)btnClickSelectResultPlus:(CKButton *)sender
{
    
    CKFoodListModel *dataModel = [arraySelectResult objectAtIndex:sender.indexRow];
    
    NSInteger count = [dataModel.foodSelectCount integerValue]+1;
    dataModel.foodSelectCount = [NSString stringWithFormat:@"%ld",(long)count];
    [self.tableViewSelectResult reloadData];
    [self.tableViewFoodList reloadData];

    [self calculateTotalNumber];
}
- (void)btnClickSelectResultReduce:(CKButton *)sender
{
    CKFoodListModel *dataModel = [arraySelectResult objectAtIndex:sender.indexRow];
    
    NSInteger count = [dataModel.foodSelectCount integerValue];
    if (count>0) {
        count = count-1;
    }
    dataModel.foodSelectCount = [NSString stringWithFormat:@"%ld",(long)count];
    [self.tableViewSelectResult reloadData];
    [self.tableViewFoodList reloadData];

   // [self.tableViewFoodList reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:dataModel.indexRow inSection:dataModel.section]] withRowAnimation:(UITableViewRowAnimationFade)];
    
    [self calculateTotalNumber];
}
#pragma mark 计算所有选中的数量
- (void)calculateTotalNumber
{
    NSInteger selectCount = 0;
    CGFloat TotalPrice = 0.0;
    
    [arraySelectResult removeAllObjects];
    for (int i = 0; i < arrayFoodList.count; i++)
    {
        NSArray *arr = [arrayFoodList objectAtIndex:i];
        
        for (int j = 0; j<arr.count; j++)
        {
            CKFoodListModel *dataModel = [arr objectAtIndex:j];
            if ([dataModel.foodSelectCount integerValue]>0)
            {
                selectCount = selectCount+[dataModel.foodSelectCount integerValue];
                TotalPrice =TotalPrice + [dataModel.foodSelectCount integerValue]*[dataModel.foodPrice floatValue];
                [arraySelectResult addObject:dataModel];
            }
            

        }
    }
    if (selectCount<10) {
        self.lblOderCount.width = self.lblOderCount.height;
    }
    else
        self.lblOderCount.width = self.lblOderCount.height+10;

    self.lblOderCount.text = [NSString stringWithFormat:@"%ld",(long)selectCount];
    self.lblTotalPrice.text = [NSString stringWithFormat:@"共￥%.1f",TotalPrice];
    if(selectCount<=0)
    {
        self.lblOderCount.hidden = YES;
    }
    else
        self.lblOderCount.hidden = NO;
    
    [self.tableViewSelectResult reloadData];
    
    if(TotalPrice<20)
    {
        self.btnBuy.backgroundColor = [UIColor lightGrayColor];
        [self.btnBuy setTitle:[NSString stringWithFormat:@"还差￥%.1f起送",20-TotalPrice] forState:UIControlStateNormal];
        [self.btnBuy setEnabled:NO];
    }
    else if (TotalPrice >= 20)
    {
        self.btnBuy.backgroundColor = setNaviColor;
        [self.btnBuy setTitle:@"选好了" forState:UIControlStateNormal];
        [self.btnBuy setEnabled:YES];

    }
    if (arraySelectResult.count == 0) {
        self.lblTotalPrice.text = @"购物车是空的";
        self.btnBuy.backgroundColor = setNaviColor;
        [self.btnBuy setTitle:@"20元起送" forState:UIControlStateNormal];
        self.btnBuy.enabled = NO;
    }
    
}

- (void)didReceiveMemoryWarning
{
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
