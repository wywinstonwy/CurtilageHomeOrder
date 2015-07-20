//
//  CKViewStars.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKViewStars.h"

@implementation CKViewStars
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

-(void)createView
{
    int width = 18;
    for (int i = 0; i<5; i++)
    {
        UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(i*(width+1.5), 0, 18, 18)];
        imageView.image = [UIImage imageNamed:@"SamllHeart"];
        imageView.tag = i+10;
        if (i<3) {
            imageView.image = [UIImage imageNamed:@"SamllHeart2"];
        }
        [self addSubview:imageView];
    }
}

-(void)setStartcount:(NSInteger)count;
{
    for (int i = 0; i<5; i++)
    {
        UIImageView *imageV = (UIImageView *)[self viewWithTag:i+10];
        if (i<=count) {
            imageV.image = [UIImage imageNamed:@"SamllHeart2"];
        }
        else
            imageV.image = [UIImage imageNamed:@"SamllHeart"];

        
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
