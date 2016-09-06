//
//  CountdownTimer.h
//  timer
//
//  Created by Abhishek Kumar on 30/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>



@interface CountdownTimer : UIView {
	IBOutlet UILabel *label; 
//	NSTimer *myTimer;
	NSTimer *miliSecondTimer;
	UIButton *dButton;
	UIImageView *minuteImage1;
	UIImageView *minuteImage2;
	UIImageView *secondImage1;
	UIImageView *secondImage2;
	UIButton *playPauseButton;
//	int minutes;
//	int seconds;
	
	BOOL isSeconds;
	
	BOOL timerFlag;
    AVAudioPlayer *timeOverSoundPlayer;
}

@property (nonatomic, retain) NSTimer *myTimer;

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
