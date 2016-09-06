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
#import <RevMobAds/RevMobAds.h>
#import <RevMobAds/RevMobAdsDelegate.h>
#import "iCarousel.h"
#import "JDFlipNumberDigitView.h"
#import "Packet.h"
#import "Game.h"
#import "Theme3SettingsViewController_iPhone.h"


#import "JDFlipNumberView.h"
#import "JDFlipClockView.h"
#import "JDFlipImageView.h"
#import "JDDateCountdownFlipView.h"
#import "UIView+JDFlipImageView.h"

typedef enum
{
    GameStateWaitingForSignIn,
    GameStateWaitingForReady,
    GameStateDealing,
    GameStatePlaying,
    GameStateGameOver,
    GameStateQuitting,
}
GameState;

@class VollyballMainViewController_iphone;

@protocol VollyballMainViewControllerDelegate <NSObject>

- (void)gameViewController:(VollyballMainViewController_iphone *)controller didQuitWithReason:(QuitReason)reason;

@end

@interface VollyballMainViewController_iphone: UIViewController <iCarouselDataSource, iCarouselDelegate, UIActionSheetDelegate, UITextFieldDelegate, AVAudioPlayerDelegate, ADBannerViewDelegate, RevMobAdsDelegate, GameDelegate, VollyballMainSettingDelegate, UIWebViewDelegate>  {
    
    UIImageView *LeftShadow;
    UIImageView *RightShadow;
    UIView *LeftSideViewForTap;
    UIView *RightsideViewForTap;
    BOOL volleyballFirstTime;
    NSInteger frontAndBackButtonValue;
    UIView *StartingInstructionsView;
    UIView *bgfade;
    UIDevice  *thisDevice;
    BOOL isAvaiableThemeTap;
    
    
    UIView *SettingsVolleyball;
    
    UIView *Tutorial;
    UIImageView *Tutorailbackground;
    
    UIButton *CustomButtonForPeriod;
    
    UIButton *buttoninfo;
    
    //UIView *keyBrdDoneBtnView;
    ADBannerView *adView;
    UIImageView *Background;
    
    BOOL bannerIsVisible;
    UIScrollView *scroll;
    UIButton *backbutton;
    
    int PageNumber;
    
    BOOL VolleyBallViewBigger;
    BOOL DigitalViewBigger;
    BOOL Theme1Bigger;
    BOOL Theme2ViewBigger;
    BOOL Theme3ViewBigger;
    
    BOOL Theme1ViewBigger;
    
    int DigitalNumber;
    int Digitalcourtnumber;
    
    
    BOOL Theme2Bigger;
    UIButton * FacebookButton;
    UIButton * Twitter;
    UIButton *Instructions;
    UIButton *regulerSBButton;
    BOOL BiggerModeDigitalActivated;
    
    UIImageView *HomeBorder;
    UIImageView *GuestBorder;
    
    
    
    BOOL VolleyBallCourtChanged;
    BOOL DigitalScoreboardCourtChnage;
    BOOL Theme1CourtChange;
    BOOL Theme2CourtChange;
    BOOL Theme3CourtChange;
    UIImageView *HomeBorderDigital;
    UIImageView *GuestBorderDigital;
    
    
    
    UIImageView *DigitalscoreboardBackground;
    UIButton *DigitaltimerPlayandPauseButton;
    UIButton *DigitalresetButton;
    UIButton *DigitalsettingButton;
    
    
    
    
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
    UIView  *DigitalScoreBordNewTheme3;
    
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
    
    UIImageView *homeBackImageView;         //home back png
    UIImageView *guestBackImageView;        //guest back png
    
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
    
    UIImageView *HomeBackViewTheme1;
    UIImageView *GuestBackViewTheme1;
    
    UITextField *homeTextFieldTheme1;
    UITextField *guestTextFieldTheme1;
    UITextField *hiddenHomeTextFieldTheme1;
    UITextField *hiddenGuestTextFieldTheme1;
    
    UIScrollView *scrollViewTheme1;
    UIImageView *HomeBorderDigitalTheme1;
    UIImageView *GuestBorderDigitalTheme1;
    
    UIButton *timeSetButton;
    
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
    
    
    UIImageView *TwoDotsImagetheme1;
    
    
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
    
    UIImageView *HomeBackViewTheme2;
    UIImageView *GuestBackViewTheme2;
    
    UIButton *Theme2Reset;
    UIButton *Theme2Setting;
    
    
    UIScrollView *ScrollViewTheme2;
    
    int homeScoreFirstDigitTheme2;
    int guestScoreFirstDigitTheme2;
    
    
    UIButton *SmallButtonVolleyBall;
    UIButton *SmallButtonDigital;
    UIButton *SmallButtonTheme1;
    UIButton *SmallButtonTheme2;
    UIButton *SmallButtonTheme3;
    
    UIButton *backButton;
    UIButton *backVollayButton;
    
    ////////////////////////////// DigitalScoreboardNewtheme3     /////////////////////////////////////////
    UIImageView *DigitalScoreBoardBackGroundTheme3;
    int HomescoreIndexTheme3;
    int GuestScoreIndexTheme3;
    UITextField *homeTextFieldTheme3;
    UITextField *guestTextFieldTheme3;
    
