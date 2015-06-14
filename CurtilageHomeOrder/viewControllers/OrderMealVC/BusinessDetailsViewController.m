//
//  BusinessDetailsViewController.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/8.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BusinessDetailsViewController.h"
#import "CKFoodCell.h"
#import "CKChooseMealViewController.h"
#import "CKBusinessInfoViewController.h"
#import "CKBusinessCommentViewController.h"
@interface BusinessDetailsViewController ()<UIScrollViewDelegate>
{
   
}
@end

@implementation BusinessDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication].keyWindow addSubview:self.viewStoreNotifi];
    self.viewStoreNotifi.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.viewStoreNotifi.hidden = YES;
    
    self.mainScrollView.width = SCREEN_WIDTH;
    self.mainScrollView.height = SCREEN_HEIGHT-94;
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*3, SCREEN_HEIGHT-94)];
    self.mainScrollView.pagingEnabled = YES;

    CKChooseMealViewController *choseMealVC = [[CKChooseMealViewController alloc] initWithNibName:@"CKChooseMealViewController" bundle:nil];
    [self addChildViewController:choseMealVC];
    choseMealVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.mainScrollView.height);
    [self.mainScrollView addSubview:choseMealVC.view];
   
    //评论列表
    CKBusinessCommentViewController *commentVC = [[CKBusinessCommentViewController alloc] initWithNibName:@"CKBusinessCommentViewController" bundle:nil];
    [self addChildViewController:commentVC];
    commentVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.mainScrollView.height);
    [self.mainScrollView addSubview:commentVC.view];
    
    //商户详情
    CKBusinessInfoViewController *viewFlag = [[CKBusinessInfoViewController alloc] initWithNibName:@"CKBusinessInfoViewController" bundle:nil];
    [self addChildViewController:viewFlag];
    viewFlag.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.mainScrollView.height);
    [self.mainScrollView addSubview:viewFlag.view];
    
}
//关闭店内通知
- (IBAction)btnClickCloseStoreNotifi:(UIButton *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewStoreNotifi.bottom = 0;
    } completion:^(BOOL finished) {
        self.viewStoreNotifi.hidden = YES;
  
    }];
}
- (IBAction)btnClickOpenStoreNotifi:(id)sender
{
    self.viewStoreNotifi.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.viewStoreNotifi.top = 0;
    } completion:^(BOOL finished) {
        
    }];

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
