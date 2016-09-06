//
//  BasketballMainViewController_iPad.h
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountdownTimer_iPad;

@interface BasketballMainViewController_iPad : UIViewController<UIActionSheetDelegate,UITextFieldDelegate> {
	
	
	UIView *keyBrdDoneBtnView;
	
    UIImageView *rightHomeImageView;
    UIImageView *leftHomeImageView;
	UIImageView *rightGuestImageView;
    UIImageView *leftGuestImageView;
	UIImageView *hiddenRightHomeImageView;
    UIImageView *hiddenLeftHomeImageView;
	UIImageView *hiddenRightGuestImageView;
    UIImageView *hiddenLeftGuestImageView;
	
	UITextField *homeTextField;
	UITextField *guestTextField;
	UITextField *hiddenHomeTextField;
	UITextField *hiddenGuestTextField;
	
	UIScrollView *scrollView;
	
	CountdownTimer_iPad *countdownTimerView;
	
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
@property(nonatomic,retain)IBOutlet CountdownTimer_iPad  *countdownTimerView;
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



-(void)setupImage:(UIImageView*)imgView :(int)digit;

@end
