//
//  CountdownTimer_iPad.h
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface CountDownTimerTheme1_ipad : UIView {
	IBOutlet UILabel *labelTheme1;
	NSTimer *myTimerTheme1;
	NSTimer *miliSecondTimerTheme1;
	UIButton *dButtonTheme1;
	UIImageView *minuteImage1Theme1;
	UIImageView *minuteImage2Theme1;
	UIImageView *secondImage1Theme1;
	UIImageView *secondImage2Theme1;
	UIButton *playPauseButtonTheme1;
//	int minutesTheme1;
//	int secondsTheme1;
	
	BOOL isSecondsTheme1;
	
	BOOL timerFlagTheme1;
    AVAudioPlayer *timeOverSoundPlayerTheme1;
}
@property(nonatomic,assign)BOOL timerFlagTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *minuteImage1Theme1;
@property(nonatomic,retain)IBOutlet UIImageView *minuteImage2Theme1;
@property(nonatomic,retain)IBOutlet UIImageView *secondImage1Theme1;
@property(nonatomic,retain)IBOutlet UIImageView *secondImage2Theme1;
@property(nonatomic,retain)IBOutlet UIButton *playPauseButtonTheme1;


@property(nonatomic,retain)UIButton *dButtonTheme1;
@property(nonatomic, readwrite)int minutesTheme1;
@property(nonatomic, readwrite)int secondsTheme1;



- (void)timerFired;
-(void)settime:(int)min seconds:(int)sec;
-(void)setupImage:(UIImageView*)imgView :(int)digit;
-(void)setupMinutes:(int)score;
-(void)setupSeconds:(int)score;

-(IBAction)playPauseTimer:(UIButton*)button;
@end
