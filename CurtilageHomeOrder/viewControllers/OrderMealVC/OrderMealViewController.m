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

#import <CoreLocation/CoreLocation.h>
#import "BusinessDetailsViewController.h"
#import "CKSearchViewController.h"
#import "CKMerchantModel.h"
#import "CKMerchantClassModel.h"
#import "MJRefresh.h"
@interface OrderMealViewController ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>
{
    ViewSelectConditions *viewSelectList;
    CLLocationManager *locationManager;
    NSMutableArray *arrayMerchantList;//商家
    
    NSMutableArray *arrayMerchantClass;//商家分类列表

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
    self.tableview.height = SCREEN_HEIGHT - 108-49;
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    self.lblNavititle.text = @"定位中...";
    self.lblNavititle.width = SCREEN_WIDTH- 120;
    [self.navigationController setNavigationBarHidden:YES];
    //开启定位
    [self startLocation];
    
    
    self.btnCanTClass.left = 0;
    self.btnCanTClass.width = SCREEN_WIDTH/3.0f;
    self.btnPaixu.left = SCREEN_WIDTH/3.0f;
    self.btnPaixu.width = SCREEN_WIDTH/3.0f;
    self.btnFuLi.left = (SCREEN_WIDTH/3.0f)*2;
    self.btnFuLi.width = SCREEN_WIDTH/3.0f;
    
    UILabel *lblLine1 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3.0f - 1, 7, 1, 30)];
    lblLine1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.btnCanTClass addSubview:lblLine1];
    lblLine1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, 1, 30)];
    lblLine1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.btnFuLi addSubview:lblLine1];
    arrayMerchantList = [[NSMutableArray alloc] initWithCapacity:0];
    arrayMerchantClass = [[NSMutableArray alloc] initWithCapacity:0];
    self.tableview.tableFooterView = [[UIView alloc] init];
    [self.tableview addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(getData)];
    //加载数据
    [self getData];
    //商家分类
    [self getMerchantClassList];
}
- (void)getData
{
    
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/getMerchantsList.action" parameters:nil forSucess:^(id result) {
        NSLog(@"%@",result);
        NSInteger resultMessage = [[result objectForKey:@"resultMessage"] integerValue];
        if (resultMessage == 0) {
            NSArray *arr = [result objectForKey:@"resultList"];
            
            if ([arr isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *dict in arr)
                {
                    CKMerchantModel *dataModel = [[CKMerchantModel alloc] init];
                    [dataModel setValuesForKeysWithDictionary:dict];
                    [arrayMerchantList addObject:dataModel];
                    
                }
            }
        }
        [self.tableview reloadData];
        [self.tableview.legendFooter endRefreshing];
        [self.tableview.legendHeader endRefreshing];
    } forFail:^(NSError *error) {
        [self.tableview.legendFooter endRefreshing];
        [self.tableview.legendHeader endRefreshing];
        [SVProgressHUD showErrorWithStatus:NETTIPS];
    }];
}

