//
//  NTViewController.m
//  Test007
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTViewController.h"

@interface NTViewController ()

@end

@implementation NTViewController

- (void)viewDidLoad
{
    
	[super viewDidLoad];

	self.start_ClockView.delegate = (id)self;
	
	self.start_ClockView.string_StartEnd = @"Start";
	
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    
}

- (void)time: (NSString *)_startEnd
{
	
	if ( [_startEnd isEqualToString: @"Start"] ) {
		
		self.start_Label.text = self.start_ClockView.string_Time;
		
	} /*else if ( [_startEnd isEqualToString: @"End"] ) {
		
		self.s.text = self.clock_EndTime.string_Time;
		
	}*/
	
}

@end
