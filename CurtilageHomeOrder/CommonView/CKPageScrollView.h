//
//  CKPageScrollView.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/5.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKPageScrollView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)UIScrollView * mainScrollView;
@end
