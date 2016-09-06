//
//  VollyballMainViewController.h
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "CountdownTimer_iPad.h"
#import "CountDownTimerTheme1_ipad.h"
#import <iAd/iAd.h>



@interface VollyballMainViewController_iPad: UIViewController <UIActionSheetDelegate,UITextFieldDelegate,AVAudioPlayerDelegate,ADBannerViewDelegate>  {
    UIButton *customPeriodImageView;
    UIView *LeftSideViewForTap;
    UIView *RightsideViewForTap;
    
    UIView *TutorialView;
    UIView *StartingInstructionsView;
    
    
    UIImageView *BackGround;
    
    UIImageView *LeftShadowImage;
    UIImageView *RightShadowImage;
    
	
	//UIView *keyBrdDoneBtnView;
    ADBannerView *adView;
    BOOL bannerIsVisible;

    int PageNumber;
    BOOL VolleyBallViewBigger;
    BOOL DigitalViewBigger;
    BOOL Theme1ViewBigger;
    BOOL Theme2ViewBigger;
    
    int DigitalNumber;
    int Digitalcourtnumber;
    
    
    BOOL Theme1Bigger;
    BOOL Theme2Bigger;
    UIButton * FacebookButton;
    UIButton * Twitter;
    UIButton *Instructions;
    UIButton *regulerSBButton;

    BOOL BiggerModeDigitalActivated;
    
    UIImageView *HomeBorder;
    UIImageView *GuestBorder;
    
    BOOL volleyballFirstTime;
    
    
    BOOL VolleyBallCourtChanged;
    BOOL DigitalScoreboardCourtChnage;
    BOOL Theme1CourtChange;
    BOOL Theme2CourtChange;
    UIImageView *HomeBorderDigital;
    UIImageView *GuestBorderDigital;
    
    
    BOOL DigitalBigger;
    
    UIImageView *DigitalscoreboardBackground;
    UIButton *DigitaltimerPlayandPauseButton;
    UIButton *DigitalresetButton;
    UIButton *DigitalsettingButton;
    
    
    
    
    int digitalnumber;
    
    
    UIImageView *VolleyBallBackGroundImageView;
    UIImageView *tutorialImageView;
    UIImageView *tutorialImageView1;
    UIImageView *tutorialImageView2;
    UIImageView *tutorialImageView3;
    UIImageView *tutorialImageView4;
    
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIView * VolleyBallView;
    
    UIScrollView *BackGroundScroll;
    UIView *VolleyBallScoreBoard;
    UIView *DigitalScoreboard;
    UIView *DigitalScoreboardNewtheme1;
    UIView  *DigitalScoreBordNewTheme2;
    UIImageView *DigitalScoreBoardBackGroundTheme1;
    
	UILabel *backHomeScoreLable;
	UILabel *frontHomeScoreLable;
	UILabel *backGuestScoreLable;
	UILabel *frontGuestScoreLable;
	
	UILabel *hiddenBackHomeScoreLable;
	UILabel *hiddenFrontHomeScoreLable;
	UILabel *hiddenBackGuestScoreLable;
	UILabel *hiddenFrontGuestScoreLable;
    
	UILabel *preiodLabel;
	
	NSString *guestLableImageName;
	NSString *homeLableImageName;
	NSString *suspendedLableName;
	
	
	NSString *homeLableText;
	NSString *guestLableText;
	
	UITextField *homeTextField;
	UITextField *guestTextField;
	UITextField *hiddenHomeTextField;
	UITextField *hiddenGuestTextField;
    
	UIScrollView *scrollView;
    
    UIScrollView *BackgroundScrollView;
    
	
	int periodIndex;
	int frontHomeLableScore;
	int backHomeLableScore;
	int frontGuestLableScore;
	int backGuestLableScore;
	int presentHomeScore;
	int presentGuestScore;
    
    
	int presentScore;
    
	AVAudioPlayer *myAudio;
	NSString *presentLable;
    NSString *frontHomeLableName;
    NSString *frontGuestLableName;
	
    UIView *subview;
    
	BOOL upSwipe;
	BOOL frontLableSwipe;
	BOOL homeScoreChanged;
	BOOL guestScoreChanged;
    
    
    BOOL VolleyballCourtchange;
    
    UIImageView *bgl;
    
    
    
    /////////////////////////////////////////////////// Digital ScoreBoard///////////////////////////////////////////////
    UIView *keyBrdDoneBtnView;
	
