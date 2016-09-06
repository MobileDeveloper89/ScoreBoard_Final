//
//  ScoreboardAppDelegate.h
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"FBConnect.h"
#import <AVFoundation/AVFoundation.h>
#import "VollyballMainViewController.h"
#import "VolleyBallViewControllerBigger.h"
#import "LargeSPTCSViewController.h"
#import "ScoreboardMainScreenI5ViewController.h"



@interface ScoreboardAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIImageView *splashView;
	UINavigationController *navController;
	Facebook *faceBook;
    
    AVAudioPlayer *timeOverSoundPlayer;
    
}

@property(nonatomic, readwrite) int scoreboardIndex;
@property(nonatomic, readwrite) int score_home;
@property(nonatomic, readwrite) int score_guest;

@property (nonatomic,retain)LargeSPTCSViewController *Vcontroller;

@property (nonatomic,retain) VollyballMainViewController *viewController;
//@property (nonatomic,retain) ScoreboardMainScreenI5ViewController *viewController;

@property(nonatomic,retain)Facebook *faceBook;
@property(nonatomic,retain)IBOutlet UINavigationController *navController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

