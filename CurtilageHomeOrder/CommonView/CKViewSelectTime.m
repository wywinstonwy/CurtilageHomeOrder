//
//  CKViewSelectTime.m
//  CurtilageHomeOrder
//
//  Created by wy on 15/7/4.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "CKViewSelectTime.h"

@implementation CKViewSelectTime
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}
- (void)createView
{
    UITableView *talbeViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
    talbeViewList.delegate =self;
    talbeViewList.dataSource = self;
    
    [self addSubview:talbeViewList];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