    UIImageView *rightHomeImageView;
    UIImageView *leftHomeImageView;
	UIImageView *rightGuestImageView;
    UIImageView *leftGuestImageView;
	UIImageView *hiddenRightHomeImageView;
    UIImageView *hiddenLeftHomeImageView;
	UIImageView *hiddenRightGuestImageView;
    UIImageView *hiddenLeftGuestImageView;
    
    
    UIImageView *hiddenlefetHome;
    UIImageView *hiddenrightHome;
    
	
	UITextField *homeTextFieldDigital;
	UITextField *guestTextFieldDigital;
	UITextField *hiddenHomeTextFieldDigital;
	UITextField *hiddenGuestTextFieldDigital;
	
	UIScrollView *scrollViewDigital;
	
	CountdownTimer_iPad *countdownTimerView;
	
	int homeScoreIndex;
	int guestScoreIndex;
	
	int homeScoreFirstDigit;
	int guestScoreFirstDigit;
	
	NSString *selectedImageViewName;
    
    
    UIImageView *tutorialImageViewTheme1;
    UIImageView *tutorialImageViewTheme11;
    UIImageView *tutorialImageViewTheme12;
    UIImageView *tutorialImageViewTheme13;
    UIImageView *tutorialImageViewTheme14;
    
    ///////////////////////////////////////////Digital scorbaord NewTheme1//////////////////////////////////////////
    UIButton *Theme1PlayPauseButton;
    CountDownTimerTheme1_ipad *countdownTimerViewTheme1;
    UIImageView *rightHomeImageViewTheme1;
    UIImageView *leftHomeImageViewTheme1;
	UIImageView *rightGuestImageViewTheme1;
    UIImageView *leftGuestImageViewTheme1;
	UIImageView *hiddenRightHomeImageViewTheme1;
    UIImageView *hiddenLeftHomeImageViewTheme1;
	UIImageView *hiddenRightGuestImageViewTheme1;
    UIImageView *hiddenLeftGuestImageViewTheme1;
	
	UITextField *homeTextFieldTheme1;
	UITextField *guestTextFieldTheme1;
	UITextField *hiddenHomeTextFieldTheme1;
	UITextField *hiddenGuestTextFieldTheme1;
	
	UIScrollView *scrollViewTheme1;
    UIImageView *HomeBorderDigitalTheme1;
	UIImageView *GuestBorderDigitalTheme1;
    
    
    UIButton *resetButtonTheme1;
    UIButton *settingButtonTheme1;
    
    
    int PeriodButtonNumber;
    
	UIButton *Periodbutton;
    UIButton *PeriodButton1;
    UIButton *PeriodButton2;
    UIButton *PeriodButton3;
    
    
	int homeScoreIndexTheme1;
	int guestScoreIndexTheme1;
	
	int homeScoreFirstDigitTheme1;
	int guestScoreFirstDigitTheme1;
	
	NSString *selectedImageViewNameTheme1;
    
    UIImageView *TwodotsTheme1;
    
    
    ////////////////////////////// DigitalScoreboardNewtheme2     /////////////////////////////////////////
    UIImageView *DigitalScoreBoardBackGroundTheme2;
    int HomescoreIndexTheme2;
    int GuestScoreIndexTheme2;
    UITextField *homeTextFieldTheme2;
	UITextField *guestTextFieldTheme2;
    
    NSString *selectedImageViewNameTheme2;
    
    UIImageView *Theme2RightHomeImageView;
    UIImageView *Theme2LeftHomeImageview;
    
    UIImageView *Theme2RightGuestImageView;
    UIImageView *Theme2LeftGuestImageview;
    
    UIImageView *HomeBorderDigitalTheme2;
    UIImageView *GuestBorderDigitalTheme2;
    
    UIButton *Theme2Reset;
    UIButton *Theme2Setting;
    
    UIScrollView *ScrollViewTheme2;
    
    int homeScoreFirstDigitTheme2;
	int guestScoreFirstDigitTheme2;
    UIToolbar *toolbar;
    
    
    
    
    UIButton *smallScoreBoardbutton;
    UIButton *smallScoreBoardbuttonDigital;
    UIButton *smallScoreBoardbuttonDigitalTheme1;
    UIButton *smallScoreBoardbuttonDigitalTheme2;
    

    
    
    UITapGestureRecognizer *VolleyBallTap;
    
}

@property (nonatomic,assign) BOOL bannerIsVisible;



