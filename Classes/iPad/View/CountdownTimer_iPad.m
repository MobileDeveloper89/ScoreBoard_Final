//
//  CountdownTimer_iPad.m
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CountdownTimer_iPad.h"

#import "BasketballMainViewController_iPad.h"
#import "ScoreboardAppDelegate.h"
#define SECONDS 59
#define MINUTES 59

@implementation CountdownTimer_iPad

@synthesize minutes,seconds,dButton,minuteImage1,minuteImage2,secondImage1,secondImage2,playPauseButton,timerFlag;


-(void)drawRect:(CGRect)rect{
	[myTimer retain];
	
	if(myTimer)
	{
		if([myTimer isValid])
		{
			[myTimer invalidate];
			myTimer = nil;
		}
	}
    
	isSeconds = NO;
	[playPauseButton setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	[self setupMinutes:minutes];
	[self setupSeconds:seconds];
	timerFlag = YES;
}
-(void)settime:(int)min seconds:(int)sec
{
	if(myTimer)
	{
		[myTimer invalidate];
		myTimer = nil;
		[dButton setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	}
	[self setupMinutes:min];
	[self setupSeconds:sec];
	
}
- (void)timerFired{
	
	
	if(minutes > 0){
		seconds -= 1;
		if(minutes == 0 && seconds == 0)
		{
			[myTimer invalidate];
			myTimer = nil;
			[dButton setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
            
		}
        
		if(seconds ==-1)
		{
			minutes -=1;
			seconds = SECONDS;
            
		}
        [[NSUserDefaults standardUserDefaults] setInteger:minutes forKey:@"minutes"];
        [[NSUserDefaults standardUserDefaults] setInteger:seconds forKey:@"seconds"];
		[self setupMinutes:minutes];
		[self setupSeconds:seconds];
	}
	else {
		seconds -= 1;
		
		if(minutes == 0 && seconds == 0)
		{
			[myTimer invalidate];
			myTimer = nil;
			[dButton setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
            
			ScoreboardAppDelegate * delegat = (ScoreboardAppDelegate*)[[UIApplication sharedApplication] delegate];
            [delegat performSelector:@selector(gameOver:)];
            
            
		}
		[self setupMinutes:minutes];
		[self setupSeconds:seconds];
        [[NSUserDefaults standardUserDefaults] setInteger:minutes forKey:@"minutes"];
        [[NSUserDefaults standardUserDefaults] setInteger:seconds forKey:@"seconds"];
	}
    
	
	
	
}


-(IBAction)playPauseTimer:(UIButton*)button
{ 
	self.dButton = (UIButton *)button;
	if (timerFlag == YES) {
		self.minutes = [[NSUserDefaults standardUserDefaults] integerForKey:@"minutes"];
		self.seconds = [[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
		timerFlag = NO;
	}
	
	if (minutes==0 && seconds==0) {
        
		return;
	}
    
	
//	NSLog(@"%f",[myTimer timeInterval]);
	if(myTimer)
	{
		[myTimer invalidate];
		myTimer = nil;
		[button setImage:[UIImage imageNamed:@"sb2_resume.png"] forState:UIControlStateNormal];
	}
	else {
		
		myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
		
		[button setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	}
}


-(void)setupMinutes:(int)score{
	
	int secondDigit = score %10;
	score = score/10;
	int firstDigit = score;
	
	[self setupImage:minuteImage1 :firstDigit];
	[self setupImage:minuteImage2 :secondDigit];
	
}

-(void)setupSeconds:(int)score{
	
	int secondDigit = score %10;
	score = score/10;
	int firstDigit = score;
	
	[self setupImage:secondImage1 :firstDigit];
	[self setupImage:secondImage2 :secondDigit];
	
}

-(void)setupImage:(UIImageView*)imgView :(int)digit{
	switch (digit) {
		case 0:
			[imgView setImage:[UIImage imageNamed:@"green0.png"]];
			break;	
		case 1:
			[imgView setImage:[UIImage imageNamed:@"green1.png"]];
			break;	
		case 2:
			[imgView setImage:[UIImage imageNamed:@"green2.png"]];
			break;	
		case 3:
			[imgView setImage:[UIImage imageNamed:@"green3.png"]];
			break;	
		case 4:
			[imgView setImage:[UIImage imageNamed:@"green4.png"]];
			break;	
		case 5:
			[imgView setImage:[UIImage imageNamed:@"green5.png"]];
			break;	
		case 6:
			[imgView setImage:[UIImage imageNamed:@"green6.png"]];
			break;	
		case 7:
			[imgView setImage:[UIImage imageNamed:@"green7.png"]];
			break;	
		case 8:
			[imgView setImage:[UIImage imageNamed:@"green8.png"]];
			break;	
		case 9:
			[imgView setImage:[UIImage imageNamed:@"green9.png"]];
			break;	
	}
}

-(void)dealloc
{
	[dButton release];
	[minuteImage1 release];
	[minuteImage2 release];
	[secondImage1 release];
	[secondImage2 release];
	[playPauseButton release];
	[super dealloc];
}
@end
