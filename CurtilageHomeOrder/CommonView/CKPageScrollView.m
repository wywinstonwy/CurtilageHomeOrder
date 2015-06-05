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
        
    }
    
    return self;
    
}
- (void)createView
{
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self.mainScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*10, 200)];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
