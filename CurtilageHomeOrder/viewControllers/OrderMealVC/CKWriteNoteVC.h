//
//  CKWriteNoteVC.h
//  CurtilageHomeOrder
//
//  Created by wy on 15/6/14.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseViewController.h"

@interface CKWriteNoteVC : BaseViewController
@property (nonatomic,weak) IBOutlet UITextView *textViewContent;
- (IBAction)btnClickSure:(id)sender;

@end
