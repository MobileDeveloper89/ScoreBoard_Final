//
//  CountDownTimerTheme1_ipad.m
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/7/12.
//
//

#import "CountDownTimerTheme1_ipad.h"

#import "BasketballMainViewController_iPad.h"
#import "ScoreboardAppDelegate.h"
#define SECONDS 59
#define MINUTES 59


@implementation CountDownTimerTheme1_ipad

@synthesize minutesTheme1,secondsTheme1,dButtonTheme1,minuteImage1Theme1,minuteImage2Theme1,secondImage1Theme1,secondImage2Theme1,playPauseButtonTheme1,timerFlagTheme1;

-(void)drawRect:(CGRect)rect{
	[myTimerTheme1 retain];
	
	if(myTimerTheme1)
	{
		if([myTimerTheme1 isValid])
		{
			[myTimerTheme1 invalidate];
			myTimerTheme1 = nil;
		}
	}
    
	isSecondsTheme1 = NO;
	[playPauseButtonTheme1 setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	[self setupMinutes:minutesTheme1];
	[self setupSeconds:secondsTheme1];
	timerFlagTheme1 = YES;
}
-(void)settime:(int)min seconds:(int)sec
{
	if(myTimerTheme1)
	{
		[myTimerTheme1 invalidate];
		myTimerTheme1 = nil;
		[dButtonTheme1 setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	}
	[self setupMinutes:min];
	[self setupSeconds:sec];
	
}
- (void)timerFired{
	
	
	if(minutesTheme1 >0){
		secondsTheme1 -=1;
		if(minutesTheme1 ==0 && secondsTheme1 ==0)
		{
			[myTimerTheme1 invalidate];
			myTimerTheme1 = nil;
			[dButtonTheme1 setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
            
		}
        
		if(secondsTheme1 ==-1)
		{
			minutesTheme1 -=1;
			secondsTheme1 = SECONDS;
            
		}
        [[NSUserDefaults standardUserDefaults] setInteger:minutesTheme1 forKey:@"minutesTheme1"];
        [[NSUserDefaults standardUserDefaults] setInteger:secondsTheme1 forKey:@"secondsTheme1"];
		[self setupMinutes:minutesTheme1];
		[self setupSeconds:secondsTheme1];
	}
	else {
		secondsTheme1-=1;
		
		if(minutesTheme1 ==0 && secondsTheme1 ==0)
		{
			[myTimerTheme1 invalidate];
			myTimerTheme1 = nil;
			[dButtonTheme1 setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
            
			ScoreboardAppDelegate * delegat = (ScoreboardAppDelegate*)[[UIApplication sharedApplication] delegate];
            [delegat performSelector:@selector(gameOver:)];
            
            
		}
		[self setupMinutes:minutesTheme1];
		[self setupSeconds:secondsTheme1];
        [[NSUserDefaults standardUserDefaults] setInteger:minutesTheme1 forKey:@"minutesTheme1"];
        [[NSUserDefaults standardUserDefaults] setInteger:secondsTheme1 forKey:@"secondsTheme1"];
	}
    
	
	
	
}


-(IBAction)playPauseTimer:(UIButton*)button
{
	self.dButtonTheme1=(UIButton *)button;
	if (timerFlagTheme1==YES) {
		self.minutesTheme1=[[NSUserDefaults standardUserDefaults] integerForKey:@"minutesTheme1"];
		self.secondsTheme1=[[NSUserDefaults standardUserDefaults] integerForKey:@"secondsTheme1"];
		timerFlagTheme1=NO;
	}
	
	if (minutesTheme1==0 && secondsTheme1==0) {
        
		return;
	}
    
	
	NSLog(@"%f",[myTimerTheme1 timeInterval]);
	if(myTimerTheme1)
	{
		[myTimerTheme1 invalidate];
		myTimerTheme1 = nil;
		[button setImage:[UIImage imageNamed:@"sb3_resume.png"] forState:UIControlStateNormal];
	}
	else {
		
		myTimerTheme1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
		
		[button setImage:[UIImage imageNamed:@"sb2_play.png"] forState:UIControlStateNormal];
	}
}


-(void)setupMinutes:(int)score{
	
	int secondDigit = score %10;
	score = score/10;
	int firstDigit = score;
	
	[self setupImage:minuteImage1Theme1 :firstDigit];
	[self setupImage:minuteImage2Theme1 :secondDigit];
	
}

-(void)setupSeconds:(int)score{
	
	int secondDigit = score %10;
	score = score/10;
	int firstDigit = score;
	
	[self setupImage:secondImage1Theme1 :firstDigit];
	[self setupImage:secondImage2Theme1 :secondDigit];
	
}

-(void)setupImage:(UIImageView*)imgView :(int)digit{
	switch (digit) {
		case 0:
			[imgView setImage:[UIImage imageNamed:@"orange0.png"]];
			break;
		case 1:
			[imgView setImage:[UIImage imageNamed:@"orange1.png"]];
			break;
		case 2:
			[imgView setImage:[UIImage imageNamed:@"orange2.png"]];
			break;
		case 3:
			[imgView setImage:[UIImage imageNamed:@"orange3.png"]];
			break;
		case 4:
			[imgView setImage:[UIImage imageNamed:@"orange4.png"]];
			break;
		case 5:
			[imgView setImage:[UIImage imageNamed:@"orange5.png"]];
			break;
		case 6:
			[imgView setImage:[UIImage imageNamed:@"orange6.png"]];
			break;
		case 7:
			[imgView setImage:[UIImage imageNamed:@"orange7.png"]];
			break;
		case 8:
			[imgView setImage:[UIImage imageNamed:@"orange8.png"]];
			break;
		case 9:
			[imgView setImage:[UIImage imageNamed:@"orange9.png"]];
			break;
	}
}

-(void)dealloc
{
	[dButtonTheme1 release];
	[minuteImage1Theme1 release];
	[minuteImage2Theme1 release];
	[secondImage1Theme1 release];
	[secondImage2Theme1 release];
	[playPauseButtonTheme1 release];
	[super dealloc];
}
@end
