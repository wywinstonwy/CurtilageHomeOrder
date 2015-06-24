//
//  OrderDetailViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()<UIScrollViewDelegate>

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    // Do any additional setup after loading the view from its nib.
    [self setContenViewFrame];
}
-(void)setContenViewFrame
{
    self.mainScrollView.height = SCREEN_HEIGHT - 108;
    self.tableOrderState.height = self.tableOrderDeßtail.height = self.mainScrollView.height;
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-108)];
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
