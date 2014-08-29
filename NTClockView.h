//
//  NTClockView.h
//  Test007
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NTClockHourView.h"
#import "NTClockMinuteView.h"

@protocol NTClockViewDelegate < NSObject >

@optional

- (void)time: (NSString *)_startEnd;

@end

@interface NTClockView : UIView < NTClockRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIImageView *back_ImageView;

@property (weak, nonatomic) IBOutlet UIButton *amPm_Button;
@property (weak, nonatomic) IBOutlet NTClockHourView   *hour_ImageView;
@property (weak, nonatomic) IBOutlet NTClockMinuteView *minute_ImageView;

@property (nonatomic, assign) id < NTClockViewDelegate > delegate;

@property NSString *string_StartEnd;
@property NSString *string_Time;
@property NSInteger integer_AmPm, integer_Hour, integer_Minute;

- (void)time;

@end
