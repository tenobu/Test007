//
//  NTClockView.m
//  Test007
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockView.h"

@interface NTClockView ()
{
	
@private
	
	NTClockRecognizer *clockRecognizer;
	
	NSString *string_AmPm;
	NSString *string_Hour;
	NSString *string_Minute;
	
}

@end

@implementation NTClockView

+ (NTClockView *)loadInstanceOfViewFromNib
{
	
    return [[[NSBundle mainBundle] loadNibNamed: @"NTClockView"
										  owner: nil
										options: nil] lastObject];
	
}

- (id) awakeAfterUsingCoder: (NSCoder *)aDecoder
{
	
    BOOL loadedFromSimpleVuew = ( [[self subviews] count] == 0 );
    
	if ( loadedFromSimpleVuew ) {
		
        NTClockView *clockView = [NTClockView loadInstanceOfViewFromNib];
		
        clockView.frame                  = self.frame;
        clockView.autoresizingMask       = self.autoresizingMask;
        clockView.alpha                  = self.alpha;
        clockView.userInteractionEnabled = self.userInteractionEnabled;
		
        return clockView;
		
    }
	
    return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	self.integer_AmPm = 1;
	self.integer_Hour = self.integer_Minute = 0;
	
	self.hour_ImageView.clockRecognizer.delegate   = (id)self;
	self.minute_ImageView.clockRecognizer.delegate = (id)self;

	string_AmPm   = @"AM";
	string_Hour   = @"00";
	string_Minute = @"00";
	
	clockRecognizer = [[NTClockRecognizer alloc] init];
	
	clockRecognizer.delegate = self;
	
	self.hour_ImageView.clockRecognizer   = clockRecognizer;
	self.minute_ImageView.clockRecognizer = clockRecognizer;
	
	//stringAmPm = @"AM";
	
}

- (IBAction)button_Action: (id)sender
{
	
	if ( self.integer_AmPm == 1 ) {
		
		self.integer_AmPm = 2;
		
		string_AmPm = @"PM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_PM.png"];
		
		[self.amPm_Button setImage: image forState: UIControlStateNormal];
		
	} else if ( self.integer_AmPm == 2 ) {
		
		self.integer_AmPm = 1;
		
		string_AmPm = @"AM";
		
		UIImage *image = [UIImage imageNamed: @"Enn_AM.png"];
		
		[self.amPm_Button setImage: image forState: UIControlStateNormal];
		
	}
	
	[self time];
	
}

- (void)integerHour: (NSInteger)_integer
{
	
	self.hour_ImageView.transform = CGAffineTransformMakeRotation( _integer *  M_PI / 180 );
	
}

- (void)integerMinute: (NSInteger)_integer
{
	
	self.minute_ImageView.transform = CGAffineTransformMakeRotation( _integer *  M_PI / 180 );
	
}

- (void)hour: (NSInteger)_integer
{
	
	// NSLog( @"Hour = %02ld", _integer );
	
	string_Hour = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)minute:(NSInteger)_integer
{
	
	// NSLog( @"Minute = %02ld", _integer );
	
	string_Minute = [NSString stringWithFormat: @"%02ld", _integer];
	
	[self time];
	
}

- (void)time
{
	
	self.string_Time = [NSString stringWithFormat: @"%@ %@:%@", string_AmPm, string_Hour, string_Minute];
	
	NSLog( @"Time = %@", self.string_Time );
	
	if ( [self.delegate respondsToSelector: @selector(time:)] ) {
		
        [self.delegate time: self.string_StartEnd];
		
    }
	
}

@end
