//
//  HomeViewController.m
//  CurtilageHomeOrder
//
//  Created by WangYun on 15-6-3.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITextFieldDelegate>

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
    [self setNaviStyle];
    // Do any additional setup after loading the view from its nib.
}


- (void)setNaviStyle
{
    [self setLeftBarWithLeftImage:@"back" action:@selector(popBack)];
    
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