@property(nonatomic,retain)NSString *suspendedLableName;
//
@property(nonatomic,retain)IBOutlet UIView *keyBrdDoneBtnView;
@property(nonatomic,retain)NSString *frontHomeLableName;
@property(nonatomic,retain)NSString *frontGuestLableName;
@property(nonatomic,retain)UILabel *hiddenBackHomeScoreLable;
@property(nonatomic,retain)UILabel *hiddenFrontHomeScoreLable;
@property(nonatomic,retain)UILabel *hiddenBackGuestScoreLable;
@property(nonatomic,retain)UILabel *hiddenFrontGuestScoreLable;
@property(nonatomic,retain)IBOutlet UITextField *hiddenHomeTextField;
@property(nonatomic,retain)IBOutlet UITextField *hiddenGuestTextField;
@property(nonatomic,retain)NSString *guestLableImageName;
@property(nonatomic,retain)NSString *homeLableImageName;
@property(nonatomic,assign)BOOL upSwipe;
@property(nonatomic,retain)NSString *presentLable;
@property(nonatomic,retain)UILabel *backHomeScoreLable;
@property(nonatomic,retain)UILabel *frontHomeScoreLable;
@property(nonatomic,retain)UILabel *backGuestScoreLable;
@property(nonatomic,retain)UILabel *frontGuestScoreLable;
@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain)IBOutlet UILabel *preiodLabel;
@property(nonatomic,retain)IBOutlet UITextField *homeTextField;
@property(nonatomic,retain)IBOutlet UITextField *guestTextField;



- (IBAction)nextButtonClick:(id)sender;
- (IBAction)settingsButtonClick:(id)sender;
- (IBAction)resetButtonClick:(id)sender;
-(IBAction)doneButtonClick:(id)sender;

-(void)resetNames;
-(void)resetScore;
-(void)resetBoth;

-(void)playSound;





-(void)setAlignmentForLable:(UILabel *)aScoreLable withScore:(int)aScore;


-(void)frontHomeScoreLableInitialization;
-(void)frontGuestScoreLableInitialization;


-(void)hiddenFrontHomeScoreLableInitialization;
-(void)hiddenFrontGuestScoreLableInitialization;




///////////////////////////////////////////////Digital ScoreBoard//////////////////////////////////////////////////
@property(nonatomic,retain)NSString *selectedImageViewName;
@property(nonatomic,retain)IBOutlet UIImageView *rightHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *leftHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *rightGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *leftGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftHomeImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightGuestImageView;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftGuestImageView;
@property(nonatomic,retain)IBOutlet UIScrollView *scr;
@property(nonatomic,retain)IBOutlet CountdownTimer_iPad  *countdownTimerView;
@property(nonatomic,retain)IBOutlet UITextField *hiddenHomeTextFieldDigital;
@property(nonatomic,retain)IBOutlet UITextField *hiddenGuestTextFieldDigital;
@property(nonatomic,retain)IBOutlet UITextField *homeTextFieldDigital;
@property(nonatomic,retain)IBOutlet UITextField *guestTextFieldDigital;
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

//////////////////////////////////////////////DigitalscoreBoard Theme1 .////////////////////////////////////////////
@property(nonatomic,retain)NSString *selectedImageViewNameTheme1;

@property(nonatomic,retain)IBOutlet UIView *keyBrdDoneBtnViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *rightHomeImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *leftHomeImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *rightGuestImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *leftGuestImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightHomeImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftHomeImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenRightGuestImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIImageView *hiddenLeftGuestImageViewTheme1;
@property(nonatomic,retain)IBOutlet UIScrollView *scrollViewTheme1;
@property(nonatomic,retain)IBOutlet UITextField *hiddenHomeTextFieldTheme1;
@property(nonatomic,retain)IBOutlet UITextField *hiddenGuestTextFieldTheme1;
@property(nonatomic,retain)IBOutlet UITextField *homeTextFieldTheme1;
@property(nonatomic,retain)IBOutlet UITextField *guestTextFieldTheme1;
@property(nonatomic,retain)UIButton *timerPlayandPauseButtonTheme1;
- (IBAction)backButtonClick:(id)sender;
- (IBAction)settingsButtonClick:(id)sender;
- (IBAction)resetButtonClick:(id)sender;
-(IBAction)doneButtonClick:(id)sender;
-(IBAction)timerPlayandPauseButtonClick:(id)sender;
-(void)resetNamesTheme1;
-(void)resetScoreTheme1;
-(void)resetBothTheme1;

-(void)homeScoreChangeTheme1;
-(void)guestScoreChangeTheme1;



-(void)setupImageTheme1:(UIImageView*)imgView :(int)digit;




@end
