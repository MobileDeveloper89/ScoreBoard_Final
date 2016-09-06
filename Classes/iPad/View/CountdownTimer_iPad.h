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

@interface CountdownTimer_iPad : UIView {
	IBOutlet UILabel *label; 
	NSTimer *myTimer;
	NSTimer *miliSecondTimer;
	UIButton *dButton;
	UIImageView *minuteImage1;
	UIImageView *minuteImage2;
	UIImageView *secondImage1;
	UIImageView *secondImage2;
	UIButton *playPauseButton;
	int minutes;
	int seconds;
	
	BOOL isSeconds;
	
	BOOL timerFlag;
    AVAudioPlayer *timeOverSoundPlayer;
}
@property(nonatomic,assign)BOOL timerFlag;
@property(nonatomic,retain)IBOutlet UIImageView *minuteImage1;
@property(nonatomic,retain)IBOutlet UIImageView *minuteImage2;
@property(nonatomic,retain)IBOutlet UIImageView *secondImage1;
@property(nonatomic,retain)IBOutlet UIImageView *secondImage2;
@property(nonatomic,retain)IBOutlet UIButton *playPauseButton;


@property(nonatomic,retain)UIButton *dButton;
@property(nonatomic, readwrite)int minutes;
@property(nonatomic, readwrite)int seconds;



- (void)timerFired;
-(void)settime:(int)min seconds:(int)sec;
-(void)setupImage:(UIImageView*)imgView :(int)digit;
-(void)setupMinutes:(int)score;
-(void)setupSeconds:(int)score;

-(IBAction)playPauseTimer:(UIButton*)button;
@end