#pragma mark 商家分类列表
-(void)getMerchantClassList
{
    [[BaseNetWork shareManager] postRequestWithBaseURLString:@"zj/json/getMerchantGroupList.action" parameters:nil forSucess:^(id result) {
        NSLog(@"商家分类%@",result);
        
        NSInteger resultMessage = [[result objectForKey:@"resultMessage"] integerValue];
        if (resultMessage == 0) {
            NSArray *arr = [result objectForKey:@"resultList"];
            
            if ([arr isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *dict in arr)
                {
                    CKMerchantClassModel *dataModel = [[CKMerchantClassModel alloc] init];
                    [dataModel setValuesForKeysWithDictionary:dict];
                    [arrayMerchantClass addObject:dataModel];
                    
                }
            }
        }

        
        
    } forFail:^(NSError *error) {
        
    }];
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayMerchantList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CKMerchantModel *dataModel = [arrayMerchantList objectAtIndex:indexPath.row];
if(!dataModel.isOpen)
    return 120;
    else
        return 220;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    CKMerchantModel *dataModel = [arrayMerchantList objectAtIndex:indexPath.row];
    [cell setCellContentWithModel:dataModel];
    cell.btnDiscontDetail.tag = indexPath.row;
    [cell.btnDiscontDetail addTarget:self action:@selector(btnClickOpenCellWithSender:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BusinessDetailsViewController *viewFlag = [BusinessDetailsViewController new];
    [self pushToViewController:viewFlag anmation:YES];
    
}
-(void)btnClickOpenCellWithSender:(UIButton *)sender
{
    CKMerchantModel *dataModel = [arrayMerchantList objectAtIndex:sender.tag];
    dataModel.isOpen = !dataModel.isOpen;
    [self.tableview reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:sender.tag inSection:0]] withRowAnimation:(UITableViewRowAnimationFade)];
}
#pragma mark 地图定位
- (void)startLocation
{
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager requestAlwaysAuthorization];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;    [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
            if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
            {
                [locationManager requestWhenInUseAuthorization];
            } break;
        default:
            break;
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error);
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = locations[0];
    CLLocationCoordinate2D oldCoordinate = newLocation.coordinate;
    NSLog(@"旧的经度：%f,旧的纬度：%f",oldCoordinate.longitude,oldCoordinate.latitude);
    
    //    CLLocation *newLocation = locations[1];
    //    CLLocationCoordinate2D newCoordinate = newLocation.coordinate;
    //    NSLog(@"经度：%f,纬度：%f",newCoordinate.longitude,newCoordinate.latitude);
    
    // 计算两个坐标距离
    //    float distance = [newLocation distanceFromLocation:oldLocation];
    //    NSLog(@"%f",distance);
    
    [manager stopUpdatingLocation];
    
    //------------------位置反编码---5.0之后使用-----------------
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error){
                       
                       for (CLPlacemark *place in placemarks) {
                           
                           NSLog(@"name,%@",place.name);
                           self.lblNavititle.text = place.name;
                           
                           
                           // 位置名
                           // NSLog(@"thoroughfare,%@",place.thoroughfare);
                           // 街道
                           //NSLog(@"subThoroughfare,%@",place.subThoroughfare);
                           // 子街道
                           // NSLog(@"locality,%@",place.locality);
                           // 市
                           // NSLog(@"subLocality%@",place.subLocality);
                           // 区
                           //NSLog(@"country,%@",place.country);
                           // 国家
                       }
                       
                   }];
}

#pragma mark methos 
- (IBAction)btnClickSearch:(id)sender
{
    CKSearchViewController *viewFlag = [CKSearchViewController new];
    [self pushToViewController:viewFlag anmation:YES];
}
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
        
        viewSelectList = [[ViewSelectConditions alloc] initWithFrame:CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT- 64-44-49)];
        [self.view addSubview:viewSelectList];
        viewSelectList.tapCancelBlock = ^(NSString *index)
        {
            [weakSelf hiddenSelectList];
        };
    }
    if (sender.tag == 100) {
        viewSelectList.arraySource = arrayMerchantClass;
        
    }
    else if (sender.tag == 101)
    {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        NSArray *arrTitle = @[@"默认排序",@"销量最高",@"距离最近",@"评分最高",@"起送价最低",@"送餐速度最快"];
        for(int i = 0;i<arrTitle.count;i++)
        {
            CKMerchantClassModel *dataModel = [[CKMerchantClassModel alloc] init];
            dataModel.merchantGroupName = [arrTitle objectAtIndex:i];
            [arr addObject:dataModel];
        }
        viewSelectList.arraySource = arr;

    }
    else if (sender.tag == 102)
    {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        NSArray *arrTitle = @[@"全部福利",@"支持在线支付",@"新用户立减",@"立减优惠",@"支持代金券",@"支持开发票",@"客家派送"];
        for(int i = 0;i<arrTitle.count;i++)
        {
            CKMerchantClassModel *dataModel = [[CKMerchantClassModel alloc] init];
            dataModel.merchantGroupName = [arrTitle objectAtIndex:i];
            [arr addObject:dataModel];
        }
        viewSelectList.arraySource = arr;
    }
    [viewSelectList.tableview reloadData];
    [self showSelectList];
}
#pragma mark 下拉条件选择列表
- (void)showSelectList
{
    viewSelectList.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [UIView animateWithDuration:0.3 animations:^{
        viewSelectList.top = 108;
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
