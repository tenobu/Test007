//
//  NTClockMinuteView.m
//  Test007
//
//  Created by ビザンコムマック０９ on 2014/08/28.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "NTClockMinuteView.h"

@interface NTClockMinuteView ()
{
	
@private
	
	NTClockGestureRecognizer *gestureRecognizer;
	
}

@end

@implementation NTClockMinuteView

- (id)initWithFrame: (CGRect)frame
{
    
	self = [super initWithFrame: frame];
	
    if ( self ) {
		
	}
    
	return self;
	
}

- (void)awakeFromNib
{
	
	[super awakeFromNib];
	
	NSLog( @"minute : %@", NSStringFromCGRect( self.frame ));

	if ( self.subviews.count > 0 ) {

		NSArray *array = self.subviews;
		
	}
	
	gestureRecognizer = [[NTClockGestureRecognizer alloc] initWithRect: self.frame
																target: self];
	
	[self addGestureRecognizer: gestureRecognizer];
	
	
}

- (void) rotation: (CGFloat) angle
{
    
    self.imageAngle += angle;
	 
	if ( self.imageAngle > 360 ) {
	 
		self.imageAngle -= 360;
	 
	} else if ( self.imageAngle < 0 ) {
	 
		self.imageAngle += 360;
	 
	}
	 
	self.transform = CGAffineTransformMakeRotation( self.imageAngle *  M_PI / 180 );
	 
	self.integer_Minute = self.imageAngle / 6;
	 
	[self.clockRecognizer integerMinute: self.integer_Minute];
	
}

@end
