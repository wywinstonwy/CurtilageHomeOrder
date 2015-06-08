//
//  BusinessDetailsViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BusinessDetailsViewController.h"

@interface BusinessDetailsViewController ()

@end

@implementation BusinessDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView.width = SCREEN_WIDTH;
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-64)];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btnSelectMenuFunction:(UIButton *)sender;
{
    for (int i = 0; i<3; i++)
    {
        UIButton *btn = (UIButton *)[self.view viewWithTag:100+i];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:setNaviColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.lblLine.centerX = sender.centerX;
 
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