    NSString *selectedImageViewNameTheme3;
    
    UIImageView *Theme3RightHomeImageView;
    UIImageView *Theme3LeftHomeImageview;
    
    JDFlipNumberDigitView* Flip3LeftHomeImageview;
    JDFlipNumberDigitView* Flip3RightHomeImageview;
    //    UIView* Flip3LeftHomeImageview;
    
    UIImageView *Theme3RightGuestImageView;
    UIImageView *Theme3LeftGuestImageview;
    
    UIImageView *HomeBorderDigitalTheme3;
    UIImageView *GuestBorderDigitalTheme3;
    
    UIImageView *HomeBackLeftViewTheme3;
    UIImageView *HomeBackRightViewTheme3;
    UIImageView *GuestBackLeftViewTheme3;
    UIImageView *GuestBackRightViewTheme3;
    
    UIButton *Theme3Reset;
    UIButton *Theme3Setting;
    
    UIScrollView *ScrollViewTheme3;
    
    int homeScoreFirstDigitTheme3;
    int guestScoreFirstDigitTheme3;
    //
    //
    //    UIButton *SmallButtonVolleyBall;
    //    UIButton *SmallButtonDigital;
    //    UIButton *SmallButtonTheme1;
    //    UIButton *SmallButtonTheme2;
    //
    //    UIButton *backButton;
    
    JDFlipNumberDigitView* JDFlipView;
    
    ///////////////////////////////////////////////////
    GKSession *_session;
    NSString *_serverPeerID;
    NSString *_localPlayerName;
    
    GameState _state;
    
    
    UIWebView *webView;
    
    float scoreboardWidthRate;
    float scoreboardHeightRate;
}

typedef NS_OPTIONS(NSUInteger, JDFlipAnimationState) {
    JDFlipAnimationStateFirstHalf,
    JDFlipAnimationStateSecondHalf
};

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


@property (nonatomic, retain) JDFlipImageView *guestLeftFlipView;
@property (nonatomic, retain) JDFlipImageView *guestRightFlipView;
@property (nonatomic, retain) JDFlipImageView *homeLeftFlipView;
@property (nonatomic, retain) JDFlipImageView *homeRightFlipView;


@property (nonatomic, retain) NSMutableArray *items;            //huodong
@property (nonatomic, readonly) BOOL wrap;                      //huodong
@property (nonatomic, retain) iCarousel *carousel;              //huodong
@property (nonatomic, assign) JDFlipAnimationState animationState;
@property (nonatomic, strong) NSArray *digitViews;
@property (nonatomic, assign) BOOL isServer;                    //bluetooth

@property (nonatomic, retain) id <VollyballMainViewControllerDelegate> delegate;



@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIImageView *flipImageView;
@property (nonatomic, strong) UIImageView *bottomImageView;

@property (nonatomic, assign) CGFloat animationDuration;


@property (nonatomic,assign) BOOL bannerIsVisible;


@property (nonatomic, retain) UIButton *m_pMainBluetoothButton;


- (IBAction)nextButtonClick:(id)sender;
- (IBAction)settingsButtonClick:(id)sender;
- (IBAction)resetButtonClick:(id)sender;
- (IBAction)doneButtonClick:(id)sender;

- (void)resetNames;
- (void)resetScore;
- (void)resetBoth;

- (void)playSound;





-(void)setAlignmentForLable:(UILabel *)aScoreLable withScore:(int)aScore;


-(void)frontHomeScoreLableInitialization;
-(void)frontGuestScoreLableInitialization;


-(void)hiddenFrontHomeScoreLableInitialization;
-(void)hiddenFrontGuestScoreLableInitialization;




///////////////////////////////////////////////Digital ScoreBoard//////////////////////////////////////////////////
@property (nonatomic, strong)RevMobFullscreen *fullscreen;

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


- (IBAction) backButtonClick:(id)sender;
- (IBAction) settingsButtonClick:(id)sender;
- (IBAction) resetButtonClick:(id)sender;
- (IBAction) doneButtonClick:(id)sender;
- (IBAction) timerPlayandPauseButtonClick:(id)sender;
- (void) resetNames;
- (void) resetScore;
- (void) resetBoth;

- (void) homeScoreChange;
- (void) guestScoreChange;



- (void) setupImage:(UIImageView*)imgView :(int)digit;

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

#pragma mark hans property
@property(nonatomic, readwrite) BOOL isControl;


#pragma mark hans method
@property(nonatomic, retain) Game *game;
- (IBAction) volleyBackButtonClick:(id)sender;
- (IBAction) settingsButtonClick:(id)sender;
- (IBAction) resetButtonClick:(id)sender;
- (IBAction) doneButtonClick:(id)sender;
- (IBAction) timerPlayandPauseButtonClick:(id)sender;

- (void) resetNamesTheme1;
- (void) resetScoreTheme1;
- (void) resetBothTheme1;

- (void) homeScoreChangeTheme1;
- (void) guestScoreChangeTheme1;



- (void)setupImageTheme1:(UIImageView*)imgView :(int)digit;


@end





