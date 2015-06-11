//
//  HomeViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "HomeViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "HomeCell.h"
#import "HomeCellOne.h"
#import "CKPageScrollView.h"

#import "OrderMealViewController.h"
#import "OrderListViewController.h"
#import "MyViewController.h"
#import "SettingViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
@interface HomeViewController ()<UITextFieldDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    CLLocationManager *locationManager;//地图定位
    RDVTabBarController *tabBarController;//tabbar
   // viewSelectList *viewCityClist;//城市选择列表
}
@property (nonatomic,strong)UIButton *btnCity;
@end

@implementation HomeViewController
@synthesize btnCity;
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    tabBarController.selectedIndex = 0;
    [self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[self rdv_tabBarItem] setBadgeValue:@"3"];
    [self.tableview registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"HomeCellOne" bundle:nil] forCellReuseIdentifier:@"HomeCellOne"];
  //  [self setNaviStyle];
    
    [self startLocation];
    
    [self setupViewControllers];
    
    
    [self createSubview];
 
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
    if (indexPath.row<=1) {
        HomeCellOne *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCellOne"];
        return cell;
    }
    else
    {
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
        
        
        return cell;

    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushToViewController:tabBarController anmation:YES];
    
}

#pragma mark 视图初始化
- (void)createSubview
{
    CKPageScrollView *viewHead = [[CKPageScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 315)];
    self.tableview.tableHeaderView = viewHead;
    NSArray *arrImages = @[@"GourmetDelivery",@"Lifeservice",@"OnlineBooking"];
    NSArray *arrTitles = @[@"美食外卖",@"生活服务",@"在线订房"];
    CGFloat with = 60;
    for (int i = 0; i<3; i++)
    {
        UIButton*btnHead = [UIButton buttonWithType:UIButtonTypeCustom];
        btnHead.frame = CGRectMake((SCREEN_WIDTH-with*3)/4 +(with + (SCREEN_WIDTH-with*3)/4)*i, 210, with, with);
        [btnHead setImage:[UIImage imageNamed:[arrImages objectAtIndex:i]] forState:UIControlStateNormal];
        [viewHead addSubview:btnHead];
        [btnHead addTarget:self action:@selector(btnClickToServerce) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/3)*i, btnHead.bottom+5, SCREEN_WIDTH/3, 21)];
        lblTitle.textAlignment= NSTextAlignmentCenter;
        lblTitle.text = [arrTitles objectAtIndex:i];
        lblTitle.centerX = btnHead.centerX;
        [viewHead addSubview:lblTitle];
        
    }
    UILabel *lblLine = [[UILabel alloc] initWithFrame:CGRectMake(0, viewHead.height-10, SCREEN_WIDTH, 10)];
    lblLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [viewHead addSubview:lblLine];
    
    
    __weak HomeViewController *weakSelf = self;
    
    self.viewSelectCity.selectresultBlock = ^(id result)
    {
        weakSelf.lblCity.text=result;
        [weakSelf.lblCity sizeToFit];
        weakSelf.lblCity.height = 22;
        weakSelf.imageVCity.left = weakSelf.lblCity.right;
        
        [weakSelf hidenCityList];
        
    };
    
}
#pragma mark 美食外卖，生活服务，在线订房
- (void)btnClickToServerce
{
    [self pushToViewController:tabBarController anmation:YES];

}
- (IBAction)selectCity
{
    if (self.viewSelectCity.top == 64) {
        [self hidenCityList];
        return;
    }
    self.viewSelectCity.height =SCREEN_HEIGHT-64;
    self.viewSelectCity.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.viewSelectCity.hidden = NO;
    self.imageVCity.image =[UIImage imageNamed:@"shangSanjiao"];

    [UIView animateWithDuration:0.5 animations:^{
        self.viewSelectCity.top = 64;
    } completion:^(BOOL finished) {
        self.viewSelectCity.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }];
}
- (void)hidenCityList
{
    self.viewSelectCity.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [UIView animateWithDuration:0.5 animations:^{
        self.viewSelectCity.bottom = 64;
        self.imageVCity.image =[UIImage imageNamed:@"xiaSanjiao"];
    } completion:^(BOOL finished) {
        self.viewSelectCity.hidden = YES;
    }];
}
- (void)setLeftBarWithLeftTitle:(NSString *)leftTitle action:(SEL)leftAction
{
    btnCity = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCity.frame = CGRectMake(0, 0, 60, 22);
    if (leftTitle) {
        [btnCity setTitle:leftTitle forState:UIControlStateNormal];
    }
    
    [btnCity addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
 
    // btn_back.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btnCity];
    backItem.customView.backgroundColor = setMenuBack;
    self.navigationItem.leftBarButtonItem = backItem;
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
                           NSArray *arr = [place.locality componentsSeparatedByString:@"市"];
                           if(arr.count)
                           {
                               //[self setLeftBarWithLeftTitle:[arr objectAtIndex:0] action:@selector(popBack)];
                               [btnCity setTitle:[arr objectAtIndex:0] forState:UIControlStateNormal];

                           }
                           else
                               [btnCity setTitle:place.locality forState:UIControlStateNormal];



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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Methods Tabbar

- (void)setupViewControllers {
    OrderMealViewController *v1 = [[OrderMealViewController alloc] init];
    UINavigationController *navi1 = [[UINavigationController alloc]
                                     initWithRootViewController:v1];
    
    OrderListViewController *v2 = [[OrderListViewController alloc] initWithNibName:@"OrderListViewController" bundle:nil];
    UINavigationController *navi2 = [[UINavigationController alloc]
                                     initWithRootViewController:v2];
    
    MyViewController *v3 = [[MyViewController alloc] init];
    UINavigationController *navi3 = [[UINavigationController alloc]
                                     initWithRootViewController:v3];
    
    SettingViewController *v4 = [[SettingViewController alloc] init];
    UINavigationController *navi4 = [[UINavigationController alloc]
                                     initWithRootViewController:v4];
    navi1.navigationBar.barTintColor =
    navi2.navigationBar.barTintColor =
    navi3.navigationBar.barTintColor =
    navi4.navigationBar.barTintColor = setNaviColor;
    
    navi1.navigationBar.translucent =
    navi2.navigationBar.translucent =
    navi3.navigationBar.translucent =
    navi4.navigationBar.translucent = NO;
    
    
    tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[v1, v2,v3,v4]];
//    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarControlle {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"1", @"2", @"3",@"4"];
    NSArray *titleArr = @[@"订餐",@"订单",@"我的",@"设置"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarControlle tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"TS%@",
                                                      [tabBarItemImages objectAtIndex:index]]];
        
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"T%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = [titleArr objectAtIndex:index];
        index++;
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
