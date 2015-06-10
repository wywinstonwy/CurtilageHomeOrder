//
//  CKPageScrollView.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/5.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKPageScrollView.h"

@implementation CKPageScrollView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    
    return self;
    
}
- (void)createView
{
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*10, 200)];
    self.mainScrollView.delegate = self;
    self.mainScrollView.pagingEnabled = YES;
    [self addSubview:self.mainScrollView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    btn.backgroundColor = setMenuBack;
    
    [self.mainScrollView addSubview:btn];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 170, SCREEN_WIDTH, 30)];
    self.pageControl.numberOfPages = 10;
    self.pageControl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.pageControl.currentPageIndicatorTintColor = setNaviColor;
    [self addSubview:self.pageControl];
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.mainScrollView) {
        NSInteger page = self.mainScrollView.contentOffset.x/SCREEN_WIDTH;
        self.pageControl.currentPage = page;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
