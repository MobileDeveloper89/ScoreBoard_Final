//
//  BasketballMainViewController.h
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountdownTimer;

@interface BasketballMainViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate> {
	
	
	UIView *keyBrdDoneBtnView;
	
    UIImageView *rightHomeImageView;
    UIImageView *leftHomeImageView;
	UIImageView *rightGuestImageView;
    UIImageView *leftGuestImageView;
	UIImageView *hiddenRightHomeImageView;
    UIImageView *hiddenLeftHomeImageView;
	UIImageView *hiddenRightGuestImageView;
    UIImageView *hiddenLeftGuestImageView;
    UIAlertView *alertView;
	
	UITextField *homeTextField;
	UITextField *guestTextField;
	UITextField *hiddenHomeTextField;
	UITextField *hiddenGuestTextField;
	
	UIScrollView *scrollView;
	
	CountdownTimer *countdownTimerView;
	
	int homeScoreIndex;
	int guestScoreIndex;
	
	int homeScoreFirstDigit;
	int guestScoreFirstDigit;
	
	NSString *selectedImageViewName;
	
}
@property(nonatomic,retain)NSString *selectedImageViewName;
@property(nonatomic,retain)IBOutlet UIView *keyBrdDoneBtnView;
@property(nonatomic,retain)IBOutlet UIImageView *rightHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *leftHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *rightGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *leftGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftGuestImageView;
@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain)IBOutlet CountdownTimer *countdownTimerView;
@property(nonatomic,retain)IBOutlet UITextField *hiddenHomeTextField;
@property(nonatomic,retain)IBOutlet UITextField *hiddenGuestTextField;
@property(nonatomic,retain)IBOutlet UITextField *homeTextField;
@property(nonatomic,retain)IBOutlet UITextField *guestTextField;
@property(nonatomic,retain)UIButton *timerPlayandPauseButton;
- (IBAction)backButtonClick:(id)sender;
- (IBAction)settingsButtonClick:(id)sender;
- (IBAction)resetButtonClick:(id)sender;
-(IBAction)doneButtonClick:(id)sender;
-(IBAction)timerPlayandPauseButtonClick:(id)sender;
-(void)resetNames;
-(void)resetScore;
-(void)resetBoth;

-(void)homeScoreChange;
-(void)guestScoreChange;


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)setupImage:(UIImageView*)imgView :(int)digit;
@end
