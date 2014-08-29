//
//  NTViewController.h
//  Test007
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockString.h"
#import "NTClockView.h"

@interface NTViewController : UIViewController < NTClockStringDelegate >

@property (weak, nonatomic) IBOutlet UILabel *start_Label;
@property (weak, nonatomic) IBOutlet NTClockView *start_ClockView;

@end
