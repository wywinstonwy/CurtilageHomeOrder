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
@interface HomeViewController ()<UITextFieldDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    CLLocationManager *locationManager;
}
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订餐";
    [[self rdv_tabBarItem] setBadgeValue:@"3"];
    
    [self.tableview registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    [self setNaviStyle];
    
    [self startLocation];
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
    return 116;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    
    
    return cell;

}
//设置导航栏样式
- (void)setNaviStyle
{
    [self setLeftBarWithLeftTitle:@"北京" action:@selector(popBack)];
    
    UIView *viewNavi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 140, 30)];
    viewNavi.layer.cornerRadius = 4.0f;
    viewNavi.backgroundColor = [UIColor whiteColor];
    self.textSearch = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, viewNavi.width-40, 30)];
    self.textSearch.delegate = self;
    self.textSearch.placeholder = @"搜索关键字";
    self.textSearch.returnKeyType = UIReturnKeySearch;
    [viewNavi addSubview:self.textSearch];
    self.navigationItem.titleView  = viewNavi;
    
    [self setRightBarWithRightImage:@"back" action:@selector(popBack)];
    
    
}
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
                               [self setLeftBarWithLeftTitle:[arr objectAtIndex:0] action:@selector(popBack)];

                           }
                           else
                               [self setLeftBarWithLeftTitle:place.locality action:@selector(popBack)];


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
