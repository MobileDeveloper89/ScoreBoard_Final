//
//  VollyballMainViewController.m
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VolleyBallViewControllerBigger.h"
//#import "BasketballMainViewController.h"
#import "BasketballSettingsViewController.h"
#import "VolleyballSettingsViewControllerBigger.h"
#import "TutorialViewController.h"
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioServices.h>
#import "Theme1SettingsViewController.h"
#import "CountdownTimerTheme1_iPad.h"
#import "Theme2SettingsViewcontroller.h"
#import "Theme2SettingsViewController_iPhone.h"
#import "Theme1SettingViewController_iPhone.h"
#import "BasketballMainViewControllerBigger.h"
#import "Theme1SettingsViewControllerBigger.h"
#import "Theme2settingsViewControllerBigger.h"



#define ACTION_SHEET_TAG 1000

#define GUESTSCORE_LABLE_XPOSITION 188
#define GUESTSCORE_LABLE_YPOSITION -60
#define GUESTSCORE_LABLE_WIDTH 135
#define GUESTSCORE_LABLE_HEIGHT 175


#define HIDDEN_GUESTSCORE_LABLE_XPOSITION 1174

#define HOMESCORE_LABLE_XPOSITION 372
#define HOMESCORE_LABLE_YPOSITION -60
#define HOMESCORE_LABLE_WIDTH 135
#define HOMESCORE_LABLE_HEIGHT 175
#define MOVE_RANGE 250

#define HIDDEN_HOMESCORE_LABLE_XPOSITION 10
#define LABLE_FONTSIZE 130




@implementation VolleyBallViewControllerBigger
@synthesize preiodLabel;
@synthesize scrollView;
//keyBrdDoneBtnView;
@synthesize backHomeScoreLable,frontHomeScoreLable,backGuestScoreLable,frontGuestScoreLable,suspendedLableName;
@synthesize presentLable,frontHomeLableName,frontGuestLableName;
@synthesize upSwipe;
@synthesize guestLableImageName,homeLableImageName;
@synthesize hiddenHomeTextField,hiddenGuestTextField,homeTextField,guestTextField;
@synthesize hiddenBackHomeScoreLable,hiddenFrontHomeScoreLable,hiddenBackGuestScoreLable,hiddenFrontGuestScoreLable;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view sendSubviewToBack:Background];
    
    //Your code here
    homeLableImageName=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
	guestLableImageName=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
	
    homeLableText=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeLableText"];
	guestLableText=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestLableText"];
    
    frontHomeLableName = @"frontHomeScoreLable";
    frontGuestLableName = @"frontGuestScoreLable";
    
	if (volleyballFirstTime==NO) {
        
        if (homeTextField!=nil) {
            [homeTextField  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:homeLableText]]];
        }
        if (guestTextField!=nil) {
            [guestTextField  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:guestLableText]]];
        }
        
        if (backHomeScoreLable!=nil) {
            
            [backHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:homeLableImageName]]];
        }
        if (frontHomeScoreLable!=nil) {
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:homeLableImageName]]];
        }
        if (backGuestScoreLable!=nil) {
            [backGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:guestLableImageName]]];
        }
        if (frontGuestScoreLable!=nil) {
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:guestLableImageName]]];
        }
        if (hiddenBackHomeScoreLable!=nil) {
            [hiddenBackHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:homeLableImageName]]];
        }
        if (hiddenFrontHomeScoreLable!=nil) {
            [hiddenFrontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:homeLableImageName]]];
        }
        if (hiddenBackGuestScoreLable!=nil) {
            [hiddenBackGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:guestLableImageName]]];
        }
        if (hiddenFrontGuestScoreLable!=nil) {
            [hiddenFrontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:guestLableImageName]]];
        }
         NSLog(@"the color is %s",[guestLableImageName UTF8String]);
    }
    else{
        NSString *homeLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
        
        
        if (homeLableImageName1==@"red5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"blue5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5.jpg"]]];    }
        else if (homeLableImageName1==@"orange5.jpg") {
            
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orange5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"green5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"grey5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"grey5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"pink5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pink5.jpg"]]];
        }
        else if (homeLableImageName1==@"purple5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purple5.jpg"]]];
            
        }
        
        else if (homeLableImageName1==@"yellow5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow5.jpg"]]];
            
            
        }
        else if (homeLableImageName1==@"black5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"black5.jpg"]]];
        }
        else if (homeLableImageName1==@"sky5.jpg") {
            
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sky5.jpg"]]];
        }
        
        
        
        
        NSString *guestLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
        
        if (guestLableImageName1==@"red5.jpg") {
            
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"blue5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5.jpg"]]];
        }
        else if (guestLableImageName==@"orange5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orange5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"green5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"grey5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"grey5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"pink5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pink5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"purple5.jpg") {
            
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purple5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"yellow5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow5.jpg"]]];
            
        }
        
        else if (guestLableImageName1==@"black5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"black5.jpg"]]];
            
            
        }
        
        else if (guestLableImageName1==@"sky5.jpg") {
            NSLog(@"the problem is here");
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sky5.jpg"]]];
            
        }
       
        
        
    }
    volleyballFirstTime=NO;
    NSLog(@"View will appear");
	
    if (countdownTimerView!=nil) {
		
		countdownTimerView.timerFlag= YES;
        int mins=[[NSUserDefaults standardUserDefaults]integerForKey:@"minutes"];
        int secs=[[NSUserDefaults standardUserDefaults]integerForKey:@"seconds"];
        
		[countdownTimerView settime:mins seconds:secs];
		
	}
    else{
        countdownTimerView.timerFlag=NO;
        
    }
    if (countdownTimerViewTheme1!=nil) {
		
		countdownTimerViewTheme1.timerFlagTheme1= YES;
        int mins=[[NSUserDefaults standardUserDefaults]integerForKey:@"minutesTheme1"];
        int secs=[[NSUserDefaults standardUserDefaults]integerForKey:@"secondsTheme1"];
        
		[countdownTimerViewTheme1 settime:mins seconds:secs];
		
	}
    else{
        countdownTimerViewTheme1.timerFlagTheme1=NO;
        
    }
    
    
    
    [self ChangeColor];
    [self Theme1ColorChange];
    [self Theme2ColorChange];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.view bringSubviewToFront:adView];
    
    [self.view bringSubviewToFront:toolbar];
    [toolbar setHidden:YES];
    [self.view bringSubviewToFront:smallScoreBoardbuttonDigitalTheme2];
    [self.view bringSubviewToFront:smallScoreBoardbuttonDigitalTheme1];
    [self.view bringSubviewToFront:smallScoreBoardbuttonDigital];
    [self.view bringSubviewToFront:smallScoreBoardbutton];
    
    [self.view bringSubviewToFront:leftShadow];
    [self.view bringSubviewToFront:RightShadow];
    [self.view bringSubviewToFront:Tutorial];
    [self.view bringSubviewToFront:adView];
    
    [self.view bringSubviewToFront:LeftSideViewForTap];
    [self.view bringSubviewToFront:RightsideViewForTap];
    if (self.bannerIsVisible) {
        [smallScoreBoardbutton setFrame:CGRectMake(502,255, 65, 35)];
        [smallScoreBoardbuttonDigital setFrame:CGRectMake(252,255, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme1 setFrame:CGRectMake(252, 255, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme2 setFrame:CGRectMake(252, 255, 65, 35)];

    }
    else{
        [smallScoreBoardbutton setFrame:CGRectMake(502,285, 65, 35)];
        [smallScoreBoardbuttonDigital setFrame:CGRectMake(252,285, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme1 setFrame:CGRectMake(252, 285, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme2 setFrame:CGRectMake(252, 285, 65, 35)];

    }
    
    
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectMake(0, 288, 568, 32);
        [smallScoreBoardbutton setFrame:CGRectMake(502,255, 65, 35)];
        [smallScoreBoardbuttonDigital setFrame:CGRectMake(252,255, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme1 setFrame:CGRectMake(252, 255, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme2 setFrame:CGRectMake(252, 255, 65, 35)];


        [UIView commitAnimations];
        self.bannerIsVisible = YES;
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectMake(0, 328, 568, 32);
        [smallScoreBoardbutton setFrame:CGRectMake(502,285, 65, 35)];
        [smallScoreBoardbuttonDigital setFrame:CGRectMake(252,285, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme1 setFrame:CGRectMake(252, 285, 65, 35)];
        [smallScoreBoardbuttonDigitalTheme2 setFrame:CGRectMake(252, 285, 65, 35)];
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(IBAction)tutorialButtonBackClick:(id)sender{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [Tutorial setFrame:CGRectMake(0, 340, 568, 320)];
    [UIView commitAnimations];
    
}
- (IBAction)Dismiss:(id)sender {
    
    [StartingInstructionsView removeFromSuperview];
    
}

#pragma mark Fullscreen








// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//    int FirstTime=[[NSUserDefaults standardUserDefaults]integerForKey:@"StartingInstructions"];
//    
//    if (FirstTime==1) {
//        
//        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"StartingInstructions"];
//    StartingInstructionsView=[[UIView alloc]initWithFrame:CGRectMake(0,0, 568, 320)];
//    [self.view addSubview:StartingInstructionsView];
//    UIImageView*BackGroundForStartingView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 568, 320)];
//   [ BackGroundForStartingView setImage:[UIImage imageNamed:@"beginningImage.png"]];
//    [StartingInstructionsView addSubview:BackGroundForStartingView];
//    
//    UIImage * DismissImage = [UIImage imageNamed:@"dismiss.png"];
//    UIButton *DismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    DismissButton.frame = CGRectMake(331,228, 184, 55);
//    [DismissButton addTarget:self action:@selector(Dismiss:)
//            forControlEvents:UIControlEventTouchUpInside];
//    [DismissButton setImage:DismissImage forState:UIControlStateNormal];
//    [StartingInstructionsView addSubview:DismissButton];
//    }
    
//    _carousel.type = iCarouselTypeCylinder;         //huo 20140501
    
//    modify by huo
    Tutorial=[[UIView alloc]initWithFrame:CGRectMake(0, 340, 568, 320)];
    [self.view addSubview:Tutorial];
    TutorialBackground=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 568, 320)];
    [Tutorial addSubview:TutorialBackground];
    
    
    [TutorialBackground setImage:[UIImage imageNamed:@"TutorialVlyBall.jpg"]];
    
    
    UITapGestureRecognizer *tutorialTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tutorialButtonBackClick:)];
    [tutorialTap setNumberOfTapsRequired:1];
    [tutorialTap setNumberOfTouchesRequired:1];
    [Tutorial addGestureRecognizer:tutorialTap];
    Background=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iPhone5-background.jpg"]];
    [Background setFrame:CGRectMake(0, 0, 568, 320)];
    [self.view addSubview:Background];
    
    
    toolbar = [UIToolbar new];
    
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    
    // create a bordered style button with custom title
    
    UIBarButtonItem *playItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                  
                                                                  style:UIBarButtonItemStyleBordered
                                  
                                                                 target:self
                                  
                                                                action:@selector(doneButtonClick:)];
    
    
   
    UIBarButtonItem *BtnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray *items = [NSArray arrayWithObjects:BtnSpace,playItem,nil];
    
    toolbar.items = items;
    
    
    [toolbar sizeToFit];
    [toolbar setBackgroundColor:[UIColor blackColor]];
    
    
    CGFloat toolbarHeight = [toolbar frame].size.height;
    NSLog(@"the tool bar height is %f",toolbarHeight);
    
    
    CGRect mainViewBounds = self.view.bounds;
    
    [toolbar setFrame:CGRectMake(CGRectGetMinX(mainViewBounds),
                                 
                                 CGRectGetMinY(mainViewBounds) + CGRectGetHeight(mainViewBounds) - (toolbarHeight)+17.9,
                                 
                                 CGRectGetWidth(mainViewBounds),
                                 
                                 toolbarHeight+10)];
    
   // [self.view addSubview:toolbar];
    
    
    
    adView.requiredContentSizeIdentifiers = [NSSet setWithObjects:ADBannerContentSizeIdentifierLandscape,nil];
    
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame =CGRectMake(0, 328, 568, 50);
    //adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
    //[adView setHidden:YES];
    
    
    BiggerModeDigitalActivated=NO;
    PageNumber=1;
    VolleyBallViewBigger=NO;
    DigitalViewBigger=NO;
    Theme1Bigger=NO;
    Theme2ViewBigger=NO;
    
    
    
    Theme2Bigger=NO;
    
    
    guestScoreIndex=0;
    guestScoreIndexTheme1=0;
    GuestScoreIndexTheme2=0;
    
    homeScoreFirstDigit=0;
    homeScoreFirstDigitTheme1=0;
    homeScoreFirstDigitTheme2=0;
    
    
    
    VolleyBallCourtChanged=NO;
    DigitalScoreboardCourtChnage=NO;
    Theme1CourtChange=NO;
    Theme2CourtChange=NO;
    
    
//    UIImageView *Frame=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iphone5-sizes.png"]];
//    [Frame setFrame:CGRectMake(0, 0, 568, 320)];
//    [self.view addSubview:Frame];

    ///////////////////////////////////////////// main scroll////////////////////////////////////////////////////////////////////////
    BackGroundScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(-20, 0,1740,370)];
    BackGroundScroll.contentSize = CGSizeMake(480,320);
    BackGroundScroll.backgroundColor=[UIColor clearColor];
    BackGroundScroll.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:BackGroundScroll];
    //   [BackGroundScroll setCenter:CGPointMake(500, BackGroundScroll.center.y)];
    
    
    VolleyBallView=[[UIView alloc] initWithFrame: CGRectMake(136, 80,336,189)];
    VolleyBallView.backgroundColor=[UIColor clearColor];
    [BackGroundScroll addSubview:VolleyBallView];
    
    
    DigitalScoreboard=[[UIView alloc] initWithFrame: CGRectMake(508, 80,335,189)];
    DigitalScoreboard.backgroundColor=[UIColor clearColor];
    [BackGroundScroll addSubview:DigitalScoreboard];
    
    DigitalScoreboardNewtheme1=[[UIView alloc] initWithFrame: CGRectMake(880, 80,335,189)];
    DigitalScoreboardNewtheme1.backgroundColor=[UIColor clearColor];
    [BackGroundScroll addSubview:DigitalScoreboardNewtheme1];
    //
    DigitalScoreBordNewTheme2=[[UIView alloc] initWithFrame: CGRectMake(1252.24, 80,335,189)];
    DigitalScoreBordNewTheme2.backgroundColor=[UIColor clearColor];
    [BackGroundScroll addSubview:DigitalScoreBordNewTheme2];
    
	// Do any additional setup after loading the view.
    [VolleyBallView setUserInteractionEnabled:YES];
    [DigitalScoreboard setUserInteractionEnabled:NO];
    [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
    [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
    
    leftShadow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ipad-ShadowLeft.png"]];
    [leftShadow setFrame:CGRectMake(0, 0, 105, 320)];
    [self.view addSubview:leftShadow];
    
    RightShadow=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ipad-ShadowRight.png"]];
    [RightShadow setFrame:CGRectMake(463, 0, 105, 320)];
    [self.view addSubview:RightShadow];
    
    LeftSideViewForTap=[[UIView alloc]initWithFrame:CGRectMake(0, 80, 80, 189)];
    [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:LeftSideViewForTap];
    RightsideViewForTap=[[UIView alloc]initWithFrame:CGRectMake(489, 80, 100, 189)];
    [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:RightsideViewForTap];
    [LeftSideViewForTap setBackgroundColor:[UIColor blackColor]];
    [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];

    UITapGestureRecognizer *LeftViewtap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveMainScrollViewRight)];
    [LeftViewtap setNumberOfTapsRequired:1];
    [LeftViewtap setNumberOfTouchesRequired:1];
    [LeftSideViewForTap addGestureRecognizer:LeftViewtap];
    
    UITapGestureRecognizer *RightViewtap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveMainScrollViewLeft)];
    [RightViewtap setNumberOfTapsRequired:1];
    [RightViewtap setNumberOfTouchesRequired:1];
    [RightsideViewForTap addGestureRecognizer:RightViewtap];
    
    
    
    UISwipeGestureRecognizer *leftSwipeUpMain = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveMainScrollViewLeft)] autorelease];
	leftSwipeUpMain.direction = UISwipeGestureRecognizerDirectionLeft;
	[BackGroundScroll addGestureRecognizer:leftSwipeUpMain];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDownMain = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveMainScrollViewRight)] autorelease];
	rightSwipeDownMain.direction = UISwipeGestureRecognizerDirectionRight;
	[BackGroundScroll addGestureRecognizer:rightSwipeDownMain];
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    CGRect DigitalBackGround = CGRectMake(0, 0,DigitalScoreboard.frame.size.width,DigitalScoreboard.frame.size.height);
    DigitalscoreboardBackground = [[UIImageView alloc]initWithFrame:DigitalBackGround];
    [DigitalscoreboardBackground setImage:[UIImage imageNamed:@"dotBackgroundadd-5.jpg"]];
    [DigitalScoreboard addSubview:DigitalscoreboardBackground];
    
    CGRect DigitalScoreBoardTheme1=CGRectMake(0, 0,DigitalScoreboardNewtheme1.frame.size.width,DigitalScoreboardNewtheme1.frame.size.height);
    DigitalScoreBoardBackGroundTheme1=[[UIImageView alloc]initWithFrame:DigitalScoreBoardTheme1];
    [DigitalScoreBoardBackGroundTheme1 setImage:[UIImage imageNamed:@"DigitalBackgroundadd-5.jpg"]];
    [DigitalScoreboardNewtheme1 addSubview:DigitalScoreBoardBackGroundTheme1];
    
    
    CGRect DigitalScoreBoardTheme2=CGRectMake(0, 0,DigitalScoreBordNewTheme2.frame.size.width,DigitalScoreBordNewTheme2.frame.size.height);
    DigitalScoreBoardBackGroundTheme2=[[UIImageView alloc]initWithFrame:DigitalScoreBoardTheme2];
    [DigitalScoreBoardBackGroundTheme2 setImage:[UIImage imageNamed:@"SquareBackground-5.jpg"]];
    [DigitalScoreBordNewTheme2 addSubview:DigitalScoreBoardBackGroundTheme2];
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //    BackgroundScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(-100, 0, 4005, 768)];
    //    BackgroundScrollView.contentSize=CGSizeMake(4000, 768);
    //    BackgroundScrollView.backgroundColor=[UIColor orangeColor];
    //    BackgroundScrollView.showsHorizontalScrollIndicator = YES;
    //    [self.view addSubview:BackgroundScrollView];
    
    
    
    
    
    
    CGRect Boders = CGRectMake(201.5,147.5, 120, 19);
    HomeBorder = [[UIImageView alloc]initWithFrame:Boders];
    [HomeBorder setImage:[UIImage imageNamed:@"VballLabels.png"]];
    [VolleyBallView addSubview:HomeBorder];
    
    CGRect GuestBorderImage = CGRectMake(16.5, 147.5, 121, 19);
    GuestBorder = [[UIImageView alloc]initWithFrame:GuestBorderImage];
    [GuestBorder setImage:[UIImage imageNamed:@"VballLabels.png"]];
    [VolleyBallView addSubview:GuestBorder];
    
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(-250, 0,1040,250)];
    scrollView.contentSize = CGSizeMake(480,320);
    scrollView.backgroundColor=[UIColor clearColor];
    scrollView.showsHorizontalScrollIndicator = YES;
    [VolleyBallView addSubview:scrollView];
    [scrollView setUserInteractionEnabled:NO];
    
    //[scrollView setHidden:YES];
    
    
    //[scrollView setHidden:YES];
    
    preiodLabel = [[[UILabel alloc] initWithFrame:CGRectMake(158,1, 20, 48)]autorelease];
    preiodLabel.backgroundColor = [UIColor darkGrayColor];
    preiodLabel.text = @"1 ";
    preiodLabel.textAlignment=UITextAlignmentLeft;
    preiodLabel.textColor=[UIColor orangeColor];
    preiodLabel.userInteractionEnabled=YES;
    [preiodLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35.0]];
    [VolleyBallView addSubview:preiodLabel];
    
    
    CGRect myImageRect = CGRectMake( 0, 0,VolleyBallView.frame.size.width, VolleyBallView.frame.size.height);
    VolleyBallBackGroundImageView = [[UIImageView alloc]initWithFrame:myImageRect];
    [VolleyBallBackGroundImageView setImage:[UIImage imageNamed:@"VballBackgroundadds-5.jpg"]];
    [VolleyBallView addSubview:VolleyBallBackGroundImageView];
    
    homeTextField = [[UITextField alloc] initWithFrame:CGRectMake(201.5,147.5, 120, 19)];
    //homeTextField.borderStyle = UITextBorderStyleBezel;
    homeTextField.textColor = [UIColor blackColor];
    homeTextField.font = [UIFont systemFontOfSize:15];
    homeTextField.text = @"Home";  //place holder
    homeTextField.textAlignment=UITextAlignmentCenter;
    homeTextField.backgroundColor = [UIColor clearColor];
    homeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    homeTextField.keyboardType = UIKeyboardTypeDefault;
    homeTextField.returnKeyType = UIReturnKeyDone;
    homeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [VolleyBallView addSubview:homeTextField];
    
    
    guestTextField = [[UITextField alloc] initWithFrame:CGRectMake(16.5, 147.5, 118, 19)];
    //guestTextField.borderStyle = UITextBorderStyleBezel;
    guestTextField.textColor = [UIColor blackColor];
    guestTextField.font = [UIFont systemFontOfSize:15 ];
    
    guestTextField.text = @"Guest";  //place holder
    guestTextField.textAlignment=UITextAlignmentCenter;
    guestTextField.backgroundColor = [UIColor clearColor];
    guestTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    guestTextField.keyboardType = UIKeyboardTypeDefault;
    guestTextField.returnKeyType = UIReturnKeyDone;
    guestTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [VolleyBallView addSubview:guestTextField];
    
    hiddenHomeTextField = [[UITextField alloc] initWithFrame:CGRectMake(87, 215, 127, 17)];
    
    hiddenHomeTextField.borderStyle = UITextBorderStyleBezel;
    hiddenHomeTextField.textColor = [UIColor blackColor];
    hiddenHomeTextField.font = [UIFont systemFontOfSize:17];
    hiddenHomeTextField.placeholder = @"Home";  //place holder
    hiddenHomeTextField.textAlignment=UITextAlignmentCenter;
    hiddenHomeTextField.backgroundColor = [UIColor clearColor];
    hiddenHomeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    hiddenHomeTextField.keyboardType = UIKeyboardTypeDefault;
    hiddenHomeTextField.returnKeyType = UIReturnKeyDone;
    hiddenHomeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [scrollView addSubview:hiddenHomeTextField];
    [hiddenHomeTextField setHidden:YES];
    
    
    hiddenGuestTextField = [[UITextField alloc] initWithFrame:CGRectMake(640, 200, 130, 17)];
    hiddenGuestTextField.borderStyle = UITextBorderStyleBezel;
    hiddenGuestTextField.textColor = [UIColor whiteColor];
    hiddenGuestTextField.font = [UIFont systemFontOfSize:17];
    hiddenGuestTextField.placeholder = @"Guest";  //place holder
    hiddenGuestTextField.textAlignment=UITextAlignmentCenter;
    hiddenGuestTextField.backgroundColor = [UIColor clearColor];
    hiddenGuestTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    hiddenGuestTextField.keyboardType = UIKeyboardTypeDefault;
    hiddenGuestTextField.returnKeyType = UIReturnKeyDone;
    hiddenGuestTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [scrollView addSubview:hiddenGuestTextField];
    [hiddenGuestTextField setHidden:YES];
    
    
    UIImage * backImage = [UIImage imageNamed:@"RoundBackBtn2.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(460, 300, 100, 100);
    [backButton addTarget:self action:@selector(backButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:backImage forState:UIControlStateNormal];
    //[scrollView addSubview:backButton];
    // [self.view addSubview: backButton];
    
    
    
    
    
    UIImage * btnImage1 = [UIImage imageNamed:@"Vball-reset.png"];
    
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(152, 100, 30, 30);
    [button2 setImage:btnImage1 forState:UIControlStateNormal];
    [button2 addTarget:self
                action:@selector(resetButtonClick:)
      forControlEvents:UIControlEventTouchDown];
    [VolleyBallView addSubview:button2];
    
    
    
    
    UIImage * btnImage2 = [UIImage imageNamed:@"Vball-settings.png"];
    
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(152, 130, 30, 30);
    [button3 setImage:btnImage2 forState:UIControlStateNormal];
    [button3 addTarget:self
                action:@selector(settingsButtonClick:)
      forControlEvents:UIControlEventTouchDown];
    [VolleyBallView addSubview:button3];


    
    
    smallScoreBoardbutton=[[UIButton alloc]init];
    [smallScoreBoardbutton setFrame:CGRectMake(502,285, 65, 35)];
    
    [smallScoreBoardbutton addTarget:self action:@selector(backButtonClickVolleyBall:)forControlEvents:UIControlEventTouchUpInside];
    [smallScoreBoardbutton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [scrollView addSubview:smallScoreBoardbutton];
    [smallScoreBoardbutton setHidden:NO];

    
    
    FacebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    FacebookButton.frame = CGRectMake(93, 30, 32, 32);
    [FacebookButton setImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [FacebookButton addTarget:self action:@selector(FaceBookIconClicked)forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:FacebookButton];
    
    
    
    Twitter = [UIButton buttonWithType:UIButtonTypeCustom];
    Twitter.frame = CGRectMake(132, 30, 32, 32);
    [Twitter setImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    [Twitter addTarget:self action:@selector(TwitterIconClicked)forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:Twitter];
    
    
    Instructions=[UIButton buttonWithType:UIButtonTypeCustom];
    Instructions.frame=CGRectMake(405, 37, 100, 25);
    [Instructions setImage:[UIImage imageNamed:@"TutorialBtn.png"] forState:UIControlStateNormal];
    [Instructions addTarget:self action:@selector(tutorialButtonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:Instructions];
    
    regulerSBButton=[UIButton buttonWithType:UIButtonTypeCustom];
    regulerSBButton.frame=CGRectMake(184, 0, 200, 25);
    //[regulerSBButton setTitle:@"Reguler SB" forState:UIControlStateNormal];
    [regulerSBButton setImage:[UIImage imageNamed:@"noAd.png"] forState:UIControlStateNormal];
    [regulerSBButton addTarget:self action:@selector(regulerSBButtonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:regulerSBButton];

    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"homescore"];
	[[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"guestscore"];
	
    
    homeLableImageName=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
	guestLableImageName=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
	
	homeTextField.delegate = self;
	guestTextField.delegate = self;
	hiddenHomeTextField.delegate = self;
	hiddenGuestTextField.delegate = self;
	
	
	//home score lable settings
	backHomeLableScore = 1;
	backGuestLableScore = 1;
	
	
	
	
	frontHomeLableScore= 0;
	frontGuestLableScore=0;
	presentHomeScore = frontHomeLableScore;
	presentGuestScore = frontGuestLableScore;
	
    [self frontHomeScoreLableInitialization];
	[self frontGuestScoreLableInitialization];
	[self hiddenFrontHomeScoreLableInitialization];
	[self hiddenFrontGuestScoreLableInitialization];
    
    //////////////////////////// Main Scrollview ////////////////////////////////
    UISwipeGestureRecognizer *MainLeft = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(MainScrollViewLeft)] autorelease];
	MainLeft.direction = UISwipeGestureRecognizerDirectionLeft;
	[BackgroundScrollView addGestureRecognizer:MainLeft];
    
    
	UISwipeGestureRecognizer *MainRight = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(MainScrollViewRight)] autorelease];
	MainRight.direction = UISwipeGestureRecognizerDirectionRight;
	[BackgroundScrollView addGestureRecognizer:MainRight];
    
    
    
    
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *leftSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewLeft)] autorelease];
	leftSwipeUp.direction = UISwipeGestureRecognizerDirectionLeft;
	[scrollView addGestureRecognizer:leftSwipeUp];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewRight)] autorelease];
	rightSwipeDown.direction = UISwipeGestureRecognizerDirectionRight;
	[scrollView addGestureRecognizer:rightSwipeDown];
	
	//period lable swipe recognizers
	UISwipeGestureRecognizer *periodSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(periodLableScoreUp)] autorelease];
	periodSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[preiodLabel addGestureRecognizer:periodSwipeUp];
	
	UISwipeGestureRecognizer *periodSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(periodLableScoreDown)] autorelease];
	periodSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[preiodLabel addGestureRecognizer:periodSwipeDown];
    
    UITapGestureRecognizer *PeriodLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(periodLableScoreUp)];
    [PeriodLabelTap setNumberOfTapsRequired:1];
    [PeriodLabelTap setNumberOfTouchesRequired:1];
    [preiodLabel addGestureRecognizer:PeriodLabelTap];

	
	//tap recognizer for score labels
    
    UITapGestureRecognizer *homeScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeScoreLabelTap:)];
    [homeScoreLabelTap setNumberOfTapsRequired:1];
    [homeScoreLabelTap setNumberOfTouchesRequired:1];
    [frontHomeScoreLable addGestureRecognizer:homeScoreLabelTap];
    
    UITapGestureRecognizer *guestScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guestScoreLabelTap:)];
    [guestScoreLabelTap setNumberOfTapsRequired:1];
    [guestScoreLabelTap setNumberOfTouchesRequired:1];
    [frontGuestScoreLable addGestureRecognizer:guestScoreLabelTap];
    
    UITapGestureRecognizer *hiddenHomeScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenHomeScoreLabelTap:)];
    [hiddenHomeScoreLabelTap setNumberOfTapsRequired:1];
    [hiddenHomeScoreLabelTap setNumberOfTouchesRequired:1];
    [hiddenFrontHomeScoreLable addGestureRecognizer:hiddenHomeScoreLabelTap];
    
    UITapGestureRecognizer *hiddenGuestScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenGuestScoreLabelTap:)];
    [hiddenGuestScoreLabelTap setNumberOfTapsRequired:1];
    [hiddenGuestScoreLabelTap setNumberOfTouchesRequired:1];
    [hiddenFrontGuestScoreLable addGestureRecognizer:hiddenGuestScoreLabelTap];
	//initializing audio
	[self performSelector:@selector(initializeAudio) withObject:nil afterDelay:0.0];
    
    
    
    [self.view bringSubviewToFront:VolleyBallView];
    //  [VolleyBallView  sendSubviewToBack:scrollView];
    
    [VolleyBallView bringSubviewToFront:scrollView];
    [VolleyBallView bringSubviewToFront:preiodLabel];
    [VolleyBallView bringSubviewToFront:button3];
    [VolleyBallView bringSubviewToFront:button2];
    [VolleyBallView bringSubviewToFront:GuestBorder];
    [VolleyBallView bringSubviewToFront:HomeBorder];
    [scrollView bringSubviewToFront:homeTextField];
    [scrollView bringSubviewToFront:guestTextField];
    [scrollView bringSubviewToFront:hiddenGuestTextField];
    [scrollView bringSubviewToFront:hiddenHomeTextField];
    
    
    [self DigitalScoreBoardScreenDesign];
    [self DigitalScoreboardNewtheme1ScreenDesign];
    [self DigitalScoreboardNewtheme2ScreenDesign];
    
    
    [BackgroundScrollView bringSubviewToFront:VolleyBallView];
    
    [VolleyBallView bringSubviewToFront:guestTextField];
    [VolleyBallView bringSubviewToFront:homeTextField];
    
    [button2 setUserInteractionEnabled:NO];
    [button3 setUserInteractionEnabled:NO];
    [homeTextField setUserInteractionEnabled:NO];
    [guestTextField setUserInteractionEnabled:NO];
    [frontGuestScoreLable setUserInteractionEnabled:NO];
    [frontHomeScoreLable setUserInteractionEnabled:NO];
    [preiodLabel setUserInteractionEnabled:NO];
    
    
    
	
	
}
#pragma mark DigitalScoreboard Screen desings .................

-(void)DigitalScoreBoardScreenDesign{
    //
    scrollViewDigital = [[UIScrollView alloc] initWithFrame:CGRectMake(-250, 0,1020,250)];
    scrollViewDigital.contentSize = CGSizeMake(480, 250);
    scrollViewDigital.showsHorizontalScrollIndicator = YES;
    [scrollViewDigital setBackgroundColor:[UIColor clearColor]];
    
    [DigitalScoreboard addSubview:scrollViewDigital];
    //[scrollViewDigital setHidden:YES];
    
    
    CGRect Boders = CGRectMake(465, 153, 88, 13);
    HomeBorderDigital = [[UIImageView alloc]initWithFrame:Boders];
    [HomeBorderDigital setImage:[UIImage imageNamed:@"VballLabels.png"]];
    [scrollViewDigital addSubview:HomeBorderDigital];
    
    CGRect GuestBorderImage = CGRectMake(283, 153, 88, 13);
    GuestBorderDigital = [[UIImageView alloc]initWithFrame:GuestBorderImage];
    [GuestBorderDigital setImage:[UIImage imageNamed:@"VballLabels.png"]];
    [scrollViewDigital addSubview:GuestBorderDigital];
    
    countdownTimerView=[[CountdownTimer_iPad alloc]initWithFrame:CGRectMake(183, 6, 113, 61)];
    countdownTimerViewTheme1=[[CountDownTimerTheme1_ipad alloc]initWithFrame:CGRectMake(183, 6, 113, 61)];
    
    //
    hiddenHomeTextFieldDigital = [[UITextField alloc] initWithFrame:CGRectMake(35, 215, 130, 17)];
    hiddenHomeTextFieldDigital.borderStyle = UITextBorderStyleBezel;
    hiddenHomeTextFieldDigital.textColor = [UIColor blackColor];
    hiddenHomeTextFieldDigital.font = [UIFont systemFontOfSize:14];
    hiddenHomeTextFieldDigital.text = @"Home";
    hiddenHomeTextFieldDigital.textAlignment=UITextAlignmentCenter;
    hiddenHomeTextFieldDigital.autocorrectionType = UITextAutocorrectionTypeNo;
    hiddenHomeTextFieldDigital.backgroundColor = [UIColor clearColor];
    hiddenHomeTextFieldDigital.keyboardType = UIKeyboardTypeDefault;
    hiddenHomeTextFieldDigital.returnKeyType = UIReturnKeyDone;
    hiddenHomeTextFieldDigital.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollViewDigital addSubview:hiddenHomeTextFieldDigital];
    hiddenHomeTextFieldDigital.delegate = self;
    
    [hiddenHomeTextFieldDigital setHidden:YES];
    
    
    guestTextFieldDigital = [[UITextField alloc] initWithFrame:CGRectMake(283, 153, 88, 13)];
    // guestTextFieldDigital.borderStyle = UITextBorderStyleBezel;
    guestTextFieldDigital.textColor = [UIColor blackColor];
    guestTextFieldDigital.font = [UIFont systemFontOfSize:12];
    guestTextFieldDigital.text = @"Guest";
    guestTextFieldDigital.textAlignment=UITextAlignmentCenter;
    guestTextFieldDigital.backgroundColor = [UIColor clearColor];
    guestTextFieldDigital.autocorrectionType = UITextAutocorrectionTypeNo;
    guestTextFieldDigital.keyboardType = UIKeyboardTypeDefault;
    guestTextFieldDigital.returnKeyType = UIReturnKeyDone;
    guestTextFieldDigital.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollViewDigital addSubview:guestTextFieldDigital];
    guestTextFieldDigital.delegate = self;
    
    
    homeTextFieldDigital = [[UITextField alloc] initWithFrame:CGRectMake(465, 153, 88, 13)];
     // homeTextFieldDigital.borderStyle = UITextBorderStyleBezel;
    homeTextFieldDigital.textColor = [UIColor blackColor];
    homeTextFieldDigital.font = [UIFont systemFontOfSize:12];
    homeTextFieldDigital.text = @"Home";
    homeTextFieldDigital.textAlignment=UITextAlignmentCenter;
    homeTextFieldDigital.autocorrectionType = UITextAutocorrectionTypeNo;
    homeTextFieldDigital.backgroundColor = [UIColor clearColor];
    homeTextFieldDigital.keyboardType = UIKeyboardTypeDefault;
    homeTextFieldDigital.returnKeyType = UIReturnKeyDone;
    homeTextFieldDigital.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollViewDigital addSubview:homeTextFieldDigital];
    homeTextFieldDigital.delegate = self;
    [guestTextFieldDigital setUserInteractionEnabled:NO];
    [homeTextFieldDigital setUserInteractionEnabled:NO];
    
    
    hiddenGuestTextFieldDigital = [[UITextField alloc] initWithFrame:CGRectMake(1335, 430, 255, 38)];
    hiddenGuestTextFieldDigital.borderStyle = UITextBorderStyleBezel;
    hiddenGuestTextFieldDigital.textColor = [UIColor blackColor];
    hiddenGuestTextFieldDigital.font = [UIFont systemFontOfSize:17];
    hiddenGuestTextFieldDigital.text = @"Guest";
    hiddenGuestTextFieldDigital.textAlignment=UITextAlignmentCenter;
    hiddenGuestTextFieldDigital.backgroundColor = [UIColor blackColor];
    hiddenGuestTextFieldDigital.autocorrectionType = UITextAutocorrectionTypeNo;
    hiddenGuestTextFieldDigital.keyboardType = UIKeyboardTypeDefault;
    hiddenGuestTextFieldDigital.returnKeyType = UIReturnKeyDone;
    hiddenGuestTextFieldDigital.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollViewDigital addSubview:hiddenGuestTextFieldDigital];
    [hiddenGuestTextFieldDigital setHidden:YES];
    
    hiddenGuestTextFieldDigital.delegate = self;
    self.view.backgroundColor = [UIColor redColor];
    
    
    CGRect myImageRect = CGRectMake( 161, 15, 12, 22);
    //    CGRect myImageRect = CGRectMake( 495, 10, 30, 150);
    tutorialImageView = [[UIImageView alloc]initWithFrame:myImageRect];
    [tutorialImageView setImage:[UIImage imageNamed:@"21dot.png"]];
    [DigitalScoreboard addSubview:tutorialImageView];
    int TutorialY=8;
    int tutorialheight=32;
    
    int tutorialWidth=20;
    
    
    
    
    //
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect = CGRectMake( 228, 10, 15, 50);
    CGRect myImageRect1 = CGRectMake( 124,TutorialY, tutorialWidth, tutorialheight);
    tutorialImageView1 = [[UIImageView alloc]initWithFrame:myImageRect1];
    [tutorialImageView1 setImage:[UIImage imageNamed:@"green0.png"]];
    [DigitalScoreboard addSubview:tutorialImageView1];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect2 = CGRectMake( 206, 10, 20, 50);
    CGRect myImageRect2 = CGRectMake( 143, TutorialY, tutorialWidth, tutorialheight);
    tutorialImageView2 = [[UIImageView alloc]initWithFrame:myImageRect2];
    [tutorialImageView2 setImage:[UIImage imageNamed:@"green0.png"]];
    [DigitalScoreboard addSubview:tutorialImageView2];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect3 = CGRectMake( 244, 10, 20, 50);
    CGRect myImageRect3 = CGRectMake( 170, TutorialY, tutorialWidth, tutorialheight);
    tutorialImageView3 = [[UIImageView alloc]initWithFrame:myImageRect3];
    [tutorialImageView3 setImage:[UIImage imageNamed:@"green0.png"]];
    [DigitalScoreboard addSubview:tutorialImageView3];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect4 = CGRectMake( 265, 10, 20, 50);
    CGRect myImageRect4 = CGRectMake(189, TutorialY, tutorialWidth, tutorialheight);
    tutorialImageView4 = [[UIImageView alloc]initWithFrame:myImageRect4];
    [tutorialImageView4 setImage:[UIImage imageNamed:@"green0.png"]];
    [DigitalScoreboard addSubview:tutorialImageView4];
    
    countdownTimerView.minuteImage1=tutorialImageView1;
    countdownTimerView.minuteImage2=tutorialImageView2;
    countdownTimerView.secondImage1=tutorialImageView3;
    countdownTimerView.secondImage2=tutorialImageView4;
    
    
    UIImage *timerPlayandPauseButtonImage = [UIImage imageNamed:@"play.png"];
    DigitaltimerPlayandPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    DigitaltimerPlayandPauseButton.frame = CGRectMake(163, 50, 15, 15);
    [DigitalScoreboard addSubview:DigitaltimerPlayandPauseButton];
    //[scrollView addSubview:timerPlayandPauseButton];
    [DigitaltimerPlayandPauseButton addTarget:self action:@selector(timerPlayandPauseButtonClick:)
                             forControlEvents:UIControlEventTouchUpInside];
    [DigitaltimerPlayandPauseButton setImage:timerPlayandPauseButtonImage forState:UIControlStateNormal];
    [DigitaltimerPlayandPauseButton setUserInteractionEnabled:NO];
    
        
    UIImage * backImage = [UIImage imageNamed:@"RoundBackBtn2.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(230, 200, 50, 50);
    [backButton addTarget:self action:@selector(backButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:backImage forState:UIControlStateNormal];
    //[scrollView addSubview:backButton];
    //[self.view addSubview: backButton];
    
   
    
    UIImage * resetImage = [UIImage imageNamed:@"Vball-reset.png"];
    DigitalresetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    DigitalresetButton.frame = CGRectMake(153.5,92, 30,30);
    [DigitalresetButton addTarget:self action:@selector(DigitalresetButtonClick:)
                 forControlEvents:UIControlEventTouchUpInside];
    [DigitalresetButton setImage:resetImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [DigitalScoreboard addSubview: DigitalresetButton];
    [DigitalresetButton setUserInteractionEnabled:NO];
    
    //
    //
    UIImage * settingImage = [UIImage imageNamed:@"Vball-settings.png"];
    DigitalsettingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    DigitalsettingButton.frame = CGRectMake(153.5,120, 30, 30);
    [DigitalsettingButton addTarget:self action:@selector(DigitalsettingsButtonClick:)
                   forControlEvents:UIControlEventTouchUpInside];
    [DigitalsettingButton setImage:settingImage forState:UIControlStateNormal];
    //[scrollView addSubview:settingButton];
    [DigitalScoreboard addSubview: DigitalsettingButton];
    [DigitalsettingButton setUserInteractionEnabled:NO];
    
    
    
    
    
    smallScoreBoardbuttonDigital=[[UIButton alloc]init];
    [smallScoreBoardbuttonDigital setFrame:CGRectMake(252,285, 65, 35)];
    
    [smallScoreBoardbuttonDigital addTarget:self action:@selector(backButtonDigital:)forControlEvents:UIControlEventTouchUpInside];
    [smallScoreBoardbuttonDigital setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [DigitalScoreboard addSubview:smallScoreBoardbuttonDigital];
    [smallScoreBoardbuttonDigital setHidden:YES];
    //
    //
    //
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecthiddenHome = CGRectMake( 310, 135, 200, 205);
    hiddenRightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRecthiddenHome];
    [hiddenRightHomeImageView setImage:[UIImage imageNamed:@"off.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenRightHomeImageView.userInteractionEnabled=YES;
    [scrollViewDigital addSubview:hiddenRightHomeImageView];
    [hiddenRightHomeImageView setHidden:YES];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecthiddenHomeLeft = CGRectMake( 160, 135, 200, 295);
    hiddenLeftHomeImageView = [[UIImageView alloc]initWithFrame:myImageRecthiddenHomeLeft];
    [hiddenLeftHomeImageView setImage:[UIImage imageNamed:@"off.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenLeftHomeImageView.userInteractionEnabled=YES;
    [scrollViewDigital addSubview:hiddenLeftHomeImageView];
    
    [hiddenLeftHomeImageView setHidden:YES];
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect7 = CGRectMake(262, 80, 75, 125);
    leftGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect7];
    [leftGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
    leftGuestImageView.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];
    
    [scrollViewDigital addSubview:leftGuestImageView];
    
    [leftGuestImageView setHidden:YES];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect8 = CGRectMake( 330, 80, 75, 125);
    rightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect8];
    [rightGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
    // [self.view addSubview:rightGuestImageView];
    rightGuestImageView.userInteractionEnabled=YES;
    [scrollViewDigital addSubview:rightGuestImageView];
    
    [rightGuestImageView setHidden:YES];
    
    
    int height=94;
    int width=60;
    int  Yposition=50;
    self.view.backgroundColor = [UIColor clearColor];
    
    
    CGRect myImageRectd = CGRectMake( 451, Yposition, width, height);
    
    leftHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectd];
    [leftHomeImageView setImage:[UIImage imageNamed:@"sb0.png"]];
    leftHomeImageView.userInteractionEnabled = NO;
    //[self.view addSubview:hiddenLeftGuestImageView];
    [scrollViewDigital addSubview:leftHomeImageView];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectc = CGRectMake(505, Yposition, width, height);
    rightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectc];
    [rightHomeImageView setImage:[UIImage imageNamed:@"sb0.png"]];
    rightHomeImageView.userInteractionEnabled=NO;
    // [self.view addSubview:hiddenRightGuestImageView];
    [scrollViewDigital addSubview:rightHomeImageView];
    
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectg = CGRectMake(270, Yposition, width, height);
    hiddenLeftGuestImageView = [[UIImageView alloc]initWithFrame:myImageRectg];
    [hiddenLeftGuestImageView setImage:[UIImage imageNamed:@"sb0.png"]];
    hiddenLeftGuestImageView.userInteractionEnabled=NO;
    //[self.view addSubview:leftGuestImageView];
    [scrollViewDigital addSubview:hiddenLeftGuestImageView];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecth = CGRectMake( 324,Yposition, width, height);
    hiddenRightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRecth];
    [hiddenRightGuestImageView setImage:[UIImage imageNamed:@"sb0.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenRightGuestImageView.userInteractionEnabled=NO;
    [scrollViewDigital addSubview:hiddenRightGuestImageView];
    
    
    
    
    
    
    
    //
    //
    //
    //    self.view.backgroundColor = [UIColor blackColor];
    //    CGRect myMainImageRect = CGRectMake( 0, 0, 1024, 748);
    //    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:myMainImageRect];
    //    [mainImageView setImage:[UIImage imageNamed:@"bballbackground1.png"]];
    //    [DigitalScoreBoard addSubview:mainImageView];
    //
    //
    //
    //
    //    //[self.view addSubview:countdownTimerView];
    //
    //	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"basketballhomescore"];
    //	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"basketballguestscore"];
    //	homeTextField.delegate = self;
    //	guestTextField.delegate = self;
    //	hiddenHomeTextField.delegate = self;
    //	hiddenGuestTextField.delegate = self;
    //
    //
	//initializing swipe recognizers
	UISwipeGestureRecognizer *rightHomeImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightHomeImageViewScoreUp)] autorelease];
	rightHomeImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[rightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeUp];
	
	UISwipeGestureRecognizer *rightHomeImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightHomeImageViewScoreDown)] autorelease];
	rightHomeImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[rightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeDown];
    //
    //
	//initializing swipe recognizers
	UISwipeGestureRecognizer *leftHomeImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftHomeImageViewScoreUp)] autorelease];
	leftHomeImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[leftHomeImageView addGestureRecognizer:leftHomeImageViewSwipeUp];
	
	UISwipeGestureRecognizer *leftHomeImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftHomeImageViewScoreDown)] autorelease];
	leftHomeImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[leftHomeImageView addGestureRecognizer:leftHomeImageViewSwipeDown];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *rightGuestImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightGuestImageViewScoreUp)] autorelease];
	rightGuestImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[rightGuestImageView addGestureRecognizer:rightGuestImageViewSwipeUp];
	
	UISwipeGestureRecognizer *rightGuestImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightGuestImageViewScoreDown)] autorelease];
	rightGuestImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[rightGuestImageView addGestureRecognizer:rightGuestImageViewSwipeDown];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *leftGuestImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftGuestImageViewScoreUp)] autorelease];
	leftGuestImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[leftGuestImageView addGestureRecognizer:leftGuestImageViewSwipeUp];
	
	UISwipeGestureRecognizer *leftGuestImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftGuestImageViewScoreDown)] autorelease];
	leftGuestImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[leftGuestImageView addGestureRecognizer:leftGuestImageViewSwipeDown];
	
	
	
	
	
	/*
	 //hidden imageview guesters initialziation
	 */
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenRightHomeImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenRightHomeImageViewScoreUp)] autorelease];
	hiddenRightHomeImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenRightHomeImageView addGestureRecognizer:hiddenRightHomeImageViewSwipeUp];
	
	UISwipeGestureRecognizer *hiddenRightHomeImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenRightHomeImageViewScoreDown)] autorelease];
	hiddenRightHomeImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenRightHomeImageView addGestureRecognizer:hiddenRightHomeImageViewSwipeDown];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenLeftHomeImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenLeftHomeImageViewScoreUp)] autorelease];
	hiddenLeftHomeImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenLeftHomeImageView addGestureRecognizer:hiddenLeftHomeImageViewSwipeUp];
	
	UISwipeGestureRecognizer *hiddenLeftHomeImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenLeftHomeImageViewScoreDown)] autorelease];
	hiddenLeftHomeImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenLeftHomeImageView addGestureRecognizer:hiddenLeftHomeImageViewSwipeDown];
	
    
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenRightGuestImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenRightGuestImageViewScoreUp)] autorelease];
	hiddenRightGuestImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenRightGuestImageView addGestureRecognizer:hiddenRightGuestImageViewSwipeUp];
	
	UISwipeGestureRecognizer *hiddenRightGuestImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenRightGuestImageViewScoreDown)] autorelease];
	hiddenRightGuestImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenRightGuestImageView addGestureRecognizer:hiddenRightGuestImageViewSwipeDown];
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenLeftGuestImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenLeftGuestImageViewScoreUp)] autorelease];
	hiddenLeftGuestImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenLeftGuestImageView addGestureRecognizer:hiddenLeftGuestImageViewSwipeUp];
	
	UISwipeGestureRecognizer *hiddenLeftGuestImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenLeftGuestImageViewScoreDown)] autorelease];
	hiddenLeftGuestImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenLeftGuestImageView addGestureRecognizer:hiddenLeftGuestImageViewSwipeDown];
	
	
    //
    //	//scrollview guesture initialization
    //	//scroll view swipe recognizers
	UISwipeGestureRecognizer *leftSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalMoveScrollViewLeft)] autorelease];
	leftSwipeUp.direction = UISwipeGestureRecognizerDirectionLeft;
	[scrollViewDigital addGestureRecognizer:leftSwipeUp];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalmoveScrollViewRight)] autorelease];
	rightSwipeDown.direction = UISwipeGestureRecognizerDirectionRight;
	[scrollViewDigital addGestureRecognizer:rightSwipeDown];
    //
    //	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetScore) name:@"shake" object:nil];
    //    //tap gesture
    //    //1
    UITapGestureRecognizer *rightHomeScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeScoreChangeWithTap:)];
    [rightHomeScoreImageTap setNumberOfTapsRequired:1];
    [rightHomeScoreImageTap setNumberOfTouchesRequired:1];
    [rightHomeImageView addGestureRecognizer:rightHomeScoreImageTap];
    
    UITapGestureRecognizer *leftHomeScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeScoreChangeWithTap:)];
    [leftHomeScoreImageTap setNumberOfTapsRequired:1];
    [leftHomeScoreImageTap setNumberOfTouchesRequired:1];
    [leftHomeImageView addGestureRecognizer:leftHomeScoreImageTap];
    
    //2
    UITapGestureRecognizer *rightGuestScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guestScoreChangeWithTap:)];
    [rightGuestScoreImageTap setNumberOfTapsRequired:1];
    [rightGuestScoreImageTap setNumberOfTouchesRequired:1];
    [rightGuestImageView addGestureRecognizer:rightGuestScoreImageTap];
    
    UITapGestureRecognizer *leftGuestScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guestScoreChangeWithTap:)];
    [leftGuestScoreImageTap setNumberOfTapsRequired:1];
    [leftGuestScoreImageTap setNumberOfTouchesRequired:1];
    [leftGuestImageView addGestureRecognizer:leftGuestScoreImageTap];
    //3
    UITapGestureRecognizer *hiddenRightHomeScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenHomeScoreChangeWithTap:)];
    [hiddenRightHomeScoreImageTap setNumberOfTapsRequired:1];
    [hiddenRightHomeScoreImageTap setNumberOfTouchesRequired:1];
    [hiddenRightHomeImageView addGestureRecognizer:hiddenRightHomeScoreImageTap];
    
    UITapGestureRecognizer *hiddenLeftHomeScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenHomeScoreChangeWithTap:)];
    [hiddenLeftHomeScoreImageTap setNumberOfTapsRequired:1];
    [hiddenLeftHomeScoreImageTap setNumberOfTouchesRequired:1];
    [hiddenLeftHomeImageView addGestureRecognizer:hiddenLeftHomeScoreImageTap];
    //4
    UITapGestureRecognizer *hiddenRightGuestScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenGuestScoreChangeWithTap:)];
    [hiddenRightGuestScoreImageTap setNumberOfTapsRequired:1];
    [hiddenRightGuestScoreImageTap setNumberOfTouchesRequired:1];
    [hiddenRightGuestImageView addGestureRecognizer:hiddenRightGuestScoreImageTap];
    
    UITapGestureRecognizer *hiddenLeftGuestScoreImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenGuestScoreChangeWithTap:)];
    [hiddenLeftGuestScoreImageTap setNumberOfTapsRequired:1];
    [hiddenLeftGuestScoreImageTap setNumberOfTouchesRequired:1];
    [hiddenLeftGuestImageView addGestureRecognizer:hiddenLeftGuestScoreImageTap];
    
    UITapGestureRecognizer *VolleyBallTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTheVolleyBallView:)];
    [VolleyBallTap setNumberOfTapsRequired:1];
    [VolleyBallTap setNumberOfTouchesRequired:1];
    [VolleyBallView addGestureRecognizer:VolleyBallTap];
    
    
    UITapGestureRecognizer *DigitalBoardTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTheDigitalScoreBoard:)];
    [DigitalBoardTap setNumberOfTapsRequired:1];
    [DigitalBoardTap setNumberOfTouchesRequired:1];
    [DigitalScoreboard addGestureRecognizer:DigitalBoardTap];
    
    
    UITapGestureRecognizer *Theme1ScoreboardTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTheTheme1:)];
    [Theme1ScoreboardTap setNumberOfTapsRequired:1];
    [Theme1ScoreboardTap setNumberOfTouchesRequired:1];
    [DigitalScoreboardNewtheme1 addGestureRecognizer:Theme1ScoreboardTap];
    
    
    UITapGestureRecognizer *Theme2ScoreBoardTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTheTheme2:)];
    [Theme2ScoreBoardTap setNumberOfTapsRequired:1];
    [Theme2ScoreBoardTap setNumberOfTouchesRequired:1];
    [DigitalScoreBordNewTheme2 addGestureRecognizer:Theme2ScoreBoardTap];
    
    
    
    
	//[self homeScoreChange];
    //  [self guestScoreChange];
    //
    //
    //    [self.view bringSubviewToFront:VolleyBallView];
    //    //  [VolleyBallView  sendSubviewToBack:scrollView];
    //
    //    [DigitalScoreBoard bringSubviewToFront:scrollViewDigital];
    //    [DigitalScoreBoard bringSubviewToFront:preiodLabel];
    //    [DigitalScoreBoard bringSubviewToFront:settingButton];
    //    [DigitalScoreBoard bringSubviewToFront:resetButton];
    //  //  [VolleyBallView bringSubviewToFront:GuestBorder];
    //   // [VolleyBallView bringSubviewToFront:HomeBorder];
    //    [scrollView bringSubviewToFront:homeTextFieldDigital];
    //    [scrollView bringSubviewToFront:guestTextFieldDigital];
    //    [scrollView bringSubviewToFront:hiddenGuestTextFieldDigital];
    //    [scrollView bringSubviewToFront:hiddenHomeTextFieldDigital];
    
    
    
    // [DigitalScoreboard bringSubviewToFront:scrollViewDigital];
    
    
    
}
-(void)HideNO{
    [FacebookButton setHidden:NO];
    [Twitter setHidden:NO];
    [Instructions setHidden:NO];
    
}
-(void)HideYes{
    [FacebookButton setHidden:YES];
    [Twitter setHidden:YES];
    [Instructions setHidden:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}


-(IBAction)backButtonClickVolleyBall:(id)sender{
    NSLog(@"VolleyBallview Tapped");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.6];
	[UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [smallScoreBoardbutton setHidden:YES];
    
    
    [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x+200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
    [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x-200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
    [smallScoreBoardbutton setHidden:NO];
    
    NSString *homeLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
    
    
    if (homeLableImageName1==@"red5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSmall5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"blue5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSmall5.jpg"]]];    }
    else if (homeLableImageName1==@"orange5.jpg") {
        
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSmall5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"green5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSmall5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"grey5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySmall5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"pink5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSmall5.jpg"]]];
    }
    else if (homeLableImageName1==@"purple5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSmall5.jpg"]]];
        
    }
    
    else if (homeLableImageName1==@"yellow5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSmall5.jpg"]]];
        
        
    }
    else if (homeLableImageName1==@"black5.jpg") {
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSmall5.jpg"]]];
    }
    else if (homeLableImageName1==@"sky5.jpg") {
        
        
        [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySmall5.jpg"]]];
    }
    
    
    
    
    NSString *guestLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
    
    if (guestLableImageName1==@"red5.jpg") {
        
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSmall5.jpg"]]];
        
        
    }
    else if (guestLableImageName1==@"blue5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSmall5.jpg"]]];
    }
    else if (guestLableImageName==@"orange5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSmall5.jpg"]]];
        
    }
    else if (guestLableImageName1==@"green5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSmall5.jpg"]]];
        
    }
    else if (guestLableImageName1==@"grey5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySmall5.jpg"]]];
        
        
    }
    else if (guestLableImageName1==@"pink5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSmall5.jpg"]]];
        
        
    }
    else if (guestLableImageName1==@"purple5.jpg") {
        
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSmall5.jpg"]]];
        
    }
    else if (guestLableImageName1==@"yellow5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSmall5.jpg"]]];
        
    }
    
    else if (guestLableImageName1==@"black5.jpg") {
        
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSmall5.jpg"]]];
        
        
    }
    
    else if (guestLableImageName1==@"sky5.jpg") {
        [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySmall5.jpg"]]];
        
    }
    
    
    
    
    
    
        [scrollView setUserInteractionEnabled:NO];
        [button2 setUserInteractionEnabled:NO];
        [button3 setUserInteractionEnabled:NO];
        [homeTextField setUserInteractionEnabled:NO];
        [guestTextField setUserInteractionEnabled:NO];
        [frontGuestScoreLable setUserInteractionEnabled:NO];
        [frontHomeScoreLable setUserInteractionEnabled:NO];
        [preiodLabel setUserInteractionEnabled:NO];
        preiodLabel.font=[UIFont systemFontOfSize:35] ;
        [HomeBorder setFrame:CGRectMake(201.5,147.5, 120, 19)];
        [GuestBorder setFrame:CGRectMake(16.5, 147.5, 121, 19)];
        
    
    
        
        
        
        frontHomeScoreLable.font=[UIFont systemFontOfSize:LABLE_FONTSIZE-40];
        frontGuestScoreLable.font=[UIFont systemFontOfSize:LABLE_FONTSIZE-40];
        
        
        homeTextField.font = [UIFont systemFontOfSize:17];
        guestTextField.font = [UIFont systemFontOfSize:17];
        
        button3.frame = CGRectMake(152, 130, 30, 30);
        button2.frame = CGRectMake(152, 100, 30, 30);
        
        VolleyBallViewBigger=NO;
        [VolleyBallBackGroundImageView setFrame:CGRectMake(0, 0,350,250)];
        // [DigitalScoreboard setFrame:CGRectMake(450,20,320,250)];
        [DigitalScoreboard setFrame:CGRectMake(DigitalScoreboard.frame.origin.x-250, DigitalScoreboard.frame.origin.y, DigitalScoreboard.frame.size.width, DigitalScoreboard.frame.size.height)];
        //
        [VolleyBallView setFrame:CGRectMake(136, 80,336,189)];
        
        [VolleyBallBackGroundImageView setFrame:CGRectMake( 0, 0,VolleyBallView.frame.size.width,VolleyBallView.frame.size.height)];
        
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x+50, Twitter.frame.origin.y+100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x+50, FacebookButton.frame.origin.y+100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x-50, Instructions.frame.origin.y+100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, 0, 200, 25);

    
        [preiodLabel setFrame:CGRectMake(158,1, 20, 48)];
    NSLog(@"the small values are the %d, an also %d",HOMESCORE_LABLE_WIDTH+5,HOMESCORE_LABLE_HEIGHT-18);
    
    
        if (VolleyBallCourtChanged==NO) {
            [frontHomeScoreLable setFrame:CGRectMake(frontHomeScoreLable.frame.origin.x-132, frontHomeScoreLable.frame.origin.y-2, frontHomeScoreLable.frame.size.width-95,frontHomeScoreLable.frame.size.height-99)];
            
            NSLog(@"the values are %f,%f,%f,%f",frontHomeScoreLable.frame.origin.x-132, frontHomeScoreLable.frame.origin.y-3, frontHomeScoreLable.frame.size.width-97,frontHomeScoreLable.frame.size.height-89);
            
            [frontGuestScoreLable setFrame:CGRectMake(frontGuestScoreLable.frame.origin.x-4, frontGuestScoreLable.frame.origin.y-2, frontGuestScoreLable.frame.size.width-95, frontGuestScoreLable.frame.size.height-99)];
            [homeTextField setFrame:CGRectMake(201.5,147.5, 120, 19)];
            [guestTextField setFrame:CGRectMake(16.5, 147.5, 121, 19)];
        }
        else{
            
            
            [frontHomeScoreLable setFrame:CGRectMake(frontHomeScoreLable.frame.origin.x-4, frontHomeScoreLable.frame.origin.y-1, frontHomeScoreLable.frame.size.width-95,frontHomeScoreLable.frame.size.height-99)];
            
            [frontGuestScoreLable setFrame:CGRectMake(frontGuestScoreLable.frame.origin.x-132, frontGuestScoreLable.frame.origin.y-2, frontGuestScoreLable.frame.size.width-95, frontGuestScoreLable.frame.size.height-99)];
            [guestTextField setFrame:CGRectMake(201.5,147.5, 120, 19)];
            [homeTextField setFrame:CGRectMake(16.5, 147.5, 121, 19)];
        }
        
        
        
    
   // [UIView commitAnimations];
    [self performSelector:@selector(FadeOut1) withObject:nil afterDelay:0.3];
    // [self.view bringSubviewToFront:adView];
    
    
    [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x+105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
    [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x-105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
    
    guestTextField.alpha=0.0;
    
    homeTextField.alpha=0.0;
    


}
-(void)TapTheVolleyBallView:(UIGestureRecognizer *)gesture{
    NSLog(@"VolleyBallview Tapped");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    
   
    
    if(VolleyBallViewBigger==NO){
        [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x-200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x+200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
         [smallScoreBoardbutton setHidden:NO];
        NSString *homeLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
        
        
        if (homeLableImageName1==@"red5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"blue5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5.jpg"]]];    }
        else if (homeLableImageName1==@"orange5.jpg") {
            
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orange5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"green5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"grey5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"grey5.jpg"]]];
            
        }
        else if (homeLableImageName1==@"pink5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pink5.jpg"]]];
        }
        else if (homeLableImageName1==@"purple5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purple5.jpg"]]];
            
        }
        
        else if (homeLableImageName1==@"yellow5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow5.jpg"]]];
            
            
        }
        else if (homeLableImageName1==@"black5.jpg") {
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"black5.jpg"]]];
        }
        else if (homeLableImageName1==@"sky5.jpg") {
            
            
            [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sky5.jpg"]]];
        }
        
        
        
        
        NSString *guestLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
        
        if (guestLableImageName1==@"red5.jpg") {
            
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"blue5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5.jpg"]]];
        }
        else if (guestLableImageName==@"orange5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orange5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"green5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"grey5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"grey5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"pink5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pink5.jpg"]]];
            
            
        }
        else if (guestLableImageName1==@"purple5.jpg") {
            
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purple5.jpg"]]];
            
        }
        else if (guestLableImageName1==@"yellow5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow5.jpg"]]];
            
        }
        
        else if (guestLableImageName1==@"black5.jpg") {
            
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"black5.jpg"]]];
            
            
        }
        
        else if (guestLableImageName1==@"sky5.jpg") {
            [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"sky5.jpg"]]];
            
        }

        
        [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x-105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
         [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x+105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
        
         [scrollView setUserInteractionEnabled:YES];
        [button2 setUserInteractionEnabled:YES];
        [button3 setUserInteractionEnabled:YES];
        [homeTextField setUserInteractionEnabled:YES];
        [guestTextField setUserInteractionEnabled:YES];
        [frontGuestScoreLable setUserInteractionEnabled:YES];
        [frontHomeScoreLable setUserInteractionEnabled:YES];
        [preiodLabel setUserInteractionEnabled:YES];
        
        [HomeBorder setFrame:CGRectMake(340,251, 205, 33)];
        [GuestBorder setFrame:CGRectMake(27, 251, 205, 33)];
        
        homeTextField.font = [UIFont systemFontOfSize:25];
        guestTextField.font = [UIFont systemFontOfSize:25];
        frontHomeScoreLable.font=[UIFont systemFontOfSize:LABLE_FONTSIZE+40];
        frontGuestScoreLable.font=[UIFont systemFontOfSize:LABLE_FONTSIZE+40];
        
        button3.frame = CGRectMake(266, 215, 35, 35);
        button2.frame = CGRectMake(266, 175, 35, 35);
        
        [preiodLabel setFrame:CGRectMake(268,10, 45, 58)];
        preiodLabel.font=[UIFont systemFontOfSize:50] ;
        
        
//        [DigitalScoreboard setFrame:CGRectMake(DigitalScoreboard.frame.origin.x+250, DigitalScoreboard.frame.origin.y, DigitalScoreboard.frame.size.width, DigitalScoreboard.frame.size.height)];
        
        VolleyBallViewBigger=YES;
        scrollView.frame=CGRectMake(-250, 0, 980, 320);
        [VolleyBallView setFrame:CGRectMake(20, 0, 568,320)];
        
        
        
        [VolleyBallBackGroundImageView setFrame:CGRectMake(0, 0, 568, 320)];
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x-50, Twitter.frame.origin.y-100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x-50, FacebookButton.frame.origin.y-100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x+50, Instructions.frame.origin.y-100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, -100, 200, 25);


        NSLog(@"?????????????? is %f and %f",frontHomeScoreLable.frame.size.width+97,frontHomeScoreLable.frame.size.height+109);
        if (VolleyBallCourtChanged==NO) {
            [frontHomeScoreLable setFrame:CGRectMake(frontHomeScoreLable.frame.origin.x+132, frontHomeScoreLable.frame.origin.y+2, frontHomeScoreLable.frame.size.width+95,frontHomeScoreLable.frame.size.height+99)];
            
            NSLog(@"the values are %f,%f,%f,%f",frontHomeScoreLable.frame.origin.x+132, frontHomeScoreLable.frame.origin.y+2, frontHomeScoreLable.frame.size.width+97,frontHomeScoreLable.frame.size.height+89);
            
            [frontGuestScoreLable setFrame:CGRectMake(frontGuestScoreLable.frame.origin.x+4, frontGuestScoreLable.frame.origin.y+2, frontGuestScoreLable.frame.size.width+95, frontGuestScoreLable.frame.size.height+99)];
            [homeTextField setFrame:CGRectMake(340, 251, 205, 33)];
            [guestTextField setFrame:CGRectMake(27, 251, 205, 33)];
            
            
        }
        else{
            
            [frontHomeScoreLable setFrame:CGRectMake(261, frontHomeScoreLable.frame.origin.y+1, frontHomeScoreLable.frame.size.width+95,frontHomeScoreLable.frame.size.height+99)];
            
            [frontGuestScoreLable setFrame:CGRectMake(573, frontGuestScoreLable.frame.origin.y+2, frontGuestScoreLable.frame.size.width+95, frontGuestScoreLable.frame.size.height+99)];
            [homeTextField setFrame:CGRectMake(27, 251, 205, 33)];
            [guestTextField setFrame:CGRectMake(340, 251, 205,33)];
            
        }
        
        
        // [VolleyBallView bringSubviewToFront:frontHomeScoreLable];
        [UIView commitAnimations];
        [self performSelector:@selector(FadeOut1) withObject:nil afterDelay:0.1];
        // [self.view bringSubviewToFront:adView];
        
        
        
        guestTextField.alpha=0.0;
        
        homeTextField.alpha=0.0;
        
    }
        
    
}
-(void)FadeOut1{
    NSLog(@"its first time");
    homeTextField.alpha=0.20;
    guestTextField.alpha=0.20;
    [self performSelector:@selector(FadeOut2) withObject:nil afterDelay:0.1];
    
}
-(void)FadeOut2{
    homeTextField.alpha=0.40;
    guestTextField.alpha=0.40;
    [self performSelector:@selector(FadeOut3) withObject:nil afterDelay:0.1];
}
-(void)FadeOut3{
    homeTextField.alpha=0.60;
    guestTextField.alpha=0.60;
    [self performSelector:@selector(FadeOut4) withObject:nil afterDelay:0.1];
}
-(void)FadeOut4{
    homeTextField.alpha=0.80;
    guestTextField.alpha=0.80;
    [self performSelector:@selector(FadeOut5) withObject:nil afterDelay:0.1];
}
-(void)FadeOut5{
    homeTextField.alpha=1.0;
    guestTextField.alpha=1.0;
    
}
-(void)backButtonDigital:(id)sender{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];

 [smallScoreBoardbuttonDigital setHidden:YES];
    
    [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x+200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
    [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x-200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        DigitalViewBigger=NO;
        BiggerModeDigitalActivated=NO;
        [DigitaltimerPlayandPauseButton setUserInteractionEnabled:NO];
        [DigitalsettingButton setUserInteractionEnabled:NO];
        [DigitalresetButton setUserInteractionEnabled:NO];
        
        
        [DigitalresetButton setFrame:CGRectMake(153.5,92, 30,30)];
        [DigitalsettingButton setFrame:CGRectMake(153.5,120, 30, 30)];
        
        [GuestBorderDigital setFrame:CGRectMake(283, 153, 88, 13)];
        [HomeBorderDigital setFrame:CGRectMake(465, 153, 88, 13)];
        
        guestTextFieldDigital.font = [UIFont systemFontOfSize:12];
        homeTextFieldDigital.font = [UIFont systemFontOfSize:12];
        hiddenLeftGuestImageView.userInteractionEnabled=NO;
        hiddenRightGuestImageView.userInteractionEnabled=NO;
        rightHomeImageView.userInteractionEnabled=NO;
        leftHomeImageView.userInteractionEnabled=NO;
        
        
        [VolleyBallView setFrame:CGRectMake(VolleyBallView.frame.origin.x+100, VolleyBallView.frame.origin.y,VolleyBallView.frame.size.width,VolleyBallView.frame.size.height)];        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(DigitalScoreboardNewtheme1.frame.origin.x-200, DigitalScoreboardNewtheme1.frame.origin.y,350, 250)];
        
        
        [DigitalScoreboardNewtheme1 setHidden:NO];
        [DigitalScoreboard setFrame:CGRectMake(508, 80,335,189)];
        [DigitalscoreboardBackground setFrame:CGRectMake(0, 0, DigitalScoreboard.frame.size.width, DigitalScoreboard.frame.size.height)];
        
        
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x+50, Twitter.frame.origin.y+100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x+50, FacebookButton.frame.origin.y+100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x-50, Instructions.frame.origin.y+100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, 0, 200, 25);

    
        scrollViewDigital.frame= CGRectMake(-250, 0,1040,250);
        scrollViewDigital.contentSize = CGSizeMake(480, 250);
    int TutorialY=8;
    int tutorialheight=32;
    
    int tutorialWidth=20;
    
        
        
        [tutorialImageView setFrame:CGRectMake( 161,15, 12, 22)];
        [tutorialImageView1 setFrame:CGRectMake( 124,TutorialY, tutorialWidth, tutorialheight)];
        [tutorialImageView2 setFrame:CGRectMake( 143, TutorialY, tutorialWidth, tutorialheight)];
        [tutorialImageView3 setFrame:CGRectMake( 170, TutorialY, tutorialWidth, tutorialheight)];
        [tutorialImageView4 setFrame:CGRectMake(189, TutorialY, tutorialWidth, tutorialheight)];
        
    int height=94;
    int width=60;
    int  Yposition=50;
    
    
        
        
        
        if (DigitalScoreboardCourtChnage==NO){
            NSLog(@"its coming here");
            [rightHomeImageView setFrame:CGRectMake(505, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake( 451, Yposition, width, height)];
            
            [hiddenRightGuestImageView setFrame:CGRectMake( 324, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake(270, Yposition, width, height)];
            
            
            [guestTextFieldDigital setFrame:CGRectMake(283, 153, 88, 13)];
            [homeTextFieldDigital setFrame:CGRectMake(465, 153, 88, 13)];
            
        } 
        else{
            
            [rightHomeImageView setFrame:CGRectMake( 324, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake(270, Yposition, width, height)];
            
            [hiddenRightGuestImageView setFrame:CGRectMake(505, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake( 451, Yposition, width, height)];
            
        
            [guestTextFieldDigital setFrame:CGRectMake(465, 153, 88, 13)];
            [homeTextFieldDigital setFrame:CGRectMake(283, 153,88, 13)];
        }
        
        DigitaltimerPlayandPauseButton.frame = CGRectMake(163, 50, 15, 15);
    [self performSelector:@selector(FadeOutDigital1) withObject:nil afterDelay:0.1];
    //[self.view bringSubviewToFront:adView];
    [UIView commitAnimations];
    
    homeTextFieldDigital.alpha=0.0;
    guestTextFieldDigital.alpha=0.0;
    [guestTextFieldDigital setUserInteractionEnabled:NO];
    [homeTextFieldDigital setUserInteractionEnabled:NO];
    [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x+105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
    [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x-105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];


}

-(void)TapTheDigitalScoreBoard:(UIGestureRecognizer *)gesture{
    NSLog(@"the Digital scoreboard Tapped");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    if (DigitalViewBigger==NO) {
        [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x-200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x+200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [smallScoreBoardbutton setHidden:NO];
        [guestTextFieldDigital setUserInteractionEnabled:YES];
        [homeTextFieldDigital setUserInteractionEnabled:YES];
        
        [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x-105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
        [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x+105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
        
        [smallScoreBoardbuttonDigital setHidden:NO];
        
        DigitalViewBigger=YES;
        BiggerModeDigitalActivated=YES;
        
      
        
        int tutorialHeight=55;
        int tutorialwidth=33;
        int tutorialYposition=13;
        
        
        [DigitaltimerPlayandPauseButton setUserInteractionEnabled:YES];
        [DigitalsettingButton setUserInteractionEnabled:YES];
        [DigitalresetButton setUserInteractionEnabled:YES];
        
        [tutorialImageView setFrame:CGRectMake( 274, 22, 20, 39)];
        
        [tutorialImageView1 setFrame:CGRectMake( 214, tutorialYposition, tutorialwidth, tutorialHeight)];
        [tutorialImageView2 setFrame:CGRectMake( 245, tutorialYposition, tutorialwidth, tutorialHeight)];
        [tutorialImageView3 setFrame:CGRectMake( 288, tutorialYposition, tutorialwidth, tutorialHeight)];
        [tutorialImageView4 setFrame:CGRectMake( 319, tutorialYposition, tutorialwidth, tutorialHeight)];
        
        
        
        [DigitalresetButton setFrame:CGRectMake(267,180, 35,35)];
        [DigitalsettingButton setFrame:CGRectMake(267,215, 35, 35)];
        [DigitaltimerPlayandPauseButton setFrame:CGRectMake(273, 85, 25, 25)];
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x-50, Twitter.frame.origin.y-100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x-50, FacebookButton.frame.origin.y-100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x+50, Instructions.frame.origin.y-100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, -100, 200, 25);

        
        //
        [GuestBorderDigital setFrame:CGRectMake(300, 255, 160, 24)];
        [HomeBorderDigital setFrame:CGRectMake(610, 255, 160, 24)];
        
        
        
        
        guestTextFieldDigital.font = [UIFont systemFontOfSize:22];
        homeTextFieldDigital.font = [UIFont systemFontOfSize:22];
        
        
        [VolleyBallView setFrame:CGRectMake(VolleyBallView.frame.origin.x-100, VolleyBallView.frame.origin.y,VolleyBallView.frame.size.width,VolleyBallView.frame.size.height)];
        
        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(DigitalScoreboardNewtheme1.frame.origin.x+200, DigitalScoreboardNewtheme1.frame.origin.y,350,250)];
        
        [DigitalScoreboard setFrame:CGRectMake(392, 0,568,320)];
        [DigitalscoreboardBackground setFrame:CGRectMake(0, 0, 568, 320)];
        
        scrollViewDigital.frame=CGRectMake(-250, 0, 1040, 320);
        
        scrollViewDigital.contentSize = CGSizeMake(568, 250);
        int height=160;
        int width=100;
        int Yposition=84;
        if (DigitalScoreboardCourtChnage==NO) {
            [hiddenRightGuestImageView setFrame:CGRectMake(377, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake( 283, Yposition, width, height)];
            
            [rightHomeImageView setFrame:CGRectMake( 686, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake(590, Yposition, width, height)];
            
            [guestTextFieldDigital setFrame:CGRectMake(300, 255, 160, 25)];
            [homeTextFieldDigital setFrame:CGRectMake(610, 255, 160, 25)];
            
            
            
        }
        else{
            
            
            [hiddenRightGuestImageView setFrame:CGRectMake(686, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake( 590, Yposition, width, height)];
            
            [rightHomeImageView setFrame:CGRectMake( 377, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake(283, Yposition, width, height)];
            
            [guestTextFieldDigital setFrame:CGRectMake(610, 255, 160, 25)];
            [homeTextFieldDigital setFrame:CGRectMake(300, 255, 160, 25)];
            
            
        }
        
        
        hiddenLeftGuestImageView.userInteractionEnabled=YES;
        hiddenRightGuestImageView.userInteractionEnabled=YES;
        rightHomeImageView.userInteractionEnabled=YES;
        leftHomeImageView.userInteractionEnabled=YES;
        
        [self performSelector:@selector(FadeOutDigital1) withObject:nil afterDelay:0.1];
        //[self.view bringSubviewToFront:adView];
        [UIView commitAnimations];
        
        homeTextFieldDigital.alpha=0.0;
        guestTextFieldDigital.alpha=0.0;

        
        
    }
            
    
}
-(void)FadeOutDigital1{
    NSLog(@"its first time");
    homeTextFieldDigital.alpha=0.20;
    guestTextFieldDigital.alpha=0.20;
    [self performSelector:@selector(FadeOutDigital2) withObject:nil afterDelay:0.1];
    
}
-(void)FadeOutDigital2{
    homeTextFieldDigital.alpha=0.40;
    guestTextFieldDigital.alpha=0.40;
    [self performSelector:@selector(FadeOutDigital3) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigital3{
    homeTextFieldDigital.alpha=0.60;
    guestTextFieldDigital.alpha=0.60;
    [self performSelector:@selector(FadeOutDigital4) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigital4{
    homeTextFieldDigital.alpha=0.80;
    guestTextFieldDigital.alpha=0.80;
    [self performSelector:@selector(FadeOutDigital5) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigital5{
    homeTextFieldDigital.alpha=1.0;
    guestTextFieldDigital.alpha=1.0;
    
}
-(void)backButtonDigitalTheme1:(id)sender{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [smallScoreBoardbuttonDigitalTheme1 setHidden:YES];
   
    
    [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x+200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
    [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x-200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
               [Theme1PlayPauseButton setUserInteractionEnabled:NO];
        Theme1PlayPauseButton.frame = CGRectMake(162,58, 15, 15);
        [scrollViewTheme1 setFrame:CGRectMake(-250, 0,1040,250)];
    
        [Periodbutton setUserInteractionEnabled:NO];
        
        
        Periodbutton.frame=CGRectMake(148.5, 82, 7.5,7.5);
        PeriodButton1.frame=CGRectMake(158.5, 82, 7.5, 7.5);
        PeriodButton2.frame=CGRectMake(168.5, 82, 7.5, 7.5);
        PeriodButton3.frame=CGRectMake(178.5, 82, 7.5, 7.5);
        
        
        
        Theme1Bigger=NO;
        
        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(880, 80,335,189)];
        [DigitalScoreBoardBackGroundTheme1 setFrame:CGRectMake(0, 0, DigitalScoreboardNewtheme1.frame.size.width,DigitalScoreboardNewtheme1.frame.size.height)];
        settingButtonTheme1.frame = CGRectMake(155,125, 25,25);
        resetButtonTheme1.frame = CGRectMake(155,100, 25,25);
        
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x+50, Twitter.frame.origin.y+100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x+50, FacebookButton.frame.origin.y+100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x-50, Instructions.frame.origin.y+100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, 0, 200, 25);

    
        [DigitalScoreBordNewTheme2 setFrame:CGRectMake(DigitalScoreBordNewTheme2.frame.origin.x-200, DigitalScoreBordNewTheme2.frame.origin.y,335,189)];
        [DigitalScoreboard setFrame:CGRectMake(DigitalScoreboard.frame.origin.x+200, DigitalScoreboard.frame.origin.y,335,189)];
        
        
        [GuestBorderDigitalTheme1 setFrame:CGRectMake(28.5, 155, 100, 13)];
        [HomeBorderDigitalTheme1 setFrame:CGRectMake(206.5, 155, 100, 13)];
        
        
        
        guestTextFieldTheme1.font = [UIFont systemFontOfSize:12];
        homeTextFieldTheme1.font = [UIFont systemFontOfSize:12];
        
        hiddenLeftGuestImageViewTheme1.userInteractionEnabled=NO;
        hiddenRightGuestImageViewTheme1.userInteractionEnabled=NO;
        rightHomeImageViewTheme1.userInteractionEnabled=NO;
        leftHomeImageViewTheme1.userInteractionEnabled=NO;
        guestTextFieldTheme1.userInteractionEnabled=NO;
        homeTextFieldTheme1.userInteractionEnabled=NO;
        resetButtonTheme1.userInteractionEnabled=NO;
        settingButtonTheme1.userInteractionEnabled=NO;
        
    int H=82;
    int W=60;
    int Y=64;

    
        if (Theme1CourtChange==NO) {
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(271,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(325,Y, W, H)];
            
            
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(450, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(504, Y, W, H)];
            
            [guestTextFieldTheme1 setFrame:CGRectMake(279, 154, 100, 13)];
            [homeTextFieldTheme1 setFrame:CGRectMake(457, 154, 100, 13)];
            
        }
        else{
            NSLog(@"its coming here");
            
            
            
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(450,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(504,Y, W, H)];
            
            
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(271, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(325, Y, W, H)];
            
            [guestTextFieldTheme1 setFrame:CGRectMake(457, 154, 100, 13)];
            [homeTextFieldTheme1 setFrame:CGRectMake(279, 154, 100, 13)];
            
            
        }
        
        
    scrollViewTheme1.contentSize = CGSizeMake(480, DigitalScoreboardNewtheme1.frame.size.height);

    
        int TutorialImageHeight=46;
        int TutorialImageWidth=32;
        int TutorialImageY=7;
        
        
        
        
         [twoDotsTheme1 setFrame:CGRectMake(165, 16, 5, 30)];
        [tutorialImageViewTheme11 setFrame:CGRectMake(103, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme12 setFrame:CGRectMake(131, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme13 setFrame:CGRectMake(172, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme14 setFrame:CGRectMake(200, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        
    [self performSelector:@selector(FadeOutDigitalTheme11) withObject:nil afterDelay:0.1];
    //   [self.view bringSubviewToFront:adView];
    [UIView commitAnimations];
    
    homeTextFieldTheme1.alpha=0.0;
    guestTextFieldTheme1.alpha=0.0;

    [CustonPeriodbutton setUserInteractionEnabled:NO];
    [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x+105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
    [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x-105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];

}

-(void)TapTheTheme1:(UIGestureRecognizer *)gestur{
    //[self.view bringSubviewToFront:adView];
    
    NSLog(@"the Theme1 scoreboard Tapped");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [smallScoreBoardbuttonDigitalTheme1 setHidden:NO];
    
    if (Theme1Bigger==NO) {
        [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x-200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x+200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [smallScoreBoardbutton setHidden:NO];
        [CustonPeriodbutton setUserInteractionEnabled:YES];
        [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x-105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
        [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x+105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
        
        
        [scrollViewTheme1 setFrame:CGRectMake(-250, 0,1040,320)];
        
        Theme1Bigger=YES;
        [Theme1PlayPauseButton setUserInteractionEnabled:YES];
        
        Theme1PlayPauseButton.frame = CGRectMake(275, 100, 22, 22);
        
        
        settingButtonTheme1.frame = CGRectMake(266.5,215, 35, 35);
        resetButtonTheme1.frame = CGRectMake(266.5,180, 35, 35);
        
        [DigitalScoreBoardBackGroundTheme1 setFrame:CGRectMake(0, 0, 568, 320)];
        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(764, 0, 568, 568)];
        
      
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x-50, Twitter.frame.origin.y-100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x-50, FacebookButton.frame.origin.y-100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x+50, Instructions.frame.origin.y-100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, -100, 200, 25);

        [DigitalScoreBordNewTheme2 setFrame:CGRectMake(DigitalScoreBordNewTheme2.frame.origin.x+200, DigitalScoreBordNewTheme2.frame.origin.y,350,250)];
        [DigitalScoreboard setFrame:CGRectMake(DigitalScoreboard.frame.origin.x-200, DigitalScoreboard.frame.origin.y,350,250)];
        
        
        [GuestBorderDigitalTheme1 setFrame:CGRectMake(43, 259, 180, 22)];
        [HomeBorderDigitalTheme1 setFrame:CGRectMake(346, 259, 180, 22)];
        
        
        
        
        guestTextFieldTheme1.font = [UIFont systemFontOfSize:22];
        homeTextFieldTheme1.font = [UIFont systemFontOfSize:22];
        
        
        hiddenLeftGuestImageViewTheme1.userInteractionEnabled=YES;
        hiddenRightGuestImageViewTheme1.userInteractionEnabled=YES;
        rightHomeImageViewTheme1.userInteractionEnabled=YES;
        leftHomeImageViewTheme1.userInteractionEnabled=YES;
        guestTextFieldTheme1.userInteractionEnabled=YES;
        homeTextFieldTheme1.userInteractionEnabled=YES;
        resetButtonTheme1.userInteractionEnabled=YES;
        settingButtonTheme1.userInteractionEnabled=YES;
        
        
        int TutorialImageHeight=79;
        int TutorialImageWidth=52;
        int TutorialImageY=11;
        
        
         [twoDotsTheme1 setFrame:CGRectMake(281, 25, 8, 50)];
        
        
        [tutorialImageViewTheme11 setFrame:CGRectMake(176, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme12 setFrame:CGRectMake(226, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme13 setFrame:CGRectMake(292, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        [tutorialImageViewTheme14 setFrame:CGRectMake(342, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
        
        Periodbutton.frame=CGRectMake(252.5, 138.5, 12, 12);
        PeriodButton1.frame=CGRectMake(269.5, 138.5, 12, 12);
        PeriodButton2.frame=CGRectMake(285.5, 138.5, 12, 12);
        PeriodButton3.frame=CGRectMake(302.5, 138.5, 12, 12);
        //[Theme1PlayPauseButton setFrame:CGRectMake(500, 500, 50, 50)];
        
        //        if (Theme1CourtChange==NO) {
        //
        //
        //
        //
        //
        //        }else{
        //
        //            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(265, Y, W, H)];
        //            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(350, Y, W, H)];
        //            [leftHomeImageViewTheme1 setFrame:CGRectMake(535,Y, W, H)];
        //            [rightHomeImageViewTheme1 setFrame:CGRectMake(620,Y, W, H)];
        //
        //            [guestTextFieldTheme1 setFrame:CGRectMake(535, 285, 180, 20)];
        //            [homeTextFieldTheme1 setFrame:CGRectMake(265, 285, 180, 20)];
        //
        //
        //        }
        int H=145;
        int W=100;
        int Y=106;
        if (Theme1CourtChange==NO) {
            
            
            NSLog(@"the court change is BIG No.....");
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(593, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(678, Y, W, H)];
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(290,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(375,Y, W, H)];
            
            
            [guestTextFieldTheme1 setFrame:CGRectMake(293, 257, 180, 22)];
            [homeTextFieldTheme1 setFrame:CGRectMake(595, 257, 180, 22)];        }
        else{
            NSLog(@"the court change is BIG No");
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(290, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(375, Y, W, H)];
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(593,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(678,Y, W, H)];
            
            
            [guestTextFieldTheme1 setFrame:CGRectMake(595, 257, 180, 22)];
            [homeTextFieldTheme1 setFrame:CGRectMake(293, 257, 180, 22)];
            
        }
        
        
        [Periodbutton setUserInteractionEnabled:NO];
        [self performSelector:@selector(FadeOutDigitalTheme11) withObject:nil afterDelay:0.1];
        //   [self.view bringSubviewToFront:adView];
        [UIView commitAnimations];
        
        homeTextFieldTheme1.alpha=0.0;
        guestTextFieldTheme1.alpha=0.0;
    }

    }
        
-(void)FadeOutDigitalTheme11{
    NSLog(@"its first time");
    homeTextFieldTheme1.alpha=0.20;
    guestTextFieldTheme1.alpha=0.20;
    [self performSelector:@selector(FadeOutDigitalTheme12) withObject:nil afterDelay:0.1];
    
}
-(void)FadeOutDigitalTheme12{
    homeTextFieldTheme1.alpha=0.40;
    guestTextFieldTheme1.alpha=0.40;
    [self performSelector:@selector(FadeOutDigitalTheme13) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme13{
    homeTextFieldTheme1.alpha=0.60;
    guestTextFieldTheme1.alpha=0.60;
    [self performSelector:@selector(FadeOutDigitalTheme14) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme14{
    homeTextFieldTheme1.alpha=0.80;
    guestTextFieldTheme1.alpha=0.80;
    [self performSelector:@selector(FadeOutDigitalTheme15) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme15{
    homeTextFieldTheme1.alpha=1.0;
    guestTextFieldTheme1.alpha=1.0;
    
}
-(void)backButtonDigitalTheme2:(id)sender{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [smallScoreBoardbuttonDigitalTheme2 setHidden:YES];
    
    [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x+200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
    [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x-200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];

        [Theme2LeftHomeImageview setUserInteractionEnabled:NO];
        [Theme2LeftGuestImageview setUserInteractionEnabled:NO];
        [Theme2RightGuestImageView setUserInteractionEnabled:NO];
        [Theme2RightHomeImageView  setUserInteractionEnabled:NO];
        [guestTextFieldTheme2 setUserInteractionEnabled:NO];
        [homeTextFieldTheme2 setUserInteractionEnabled:NO];
        
        Theme2ViewBigger=NO;
        [Theme2Setting setUserInteractionEnabled:NO];
        [Theme2Reset setUserInteractionEnabled:NO];
        [Theme2Setting setFrame:CGRectMake(310, 2, 20, 20)];
        [Theme2Reset setFrame:CGRectMake(5, 2, 20, 20)];
        [DigitalScoreBordNewTheme2 setFrame:CGRectMake(1252.24, 80,335,189)];
        [DigitalScoreBoardBackGroundTheme2 setFrame:CGRectMake(0, 0, DigitalScoreBordNewTheme2.frame.size.width,  DigitalScoreBordNewTheme2.frame.size.height)];
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x+50, Twitter.frame.origin.y+100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x+50, FacebookButton.frame.origin.y+100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x-50, Instructions.frame.origin.y+100, Instructions.frame.size.width, Instructions.frame.size.height)];
        regulerSBButton.frame=CGRectMake(184, 0, 200, 25);

    
        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(DigitalScoreboardNewtheme1.frame.origin.x+200, DigitalScoreboardNewtheme1.frame.origin.y, DigitalScoreboardNewtheme1.frame.size.width, DigitalScoreboardNewtheme1.frame.size.height)];
        [HomeBorderDigitalTheme2 setFrame:CGRectMake(202, 6, 102, 13)];
        [GuestBorderDigitalTheme2 setFrame:CGRectMake(32, 6, 102, 13)];
        [ScrollViewTheme2 setFrame:CGRectMake(-265, 0,1040,250)];
        
        guestTextFieldTheme2.font = [UIFont systemFontOfSize:12];
        homeTextFieldTheme2.font = [UIFont systemFontOfSize:12];
        
        
        int H=120;
        int W=70;
        int Y=35;
        
        
        
        if(Theme2CourtChange==YES){
            
            [Theme2LeftGuestImageview setFrame:CGRectMake(443,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(519,Y, W, H)];
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(275, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(351, Y, W, H)];
            
            
            [homeTextFieldTheme2 setFrame:CGRectMake(297, 6, 100, 13)];
            [guestTextFieldTheme2 setFrame:CGRectMake(467,6, 100, 13)];
            
            
        }
        else{
            
            
            [Theme2LeftGuestImageview setFrame:CGRectMake(275,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(351,Y, W, H)];
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(443, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(519, Y, W, H)];
            
            
            [homeTextFieldTheme2 setFrame:CGRectMake(455, 6, 130, 17)];
            [guestTextFieldTheme2 setFrame:CGRectMake(279, 6, 130, 17)];
            
        }
    [self performSelector:@selector(FadeOutDigitalTheme21) withObject:nil afterDelay:0.1];
    //    [self.view bringSubviewToFront:adView];
    [UIView commitAnimations];
    
    [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x+105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
    [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x-105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
    homeTextFieldTheme2.alpha=0.0;
    guestTextFieldTheme2.alpha=0.0;
    
}
-(void)TapTheTheme2:(UIGestureRecognizer *)gestur{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [smallScoreBoardbuttonDigitalTheme2 setHidden:NO];
    
    if (Theme2ViewBigger==NO) {
        [LeftSideViewForTap setFrame:CGRectMake(LeftSideViewForTap.frame.origin.x-200, LeftSideViewForTap.frame.origin.y, LeftSideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [RightsideViewForTap setFrame:CGRectMake(RightsideViewForTap.frame.origin.x+200, RightsideViewForTap.frame.origin.y, RightsideViewForTap.frame.size.width, RightsideViewForTap.frame.size.height)];
        [smallScoreBoardbutton setHidden:NO];
        
        [leftShadow setFrame:CGRectMake(leftShadow.frame.origin.x-105, leftShadow.frame.origin.y, leftShadow.frame.size.width, leftShadow.frame.size.height)];
        [RightShadow setFrame:CGRectMake(RightShadow.frame.origin.x+105, RightShadow.frame.origin.y, RightShadow.frame.size.width, RightShadow.frame.size.height)];
        
        
        [Theme2LeftHomeImageview setUserInteractionEnabled:YES];
        [Theme2LeftGuestImageview setUserInteractionEnabled:YES];
        [Theme2RightGuestImageView setUserInteractionEnabled:YES];
        [Theme2RightHomeImageView  setUserInteractionEnabled:YES];
        [guestTextFieldTheme2 setUserInteractionEnabled:YES];
        [homeTextFieldTheme2 setUserInteractionEnabled:YES];
        Theme2ViewBigger=YES;
        [Theme2Setting setUserInteractionEnabled:YES];
        [Theme2Reset setUserInteractionEnabled:YES];
        [DigitalScoreBordNewTheme2 setFrame:CGRectMake(1136, 0,568,320)];
        [DigitalScoreBoardBackGroundTheme2 setFrame:CGRectMake(0, 0,568,320)];
        
        
        [Twitter setFrame:CGRectMake(Twitter.frame.origin.x-50, Twitter.frame.origin.y-100, Twitter.frame.size.width, Twitter.frame.size.height)];
        [FacebookButton setFrame:CGRectMake(FacebookButton.frame.origin.x-50, FacebookButton.frame.origin.y-100, FacebookButton.frame.size.width, FacebookButton.frame.size.height)];
        [Instructions setFrame:CGRectMake(Instructions.frame.origin.x+50, Instructions.frame.origin.y-100, Instructions.frame.size.width, Instructions.frame.size.height)];
        
        regulerSBButton.frame=CGRectMake(184, -100, 200, 25);

        
        
        
        [Theme2Setting setFrame:CGRectMake(527, 3, 35, 35)];
        [Theme2Reset setFrame:CGRectMake(8, 3, 35, 35)];
        
        
        
        
        guestTextFieldTheme2.font = [UIFont systemFontOfSize:22];
        homeTextFieldTheme2.font = [UIFont systemFontOfSize:22];
        //
        
        [DigitalScoreboardNewtheme1 setFrame:CGRectMake(DigitalScoreboardNewtheme1.frame.origin.x-200, DigitalScoreboardNewtheme1.frame.origin.y, DigitalScoreboardNewtheme1.frame.size.width, DigitalScoreboardNewtheme1.frame.size.height)];
        
        [HomeBorderDigitalTheme2 setFrame:CGRectMake(320,10, 200, 24)];
        [GuestBorderDigitalTheme2 setFrame:CGRectMake(50, 10, 200, 24)];
        
        [ScrollViewTheme2 setFrame:CGRectMake(-250, 0,1040,320)];
                
        int H=210;
        int W=130;
        int Y=55;
        
        if (Theme2CourtChange==NO) {
            [Theme2LeftGuestImageview setFrame:CGRectMake(257,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(392,Y, W, H)];
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(548, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(683, Y, W, H)];
            
            [homeTextFieldTheme2 setFrame:CGRectMake(570, 10, 200, 24)];
            [guestTextFieldTheme2 setFrame:CGRectMake(300,10, 200, 24)];
            
            
        }
        else{
            
            [Theme2LeftGuestImageview setFrame:CGRectMake(548,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(683,Y, W, H)];
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(257, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(392, Y, W, H)];
            
            [homeTextFieldTheme2 setFrame:CGRectMake(300, 10, 180, 24)];
            [guestTextFieldTheme2 setFrame:CGRectMake(570,10, 180, 24)];
            
        }
        
        
        [self performSelector:@selector(FadeOutDigitalTheme21) withObject:nil afterDelay:0.1];
        //    [self.view bringSubviewToFront:adView];
        [UIView commitAnimations];
        
        homeTextFieldTheme2.alpha=0.0;
        guestTextFieldTheme2.alpha=0.0;
    }
        
    
    
    
}

-(void)FadeOutDigitalTheme21{
    NSLog(@"its first time");
    homeTextFieldTheme2.alpha=0.20;
    guestTextFieldTheme2.alpha=0.20;
    [self performSelector:@selector(FadeOutDigitalTheme22) withObject:nil afterDelay:0.1];
    
}
-(void)FadeOutDigitalTheme22{
    homeTextFieldTheme2.alpha=0.40;
    guestTextFieldTheme2.alpha=0.40;
    [self performSelector:@selector(FadeOutDigitalTheme23) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme23{
    homeTextFieldTheme2.alpha=0.60;
    guestTextFieldTheme2.alpha=0.60;
    [self performSelector:@selector(FadeOutDigitalTheme24) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme24{
    homeTextFieldTheme2.alpha=0.80;
    guestTextFieldTheme2.alpha=0.80;
    [self performSelector:@selector(FadeOutDigitalTheme25) withObject:nil afterDelay:0.1];
}
-(void)FadeOutDigitalTheme25{
    homeTextFieldTheme2.alpha=1.0;
    guestTextFieldTheme2.alpha=1.0;
    
}

#pragma mark DigitalScoreboard Actions and methods

//////////////////////////////////////////////////Digital////////////////////////////////////////////////////
-(IBAction)timerPlayandPauseButtonClick:(id)sender
{
    UIButton *button=(UIButton *)sender;
    [countdownTimerView playPauseTimer:button];
}
- (IBAction)DigitalsettingsButtonClick:(id)sender {
	
	[UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	
	
	
	BasketballMainViewControllerBigger *basketballSettingsViewController = [[BasketballMainViewControllerBigger alloc]  init];
//    basketballSettingsViewController.homeName=homeTextField.text;
//    basketballSettingsViewController.guestName=guestTextField.text;
//    
//	basketballSettingsViewController.homeScore =homeScoreIndex;
//	basketballSettingsViewController.guestScore = guestScoreIndex;
	[self.navigationController pushViewController:basketballSettingsViewController animated:NO];
	[basketballSettingsViewController release];
}

- (IBAction)DigitalresetButtonClick:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:2  forKey:@"Scorebaordnumber"];
    [prefs synchronize];
    
    UIActionSheet *resetActionSheetForDigital = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reset Names",@"Reset Score", @"Reset Both", nil];
    [resetActionSheetForDigital setTag:100];
    //Revmob reset
    
    [resetActionSheetForDigital showInView:self.view];
    [resetActionSheetForDigital release];
    
	
}


-(void)DigitalmoveScrollViewRight{
	if (DigitalViewBigger==YES) {
        int height=160;
        int width=100;
        int Yposition=84;

        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        //	if (scrollViewDigital.center.x+MOVE_RANGE>1400) {
        //		[scrollViewDigital setCenter:CGPointMake(scrollViewDigital.center.x, scrollViewDigital.center.y)];
        //	}
        //	else {
        //		[scrollViewDigital setCenter:CGPointMake(scrollViewDigital.center.x+365, scrollViewDigital.center.y)];
        //	}
        if (DigitalScoreboardCourtChnage==NO) {
            NSLog(@"THE COURT IS NOT CHANGED");
            
            DigitalScoreboardCourtChnage=YES;
            
            
            
            
            
            [hiddenRightGuestImageView setFrame:CGRectMake(686, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake( 590, Yposition, width, height)];
            
            [rightHomeImageView setFrame:CGRectMake( 377, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake(283, Yposition, width, height)];
            
            [guestTextFieldDigital setFrame:CGRectMake(610, 255, 160, 25)];
            [homeTextFieldDigital setFrame:CGRectMake(300, 255, 160, 25)];
            
            
           

            
            
            
        }
        
        
        
        [UIView commitAnimations];
        //    NSLog(@"The digital scroll view center when sroll right%f",scrollViewDigital.center.x);
        //    self.view.backgroundColor = [UIColor clearColor];
        //    CGRect myImageRectd = CGRectMake( 890, 135, 200, 295);
        //    leftHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectd];
        //    [leftHomeImageView setImage:[UIImage imageNamed:@"off.png"]];
        //    leftHomeImageView.userInteractionEnabled=YES;
        //    //[self.view addSubview:hiddenLeftGuestImageView];
        //    [scrollViewDigital addSubview:leftHomeImageView];
        //
        //
        //
        //    self.view.backgroundColor = [UIColor clearColor];
        //    CGRect myImageRectc = CGRectMake(1030, 135, 200, 295);
        //    rightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectc];
        //    [rightHomeImageView setImage:[UIImage imageNamed:@"off"]];
        //    rightHomeImageView.userInteractionEnabled=YES;
        //    // [self.view addSubview:hiddenRightGuestImageView];
        //    [scrollViewDigital addSubview:rightHomeImageView];
        //
        //
        //
        //
        //
        //    self.view.backgroundColor = [UIColor clearColor];
        //    CGRect myImageRectg = CGRectMake(525, 135, 200, 295);
        //    hiddenLeftGuestImageView = [[UIImageView alloc]initWithFrame:myImageRectg];
        //    [hiddenLeftGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
        //    hiddenLeftGuestImageView.userInteractionEnabled=YES;
        //    //[self.view addSubview:leftGuestImageView];
        //    [scrollViewDigital addSubview:hiddenLeftGuestImageView];
        //
        //
        //
        //    self.view.backgroundColor = [UIColor clearColor];
        //    CGRect myImageRecth = CGRectMake( 665, 135, 200, 295);
        //    hiddenRightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRecth];
        //    [hiddenRightGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
        //    // [self.view addSubview:rightGuestImageView];
        //    hiddenRightGuestImageView.userInteractionEnabled=YES;
        //    [scrollViewDigital addSubview:hiddenRightGuestImageView];
        
    }
}


-(void)DigitalMoveScrollViewLeft{
	
    if (DigitalViewBigger==YES) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        int height=160;
        int width=100;
        int Yposition=84;
        //	if (scrollViewDigital.center.x-MOVE_RANGE<-530) {
        //		[scrollViewDigital setCenter:CGPointMake(scrollViewDigital.center.x, scrollViewDigital.center.y)];
        //	}
        //	else {
        //        if (scrollViewDigital.center.x>512) {
        //
        //		[scrollViewDigital setCenter:CGPointMake(scrollViewDigital.center.x-365, scrollViewDigital.center.y)];
        //        }
        //	}
        
        NSLog(@"The digital scroll view center when sroll Left%f",scrollViewDigital.center.x);
        if (DigitalScoreboardCourtChnage==YES) {
            NSLog(@"THE COURT IS CHANGED ");
            
            DigitalScoreboardCourtChnage=NO;
            //        [hiddenRightGuestImageView setHidden:YES];
            //        [hiddenLeftGuestImageView setHidden:YES];
            //        [rightHomeImageView setHidden:YES];
            //        [leftHomeImageView setHidden:YES];
            
            
            
            [hiddenRightGuestImageView setFrame:CGRectMake(377, Yposition, width, height)];
            [hiddenLeftGuestImageView setFrame:CGRectMake( 283, Yposition, width, height)];
            
            [rightHomeImageView setFrame:CGRectMake( 686, Yposition, width, height)];
            [leftHomeImageView setFrame:CGRectMake(590, Yposition, width, height)];
            
            [guestTextFieldDigital setFrame:CGRectMake(300, 255, 160, 25)];
            [homeTextFieldDigital setFrame:CGRectMake(610, 255, 160, 25)];
            
            
           

            
        }
        [UIView commitAnimations];
	}
}
#pragma mark Image view score change methods
-(void)rightHomeImageViewScoreUp{
	
	selectedImageViewName = @"rightHomeImageView";
	homeScoreIndex +=1;
	if (homeScoreIndex>99) {
		homeScoreIndex=99;
	}
	
	[self homeScoreChange];
}

-(void)rightHomeImageViewScoreDown{
	selectedImageViewName = @"rightHomeImageView";
	homeScoreIndex -=1;
	
	[self homeScoreChange];
}

-(void)leftHomeImageViewScoreUp{
	selectedImageViewName = @"leftHomeImageView";
	homeScoreIndex +=1;
	if (homeScoreIndex>99) {
		homeScoreIndex=99;
	}
	
	[self homeScoreChange];
}

-(void)leftHomeImageViewScoreDown{
	selectedImageViewName = @"leftHomeImageView";
	homeScoreIndex -=1;
	[self homeScoreChange];
}

-(void)rightGuestImageViewScoreUp{
	selectedImageViewName = @"rightGuestImageView";
	guestScoreIndex +=1;
	if (homeScoreIndex>99) {
		homeScoreIndex=99;
	}
	[self guestScoreChange];
}

-(void)rightGuestImageViewScoreDown{
	selectedImageViewName = @"rightGuestImageView";
	guestScoreIndex -=1;
	[self guestScoreChange];
}

-(void)leftGuestImageViewScoreUp{
	selectedImageViewName = @"leftGuestImageView";
	guestScoreIndex +=1;
	[self guestScoreChange];
}

-(void)leftGuestImageViewScoreDown{
	selectedImageViewName = @"leftGuestImageView";
	guestScoreIndex -=1;
	[self guestScoreChange];
}

#pragma mark hidden image scroll methods
-(void)hiddenRightHomeImageViewScoreUp{
	selectedImageViewName = @"hiddenRightHomeImageView";
	homeScoreIndex +=1;
	[self homeScoreChange];
}

-(void)hiddenRightHomeImageViewScoreDown{
	selectedImageViewName = @"hiddenRightHomeImageView";
	homeScoreIndex -=1;
	[self homeScoreChange];
}

-(void)hiddenLeftHomeImageViewScoreUp{
	selectedImageViewName = @"hiddenLeftHomeImageView";
	homeScoreIndex +=1;
	[self homeScoreChange];
}

-(void)hiddenLeftHomeImageViewScoreDown{
	selectedImageViewName = @"hiddenLeftHomeImageView";
	homeScoreIndex -=1;
	[self homeScoreChange];
}

-(void)hiddenRightGuestImageViewScoreUp{
	selectedImageViewName = @"hiddenRightGuestImageView";
	guestScoreIndex +=1;
	[self guestScoreChange];
}

-(void)hiddenRightGuestImageViewScoreDown{
	selectedImageViewName = @"hiddenRightGuestImageView";
	guestScoreIndex -=1;
	[self guestScoreChange];
}

-(void)hiddenLeftGuestImageViewScoreUp{
	selectedImageViewName = @"hiddenLeftGuestImageView";
	guestScoreIndex +=1;
	
	[self guestScoreChange];
}

-(void)hiddenLeftGuestImageViewScoreDown{
	selectedImageViewName = @"hiddenLeftGuestImageView";
	guestScoreIndex -=1;
	[self guestScoreChange];
}


-(void)homeScoreChange
{
	if (homeScoreIndex>99) {
		homeScoreIndex=99;
		return;
	}
	if (homeScoreIndex<0) {
		homeScoreIndex=0;
	}
	
	if(homeScoreIndex<100)
	{
		
		
		int temp=homeScoreIndex;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
		
		[hiddenLeftHomeImageView setAlpha:0.0];
		[leftHomeImageView setAlpha:0.0];
		
		[rightHomeImageView setAlpha:0.0];
		[hiddenRightHomeImageView setAlpha:0.0];
		
		
		[self setupImage:hiddenRightHomeImageView :secondDigit];
		[self setupImage:rightHomeImageView :secondDigit];
		
		
		
		if (firstDigit!=0)
		{
			[self setupImage:hiddenLeftHomeImageView :firstDigit];
			[self setupImage:leftHomeImageView :firstDigit];
		}
		else
		{
			if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==1){
                hiddenLeftHomeImageView.image = [UIImage imageNamed:@"sb0.png"];
                leftHomeImageView.image = [UIImage imageNamed:@"sb0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==2){
                hiddenLeftHomeImageView.image = [UIImage imageNamed:@"dotBlue0.png"];
                leftHomeImageView.image = [UIImage imageNamed:@"dotBlue0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==3){
                hiddenLeftHomeImageView.image = [UIImage imageNamed:@"dotYellow0.png"];
                leftHomeImageView.image = [UIImage imageNamed:@"dotYellow0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==4){
                hiddenLeftHomeImageView.image = [UIImage imageNamed:@"dotWhite0.png"];
                leftHomeImageView.image = [UIImage imageNamed:@"dotWhite0.png"];
            }
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpHome)];
		[UIView commitAnimations];
		
		homeScoreFirstDigit=firstDigit;
	}
	
	
}

-(void)dimUpHome{
	
    
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	
	[hiddenRightHomeImageView setAlpha:1.0];
	[hiddenLeftHomeImageView setAlpha:1.0];
	[rightHomeImageView setAlpha:1.0];
	[leftHomeImageView setAlpha:1.0];
	[UIView commitAnimations];
}
-(void)ChangeColor{
    int tempHome=homeScoreIndex;
    
    int secondDigitHome = tempHome %10;
    tempHome = tempHome/10;
    int firstDigitHome = tempHome;
    
    
    
    
    int temp=guestScoreIndex;
    
    int secondDigit = temp %10;
    temp = temp/10;
    int firstDigit = temp;
    
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==1){
        
        hiddenLeftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",firstDigit]];
        leftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",firstDigit]];
        
        
        hiddenRightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",secondDigit]];
        rightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",secondDigit]];
        
        
        hiddenLeftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",firstDigitHome]];
        leftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",firstDigitHome]];
        
        
        hiddenRightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",secondDigitHome]];
        rightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sb%d.png",secondDigitHome]];
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==2){
        hiddenLeftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",firstDigit]];
        leftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",firstDigit]];
        
        hiddenRightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",secondDigit]];
        rightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",secondDigit]];
        
        
        
        hiddenLeftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",firstDigitHome]];
        leftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",firstDigitHome]];
        
        hiddenRightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",secondDigitHome]];
        rightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotBlue%d.png",secondDigitHome]];
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==3){
        hiddenLeftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",firstDigit]];
        leftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",firstDigit]];
        
        hiddenRightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",secondDigit]];
        rightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",secondDigit]];
        
        
        hiddenLeftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",firstDigitHome]];
        leftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",firstDigitHome]];
        
        hiddenRightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",secondDigitHome]];
        rightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotYellow%d.png",secondDigitHome]];
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==4){
        hiddenLeftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",firstDigit]];
        leftGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",firstDigit]];
        
        hiddenRightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",secondDigit]];
        rightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",secondDigit]];
        
        hiddenLeftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",firstDigitHome]];
        leftHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",firstDigitHome]];
        
        hiddenRightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",secondDigitHome]];
        rightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dotWhite%d.png",secondDigitHome]];
    }
    
    
    
    
}

-(void)guestScoreChange
{
	if (guestScoreIndex>99) {
		guestScoreIndex=99;
		return;
	}
	if (guestScoreIndex<0) {
		guestScoreIndex=0;
		return;
	}
	
	if(guestScoreIndex<100)
	{
		
		int temp=guestScoreIndex;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
		[hiddenLeftGuestImageView setAlpha:0.0];
		[leftGuestImageView setAlpha:0.0];
		
		[rightGuestImageView setAlpha:0.0];
		[hiddenRightGuestImageView setAlpha:0.0];
		
		
		
		[self setupImage:hiddenRightGuestImageView :secondDigit];
		[self setupImage:rightGuestImageView :secondDigit];
		
		
		if (firstDigit!=0)
		{
			
			[self setupImage:hiddenLeftGuestImageView :firstDigit];
			[self setupImage:leftGuestImageView :firstDigit];
		}
		else
		{
			
            
            
            
            if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==1){
                hiddenLeftGuestImageView.image = [UIImage imageNamed:@"sb0.png"];
                leftGuestImageView.image = [UIImage imageNamed:@"sb0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==2){
                hiddenLeftGuestImageView.image = [UIImage imageNamed:@"dotBlue0.png"];
                leftGuestImageView.image = [UIImage imageNamed:@"dotBlue0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==3){
                hiddenLeftGuestImageView.image = [UIImage imageNamed:@"dotYellow0.png"];
                leftGuestImageView.image = [UIImage imageNamed:@"dotYellow0.png"];
            }
            else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==4){
                hiddenLeftGuestImageView.image = [UIImage imageNamed:@"dotWhite0.png"];
                leftGuestImageView.image = [UIImage imageNamed:@"dotWhite0.png"];
            }
            
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpGuest)];
		[UIView commitAnimations];
		
		guestScoreFirstDigit = firstDigit;
        
	}
    
}

-(void)dimUpGuest
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[hiddenRightGuestImageView setAlpha:1.0];
	[hiddenLeftGuestImageView setAlpha:1.0];
	[rightGuestImageView setAlpha:1.0];
	[leftGuestImageView setAlpha:1.0];
	[UIView commitAnimations];
	
	
}

-(void)setupImage:(UIImageView*)imgView :(int)digit{
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==1) {
        
        switch (digit) {
                
            case 0:
                [imgView setImage:[UIImage imageNamed:@"sb0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"sb1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"sb2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"sb3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"sb4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"sb5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"sb6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"sb7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"sb8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"sb9.png"]];
                break;
        }
	}
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==2) {
        
        switch (digit) {
                
            case 0:
                [imgView setImage:[UIImage imageNamed:@"dotBlue0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"dotBlue1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"dotBlue2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"dotBlue3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"dotBlue4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"dotBlue5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"dotBlue6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"dotBlue7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"dotBlue8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"dotBlue9.png"]];
                break;
        }
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==3) {
        
        switch (digit) {
                
            case 0:
                [imgView setImage:[UIImage imageNamed:@"dotYellow0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"dotYellow1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"dotYellow2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"dotYellow3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"dotYellow4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"dotYellow5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"dotYellow6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"dotYellow7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"dotYellow8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"dotYellow9.png"]];
                break;
        }
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"]==4) {
        
        switch (digit) {
                
            case 0:
                [imgView setImage:[UIImage imageNamed:@"dotWhite0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"dotWhite1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"dotWhite2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"dotWhite3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"dotWhite4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"dotWhite5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"dotWhite6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"dotWhite7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"dotWhite8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"dotWhite9.png"]];
                break;
        }
    }
    
    
}

#pragma mark Tap to incerse Score
-(void)homeScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    
    selectedImageViewName = @"rightHomeImageView";
    selectedImageViewName = @"leftHomeImageView";
	homeScoreIndex +=1;
	if (homeScoreIndex>99)
    {
		homeScoreIndex=99;
	}
    
    [self homeScoreChange];
}
-(void)guestScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewName = @"rightGuestImageView";
    selectedImageViewName = @"leftGuestImageView";
	guestScoreIndex +=1;
	if (homeScoreIndex>99) {
		homeScoreIndex=99;
	}
	[self guestScoreChange];
    
}
-(void)hiddenHomeScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewName = @"hiddenRightHomeImageView";
    selectedImageViewName = @"hiddenLeftHomeImageView";
	homeScoreIndex +=1;
	[self homeScoreChange];
}
-(void)hiddenGuestScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewName = @"hiddenRightGuestImageView";
    selectedImageViewName = @"hiddenLeftGuestImageView";
	guestScoreIndex +=1;
	[self guestScoreChange];
}







#pragma mark DigitalScoreboardNewtheme1 Screen designs
-(void)DigitalScoreboardNewtheme1ScreenDesign{
    CGRect Boders = CGRectMake(206.5, 155, 100, 13);
    HomeBorderDigitalTheme1 = [[UIImageView alloc]initWithFrame:Boders];
    [HomeBorderDigitalTheme1 setImage:[UIImage imageNamed:@"DigitslLabels.png"]];
    [DigitalScoreboardNewtheme1 addSubview:HomeBorderDigitalTheme1];
    
    CGRect GuestBorderImage = CGRectMake(28.5, 155, 100, 13);
    GuestBorderDigitalTheme1 = [[UIImageView alloc]initWithFrame:GuestBorderImage];
    [GuestBorderDigitalTheme1 setImage:[UIImage imageNamed:@"DigitslLabels.png"]];
    [DigitalScoreboardNewtheme1 addSubview:GuestBorderDigitalTheme1];
    
    
    
    
    scrollViewTheme1 = [[UIScrollView alloc] initWithFrame:CGRectMake(-250, 0,1040,DigitalScoreboardNewtheme1.frame.size.height)];
    scrollViewTheme1.contentSize = CGSizeMake(480, DigitalScoreboardNewtheme1.frame.size.height);
    scrollViewTheme1.showsHorizontalScrollIndicator = YES;
    [scrollViewTheme1 setBackgroundColor:[UIColor clearColor]];
    
    [DigitalScoreboardNewtheme1 addSubview:scrollViewTheme1];
    
    
    int TutorialImageHeight=46;
    int TutorialImageWidth=32;
    int TutorialImageY=7;
    //
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect = CGRectMake( 228, 10, 15, 50);
    CGRect myImageRect1 = CGRectMake( 103, TutorialImageY, TutorialImageWidth, TutorialImageHeight);
    tutorialImageViewTheme11 = [[UIImageView alloc]initWithFrame:myImageRect1];
    [tutorialImageViewTheme11 setImage:[UIImage imageNamed:@"orange0.png"]];
    [DigitalScoreboardNewtheme1 addSubview:tutorialImageViewTheme11];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect2 = CGRectMake( 206, 10, 20, 50);
    CGRect myImageRect2 = CGRectMake( 131, TutorialImageY, TutorialImageWidth, TutorialImageHeight);
    tutorialImageViewTheme12 = [[UIImageView alloc]initWithFrame:myImageRect2];
    [tutorialImageViewTheme12 setImage:[UIImage imageNamed:@"orange0.png"]];
    [DigitalScoreboardNewtheme1 addSubview:tutorialImageViewTheme12];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect3 = CGRectMake( 244, 10, 20, 50);
    CGRect myImageRect3 = CGRectMake( 172, TutorialImageY, TutorialImageWidth, TutorialImageHeight);
    tutorialImageViewTheme13 = [[UIImageView alloc]initWithFrame:myImageRect3];
    [tutorialImageViewTheme13 setImage:[UIImage imageNamed:@"orange0.png"]];
    [DigitalScoreboardNewtheme1 addSubview:tutorialImageViewTheme13];
    
    self.view.backgroundColor = [UIColor clearColor];
    //CGRect myImageRect4 = CGRectMake( 265, 10, 20, 50);
    CGRect myImageRect4 = CGRectMake(200, TutorialImageY, TutorialImageWidth, TutorialImageHeight);
    tutorialImageViewTheme14 = [[UIImageView alloc]initWithFrame:myImageRect4];
    [tutorialImageViewTheme14 setImage:[UIImage imageNamed:@"orange0.png"]];
    [DigitalScoreboardNewtheme1 addSubview:tutorialImageViewTheme14];
    
    
    
    twoDotsTheme1 =[[UIImageView alloc]initWithFrame:CGRectMake(165, 16, 5, 30)];
    [twoDotsTheme1 setImage:[UIImage imageNamed:@"twoDot.png"]];
    [DigitalScoreBoardBackGroundTheme1 addSubview:twoDotsTheme1];
    
     
   
    
    
    
    
    [twoDotsTheme1 setFrame:CGRectMake(165, 16, 5, 30)];
    [tutorialImageViewTheme11 setFrame:CGRectMake(103, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
    [tutorialImageViewTheme12 setFrame:CGRectMake(131, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
    [tutorialImageViewTheme13 setFrame:CGRectMake(172, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
    [tutorialImageViewTheme14 setFrame:CGRectMake(200, TutorialImageY, TutorialImageWidth, TutorialImageHeight)];
    
    
    
    
    
    countdownTimerViewTheme1.minuteImage1Theme1=tutorialImageViewTheme11;
    countdownTimerViewTheme1.minuteImage2Theme1=tutorialImageViewTheme12;
    countdownTimerViewTheme1.secondImage1Theme1=tutorialImageViewTheme13;
    countdownTimerViewTheme1.secondImage2Theme1=tutorialImageViewTheme14;
    
    
    
    
    
    
    hiddenHomeTextFieldTheme1 = [[UITextField alloc] initWithFrame:CGRectMake(70, 14, 120, 17)];
    hiddenHomeTextFieldTheme1.borderStyle = UITextBorderStyleBezel;
    hiddenHomeTextFieldTheme1.textColor = [UIColor blackColor];
    hiddenHomeTextFieldTheme1.font = [UIFont systemFontOfSize:35];
    hiddenHomeTextFieldTheme1.placeholder = @"Home";
    hiddenHomeTextFieldTheme1.textAlignment=UITextAlignmentCenter;
    hiddenHomeTextFieldTheme1.autocorrectionType = UITextAutocorrectionTypeNo;
    hiddenHomeTextFieldTheme1.backgroundColor = [UIColor clearColor];
    hiddenHomeTextFieldTheme1.keyboardType = UIKeyboardTypeDefault;
    hiddenHomeTextFieldTheme1.returnKeyType = UIReturnKeyDone;
    hiddenHomeTextFieldTheme1.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollViewTheme1 addSubview:hiddenHomeTextFieldTheme1];
    hiddenHomeTextFieldTheme1.delegate = self;
    
    [hiddenHomeTextFieldTheme1 setHidden:YES];
    
    guestTextFieldTheme1 = [[UITextField alloc] initWithFrame:CGRectMake(279, 154, 100, 13)];
     //guestTextFieldTheme1.borderStyle = UITextBorderStyleBezel;
    guestTextFieldTheme1.textColor = [UIColor whiteColor];
    guestTextFieldTheme1.font = [UIFont systemFontOfSize:12];
    guestTextFieldTheme1.text = @"Guest";
    guestTextFieldTheme1.textAlignment=UITextAlignmentCenter;
    guestTextFieldTheme1.backgroundColor = [UIColor clearColor];
    guestTextFieldTheme1.autocorrectionType = UITextAutocorrectionTypeNo;
    guestTextFieldTheme1.keyboardType = UIKeyboardTypeDefault;
    guestTextFieldTheme1.returnKeyType = UIReturnKeyDone;
    guestTextFieldTheme1.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollViewTheme1 addSubview:guestTextFieldTheme1];
    guestTextFieldTheme1.delegate = self;
    
    
    homeTextFieldTheme1 = [[UITextField alloc] initWithFrame:CGRectMake(457, 154, 100, 13)];
    // homeTextFieldTheme1.borderStyle = UITextBorderStyleBezel;
    homeTextFieldTheme1.textColor = [UIColor whiteColor];
    homeTextFieldTheme1.font = [UIFont systemFontOfSize:12];
    homeTextFieldTheme1.text = @"Home";
    homeTextFieldTheme1.textAlignment=UITextAlignmentCenter;
    homeTextFieldTheme1.autocorrectionType = UITextAutocorrectionTypeNo;
    homeTextFieldTheme1.backgroundColor = [UIColor clearColor];
    homeTextFieldTheme1.keyboardType = UIKeyboardTypeDefault;
    homeTextFieldTheme1.returnKeyType = UIReturnKeyDone;
    homeTextFieldTheme1.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollViewTheme1 addSubview:homeTextFieldTheme1];
    homeTextFieldTheme1.delegate = self;
    
    
    hiddenGuestTextFieldTheme1 = [[UITextField alloc] initWithFrame:CGRectMake(1335, 218, 120, 17)];
    // hiddenGuestTextFieldTheme1.borderStyle = UITextBorderStyleBezel;
    hiddenGuestTextFieldTheme1.textColor = [UIColor whiteColor];
    hiddenGuestTextFieldTheme1.font = [UIFont systemFontOfSize:35];
    hiddenGuestTextFieldTheme1.placeholder = @"Guest";
    hiddenGuestTextFieldTheme1.textAlignment=UITextAlignmentCenter;
    hiddenGuestTextFieldTheme1.backgroundColor = [UIColor blackColor];
    hiddenGuestTextFieldTheme1.autocorrectionType = UITextAutocorrectionTypeNo;
    hiddenGuestTextFieldTheme1.keyboardType = UIKeyboardTypeDefault;
    hiddenGuestTextFieldTheme1.returnKeyType = UIReturnKeyDone;
    hiddenGuestTextFieldTheme1.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollViewTheme1 addSubview:hiddenGuestTextFieldTheme1];
    hiddenGuestTextFieldTheme1.delegate = self;
    [hiddenGuestTextFieldTheme1 setHidden:YES];
    
    UIImage * resetImage = [UIImage imageNamed:@"Vball-reset.png"];
    resetButtonTheme1 = [UIButton buttonWithType:UIButtonTypeCustom];
    resetButtonTheme1.frame = CGRectMake(155,100, 25,25);
    [resetButtonTheme1 addTarget:self action:@selector(Theme1resetButtonClick:)
                forControlEvents:UIControlEventTouchUpInside];
    [resetButtonTheme1 setImage:resetImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [DigitalScoreboardNewtheme1 addSubview: resetButtonTheme1];
    UIImage * settingImage = [UIImage imageNamed:@"Vball-settings.png"];
    settingButtonTheme1 = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButtonTheme1.frame = CGRectMake(155,125,25,25);
    [settingButtonTheme1 addTarget:self action:@selector(Theme1settingsButtonClick:)
                  forControlEvents:UIControlEventTouchUpInside];
    [settingButtonTheme1 setImage:settingImage forState:UIControlStateNormal];
    //[scrollView addSubview:settingButton];
    [DigitalScoreboardNewtheme1 addSubview: settingButtonTheme1];
    
    smallScoreBoardbuttonDigitalTheme1=[[UIButton alloc]init];
    [smallScoreBoardbuttonDigitalTheme1 setFrame:CGRectMake(252, 285, 65, 35)];
    
    [smallScoreBoardbuttonDigitalTheme1 addTarget:self action:@selector(backButtonDigitalTheme1:)forControlEvents:UIControlEventTouchUpInside];
    [smallScoreBoardbuttonDigitalTheme1 setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [DigitalScoreboardNewtheme1 addSubview:smallScoreBoardbuttonDigitalTheme1];
    [smallScoreBoardbuttonDigitalTheme1 setHidden:YES];

    
    CustonPeriodbutton=[[UIButton alloc]initWithFrame:CGRectMake(241, 135, 86, 40)];
    
    [CustonPeriodbutton setBackgroundColor:[UIColor clearColor]];
    [DigitalScoreboardNewtheme1 addSubview:CustonPeriodbutton];
    [CustonPeriodbutton setUserInteractionEnabled:NO];
    
    [CustonPeriodbutton addTarget:self action:@selector(PeriodButtonClick:)forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *PeriodButtonImage=[UIImage imageNamed:@"periodLightOn.png"];
    
    
    Periodbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    Periodbutton.frame=CGRectMake(148.5, 95.5, 7.5,7.5);
    [Periodbutton addTarget:self action:@selector(PeriodButtonClick:)
           forControlEvents:UIControlEventTouchUpInside];
    [Periodbutton setImage:PeriodButtonImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [DigitalScoreboardNewtheme1 addSubview: Periodbutton];
    
    
    
    PeriodButton1=[UIButton buttonWithType:UIButtonTypeCustom];
    PeriodButton1.frame=CGRectMake(158.5, 95.5, 7.5, 7.5);
    [PeriodButton1 addTarget:self action:@selector(PeriodButtonClick:)
            forControlEvents:UIControlEventTouchUpInside];
    [PeriodButton1 setImage:PeriodButtonImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [PeriodButton1 setUserInteractionEnabled:NO];
    
    [DigitalScoreboardNewtheme1 addSubview: PeriodButton1];
    
    PeriodButton2=[UIButton buttonWithType:UIButtonTypeCustom];
    PeriodButton2.frame=CGRectMake(168.5, 95.5, 7.5, 7.5);
    [PeriodButton2 addTarget:self action:@selector(PeriodButtonClick:)
            forControlEvents:UIControlEventTouchUpInside];
    [PeriodButton2 setImage:PeriodButtonImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [PeriodButton2 setUserInteractionEnabled:NO];
    
    [DigitalScoreboardNewtheme1 addSubview: PeriodButton2];
    
    
    PeriodButton3=[UIButton buttonWithType:UIButtonTypeCustom];
    PeriodButton3.frame=CGRectMake(178.5, 95.5, 7.5, 7.5);
    [PeriodButton3 addTarget:self action:@selector(PeriodButtonClick:)
            forControlEvents:UIControlEventTouchUpInside];
    [PeriodButton3 setImage:PeriodButtonImage forState:UIControlStateNormal];
    // [scrollView addSubview:resetButton];
    [PeriodButton3 setUserInteractionEnabled:NO];
    
    [DigitalScoreboardNewtheme1 addSubview: PeriodButton3];
    [PeriodButton3 setHidden:YES];
    [PeriodButton2 setHidden:YES];
    [PeriodButton1 setHidden:YES];
    [Periodbutton setUserInteractionEnabled:NO];
    PeriodButtonNumber=1;
    
    Periodbutton.frame=CGRectMake(148.5, 82, 7.5,7.5);
    PeriodButton1.frame=CGRectMake(158.5, 82, 7.5, 7.5);
    PeriodButton2.frame=CGRectMake(168.5, 82, 7.5, 7.5);
    PeriodButton3.frame=CGRectMake(178.5, 82, 7.5, 7.5);
    
    UIImage *timerPlayandPauseButtonImage = [UIImage imageNamed:@"play.png"];
    Theme1PlayPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    Theme1PlayPauseButton.frame = CGRectMake(162,58, 15, 15);

    [DigitalScoreboardNewtheme1 addSubview:Theme1PlayPauseButton];
    //[scrollView addSubview:timerPlayandPauseButton];
    [Theme1PlayPauseButton addTarget:self action:@selector(timerPlayandPauseButtonClickTheme1:)
                    forControlEvents:UIControlEventTouchUpInside];
    [Theme1PlayPauseButton setImage:timerPlayandPauseButtonImage forState:UIControlStateNormal];
    // [Theme1PlayPauseButton setUserInteractionEnabled:NO];
    
    int H=82;
    int W=60;
    int Y=64;
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecthiddenHome = CGRectMake( 90, Y, W, H);
    hiddenRightHomeImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRecthiddenHome];
    [hiddenRightHomeImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenRightHomeImageViewTheme1.userInteractionEnabled=YES;
    [scrollViewTheme1 addSubview:hiddenRightHomeImageViewTheme1];
    [hiddenRightHomeImageViewTheme1 setHidden:YES];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecthiddenHomeLeft = CGRectMake( 0, Y, W, H);
    hiddenLeftHomeImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRecthiddenHomeLeft];
    [hiddenLeftHomeImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenLeftHomeImageViewTheme1.userInteractionEnabled=YES;
    [scrollViewTheme1 addSubview:hiddenLeftHomeImageViewTheme1];
    [hiddenLeftHomeImageViewTheme1 setHidden:YES];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect7 = CGRectMake(140,Y, W, H);
    leftGuestImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRect7];
    [leftGuestImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    leftGuestImageViewTheme1.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];
    
    [scrollViewTheme1 addSubview:leftGuestImageViewTheme1];
    
    [leftGuestImageViewTheme1 setHidden:YES];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect8 = CGRectMake( 170.5, Y, W, H);
    rightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect8];
    [rightGuestImageView setImage:[UIImage imageNamed:@"lineRed0.png"]];
    // [self.view addSubview:rightGuestImageView];
    rightGuestImageView.userInteractionEnabled=YES;
    [scrollViewTheme1 addSubview:rightGuestImageView];
    
    
    [rightGuestImageView setHidden:YES];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectd = CGRectMake( 271,Y, W, H);
    leftHomeImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRectd];
    [leftHomeImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    leftHomeImageViewTheme1.userInteractionEnabled=YES;
    //[self.view addSubview:hiddenLeftGuestImageView];
    [scrollViewTheme1 addSubview:leftHomeImageViewTheme1];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectc = CGRectMake(325, Y, W, H);
    rightHomeImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRectc];
    [rightHomeImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    rightHomeImageViewTheme1.userInteractionEnabled=YES;
    // [self.view addSubview:hiddenRightGuestImageView];
    [scrollViewTheme1 addSubview:rightHomeImageViewTheme1];
    
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectg = CGRectMake( 450, Y, W, H);
    hiddenLeftGuestImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRectg];
    [hiddenLeftGuestImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    hiddenLeftGuestImageViewTheme1.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];
    [scrollViewTheme1 addSubview:hiddenLeftGuestImageViewTheme1];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecth = CGRectMake( 504, Y, W, H);
    hiddenRightGuestImageViewTheme1 = [[UIImageView alloc]initWithFrame:myImageRecth];
    [hiddenRightGuestImageViewTheme1 setImage:[UIImage imageNamed:@"lineRed0.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenRightGuestImageViewTheme1.userInteractionEnabled=YES;
    [scrollViewTheme1 addSubview:hiddenRightGuestImageViewTheme1];
    
    
    
    UISwipeGestureRecognizer *leftSwipeUpScrollTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalNewTheme1MoveScrollViewLeft)] autorelease];
	leftSwipeUpScrollTheme1.direction = UISwipeGestureRecognizerDirectionLeft;
	[scrollViewTheme1 addGestureRecognizer:leftSwipeUpScrollTheme1];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDownScrollTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalNewTheme1moveScrollViewRight)] autorelease];
	rightSwipeDownScrollTheme1.direction = UISwipeGestureRecognizerDirectionRight;
	[scrollViewTheme1 addGestureRecognizer:rightSwipeDownScrollTheme1];
    
    
    
    
    
    
    
    
    UISwipeGestureRecognizer *rightHomeImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1rightHomeImageViewScoreUp)] autorelease];
	rightHomeImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[rightHomeImageViewTheme1 addGestureRecognizer:rightHomeImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *rightHomeImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1rightHomeImageViewScoreDown)] autorelease];
	rightHomeImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[rightHomeImageViewTheme1 addGestureRecognizer:rightHomeImageViewSwipeDownTheme1];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *leftHomeImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1leftHomeImageViewScoreUp)] autorelease];
	leftHomeImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[leftHomeImageViewTheme1 addGestureRecognizer:leftHomeImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *leftHomeImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1leftHomeImageViewScoreDown)] autorelease];
	leftHomeImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[leftHomeImageViewTheme1 addGestureRecognizer:leftHomeImageViewSwipeDownTheme1];
    
    
    
    
    UISwipeGestureRecognizer *rightGuestImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1rightGuestImageViewScoreUp)] autorelease];
	rightGuestImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[rightGuestImageViewTheme1 addGestureRecognizer:rightGuestImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *rightGuestImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1rightGuestImageViewScoreDown)] autorelease];
	rightGuestImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[rightGuestImageViewTheme1 addGestureRecognizer:rightGuestImageViewSwipeDownTheme1];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *leftGuestImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1leftGuestImageViewScoreUp)] autorelease];
	leftGuestImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[leftGuestImageViewTheme1 addGestureRecognizer:leftGuestImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *leftGuestImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1leftGuestImageViewScoreDown)] autorelease];
	leftGuestImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[leftGuestImageViewTheme1 addGestureRecognizer:leftGuestImageViewSwipeDownTheme1];
    
    
    
    UISwipeGestureRecognizer *hiddenRightHomeImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenRightHomeImageViewScoreUp)] autorelease];
	hiddenRightHomeImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenRightHomeImageViewTheme1 addGestureRecognizer:hiddenRightHomeImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *hiddenRightHomeImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenRightHomeImageViewScoreDown)] autorelease];
	hiddenRightHomeImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenRightHomeImageViewTheme1 addGestureRecognizer:hiddenRightHomeImageViewSwipeDownTheme1];
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenLeftHomeImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenLeftHomeImageViewScoreUp)] autorelease];
	hiddenLeftHomeImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenLeftHomeImageViewTheme1 addGestureRecognizer:hiddenLeftHomeImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *hiddenLeftHomeImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenLeftHomeImageViewScoreDown)] autorelease];
	hiddenLeftHomeImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenLeftHomeImageViewTheme1 addGestureRecognizer:hiddenLeftHomeImageViewSwipeDownTheme1];
	
    
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenRightGuestImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenRightGuestImageViewScoreUp)] autorelease];
	hiddenRightGuestImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenRightGuestImageViewTheme1 addGestureRecognizer:hiddenRightGuestImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *hiddenRightGuestImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenRightGuestImageViewScoreDown)] autorelease];
	hiddenRightGuestImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenRightGuestImageViewTheme1 addGestureRecognizer:hiddenRightGuestImageViewSwipeDownTheme1];
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *hiddenLeftGuestImageViewSwipeUpTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenLeftGuestImageViewScoreUp)] autorelease];
	hiddenLeftGuestImageViewSwipeUpTheme1.direction = UISwipeGestureRecognizerDirectionUp;
	[hiddenLeftGuestImageViewTheme1 addGestureRecognizer:hiddenLeftGuestImageViewSwipeUpTheme1];
	
	UISwipeGestureRecognizer *hiddenLeftGuestImageViewSwipeDownTheme1 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenLeftGuestImageViewScoreDown)] autorelease];
	hiddenLeftGuestImageViewSwipeDownTheme1.direction = UISwipeGestureRecognizerDirectionDown;
	[hiddenLeftGuestImageViewTheme1 addGestureRecognizer:hiddenLeftGuestImageViewSwipeDownTheme1];
    
    //tap gesture
    //1
    UITapGestureRecognizer *rightHomeScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1homeScoreChangeWithTap:)];
    [rightHomeScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [rightHomeScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [rightHomeImageViewTheme1 addGestureRecognizer:rightHomeScoreImageTapTheme1];
    
    UITapGestureRecognizer *leftHomeScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1homeScoreChangeWithTap:)];
    [leftHomeScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [leftHomeScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [leftHomeImageViewTheme1 addGestureRecognizer:leftHomeScoreImageTapTheme1];
    
    //2
    UITapGestureRecognizer *rightGuestScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1guestScoreChangeWithTap:)];
    [rightGuestScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [rightGuestScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [rightGuestImageViewTheme1 addGestureRecognizer:rightGuestScoreImageTapTheme1];
    
    UITapGestureRecognizer *leftGuestScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1guestScoreChangeWithTap:)];
    [leftGuestScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [leftGuestScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [leftGuestImageViewTheme1 addGestureRecognizer:leftGuestScoreImageTapTheme1];
    //3
    UITapGestureRecognizer *hiddenRightHomeScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenHomeScoreChangeWithTap:)];
    [hiddenRightHomeScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [hiddenRightHomeScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [hiddenRightHomeImageViewTheme1 addGestureRecognizer:hiddenRightHomeScoreImageTapTheme1];
    
    UITapGestureRecognizer *hiddenLeftHomeScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenHomeScoreChangeWithTap:)];
    [hiddenLeftHomeScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [hiddenLeftHomeScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [hiddenLeftHomeImageViewTheme1 addGestureRecognizer:hiddenLeftHomeScoreImageTapTheme1];
    //4
    UITapGestureRecognizer *hiddenRightGuestScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenGuestScoreChangeWithTap:)];
    [hiddenRightGuestScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [hiddenRightGuestScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [hiddenRightGuestImageViewTheme1 addGestureRecognizer:hiddenRightGuestScoreImageTapTheme1];
    
    UITapGestureRecognizer *hiddenLeftGuestScoreImageTapTheme1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme1hiddenGuestScoreChangeWithTap:)];
    [hiddenLeftGuestScoreImageTapTheme1 setNumberOfTapsRequired:1];
    [hiddenLeftGuestScoreImageTapTheme1 setNumberOfTouchesRequired:1];
    [hiddenLeftGuestImageViewTheme1 addGestureRecognizer:hiddenLeftGuestScoreImageTapTheme1];
    
	[self homeScoreChangeTheme1];
    [self guestScoreChangeTheme1];
    [scrollViewTheme1 bringSubviewToFront:homeTextFieldTheme1];
    [scrollViewTheme1 bringSubviewToFront:guestTextFieldTheme1];
    hiddenLeftGuestImageViewTheme1.userInteractionEnabled=NO;
    hiddenRightGuestImageViewTheme1.userInteractionEnabled=NO;
    rightHomeImageViewTheme1.userInteractionEnabled=NO;
    leftHomeImageViewTheme1.userInteractionEnabled=NO;
    guestTextFieldTheme1.userInteractionEnabled=NO;
    homeTextFieldTheme1.userInteractionEnabled=NO;
    resetButtonTheme1.userInteractionEnabled=NO;
    settingButtonTheme1.userInteractionEnabled=NO;
    
    
    
}
#pragma mark Digital New Theme 1 Actions and common actions and method
- (IBAction)Theme1resetButtonClick:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:3  forKey:@"Scorebaordnumber"];
    [prefs synchronize];
    
    UIActionSheet *resetActionSheetForDigital = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reset Names",@"Reset Score", @"Reset Both", nil];
    [resetActionSheetForDigital setTag:100];
    //Revmob reset
    
    [resetActionSheetForDigital showInView:self.view];
    [resetActionSheetForDigital release];
    
	
}
-(IBAction)timerPlayandPauseButtonClickTheme1:(id)sender
{
    NSLog(@"its working");
    
    UIButton *button=(UIButton *)sender;
    [countdownTimerViewTheme1 playPauseTimer:button];
}
-(IBAction)PeriodButtonClick:(id)sender{
    if (PeriodButtonNumber==1) {
        [PeriodButton3 setHidden:YES];
        [PeriodButton2 setHidden:YES];
        [PeriodButton1 setHidden:NO];
        
        
    }
    else if(PeriodButtonNumber==2){
        [PeriodButton3 setHidden:YES];
        [PeriodButton2 setHidden:NO];
        [PeriodButton1 setHidden:NO];
        
    }
    else if(PeriodButtonNumber==3){
        [PeriodButton3 setHidden:NO];
        [PeriodButton2 setHidden:NO];
        [PeriodButton1 setHidden:NO];
        
    }
    else if(PeriodButtonNumber==4){
        [PeriodButton3 setHidden:YES];
        [PeriodButton2 setHidden:YES];
        [PeriodButton1 setHidden:YES];
        
    }
    if(PeriodButtonNumber<4){
        PeriodButtonNumber++;
    }
    else{
        PeriodButtonNumber=1;
        
    }
    
    
}

-(void)Theme1ColorChange{
    int tempHome=homeScoreIndexTheme1;
    
    int secondDigitHome = tempHome %10;
    tempHome = tempHome/10;
    int firstDigitHome = tempHome;
    
    
    
    
    int temp=guestScoreIndexTheme1;
    
    int secondDigit = temp %10;
    temp = temp/10;
    int firstDigit = temp;
    
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==1){
        
        hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",firstDigit]];
        leftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",firstDigit]];
        
        
        hiddenRightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",secondDigit]];
        rightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",secondDigit]];
        
        
        hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",firstDigitHome]];
        leftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",firstDigitHome]];
        
        
        hiddenRightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",secondDigitHome]];
        rightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineRed%d.png",secondDigitHome]];
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==2){
        hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",firstDigit]];
        leftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",firstDigit]];
        
        hiddenRightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",secondDigit]];
        rightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",secondDigit]];
        
        
        
        hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",firstDigitHome]];
        leftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",firstDigitHome]];
        
        hiddenRightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",secondDigitHome]];
        rightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineBlue%d.png",secondDigitHome]];
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==3){
        hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",firstDigit]];
        leftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",firstDigit]];
        
        hiddenRightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",secondDigit]];
        rightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",secondDigit]];
        
        
        hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",firstDigitHome]];
        leftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",firstDigitHome]];
        
        hiddenRightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",secondDigitHome]];
        rightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineYellow%d.png",secondDigitHome]];
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==4){
        hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",firstDigit]];
        leftGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",firstDigit]];
        
        hiddenRightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",secondDigit]];
        rightGuestImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",secondDigit]];
        
        hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",firstDigitHome]];
        leftHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",firstDigitHome]];
        
        hiddenRightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",secondDigitHome]];
        rightHomeImageViewTheme1.image = [UIImage imageNamed:[NSString stringWithFormat:@"lineWhite%d.png",secondDigitHome]];
    }
    
    
}
-(void)DigitalNewTheme1moveScrollViewRight{
    if (Theme1Bigger==YES) {
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        int H=145;
        int W=100;
        int Y=106;
        if (Theme1CourtChange==NO) {
            Theme1CourtChange=YES;
            
            NSLog(@"Court changes yes");
            
            
            
            
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(290, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(375, Y, W, H)];
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(593,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(678,Y, W, H)];
            
            
            [guestTextFieldTheme1 setFrame:CGRectMake(595, 257, 180, 22)];
            [homeTextFieldTheme1 setFrame:CGRectMake(293, 257, 180, 22)];
            
            
            
           
            
        }
        
        
        //	if (scrollViewTheme1.center.x+MOVE_RANGE>1400) {
        //		[scrollViewTheme1 setCenter:CGPointMake(scrollViewTheme1.center.x, scrollViewTheme1.center.y)];
        //	}
        //	else {
        //		[scrollViewTheme1 setCenter:CGPointMake(scrollViewTheme1.center.x+395, scrollViewTheme1.center.y)];
        //	}
        [UIView commitAnimations];
        NSLog(@"The digital scroll view center when sroll right%f",scrollViewTheme1.center.x);
        
	}
}


-(void)DigitalNewTheme1MoveScrollViewLeft{
    if (Theme1Bigger==YES) {
        int H=145;
        int W=100;
        int Y=106;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        
        if (Theme1CourtChange==YES) {
            
            NSLog(@"Court changes NO");
            Theme1CourtChange=NO;
            
            
            
            
            
            
            [hiddenLeftGuestImageViewTheme1 setFrame:CGRectMake(593, Y, W, H)];
            [hiddenRightGuestImageViewTheme1 setFrame:CGRectMake(678, Y, W, H)];
            
            [leftHomeImageViewTheme1 setFrame:CGRectMake(290,Y, W, H)];
            [rightHomeImageViewTheme1 setFrame:CGRectMake(375,Y, W, H)];
            
            
            [guestTextFieldTheme1 setFrame:CGRectMake(293, 257, 180, 22)];
            [homeTextFieldTheme1 setFrame:CGRectMake(595, 257, 180, 22)];
            
            
            
        }
        
        
        
        //	if (scrollViewTheme1.center.x-MOVE_RANGE<-530) {
        //		[scrollViewTheme1 setCenter:CGPointMake(scrollViewTheme1.center.x, scrollViewTheme1.center.y)];
        //	}
        //	else {
        //        if (scrollViewTheme1.center.x>512) {
        //
        //            [scrollViewTheme1 setCenter:CGPointMake(scrollViewTheme1.center.x-395, scrollViewTheme1.center.y)];
        //        }
        //	}
        [UIView commitAnimations];
        NSLog(@"The digital scroll view center when sroll Left%f",scrollViewTheme1.center.x);
        
	}
}
-(void)Theme1rightHomeImageViewScoreUp{
    selectedImageViewNameTheme1 = @"rightHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	if (homeScoreIndexTheme1>99) {
		homeScoreIndexTheme1=99;
	}
	
	[self homeScoreChangeTheme1];
}

-(void)Theme1rightHomeImageViewScoreDown{
    
	selectedImageViewNameTheme1 = @"rightHomeImageViewTheme1";
	homeScoreIndexTheme1 -=1;
	
	[self homeScoreChangeTheme1];
}

-(void)Theme1leftHomeImageViewScoreUp{
   	selectedImageViewNameTheme1 = @"leftHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	if (homeScoreIndexTheme1>99) {
		homeScoreIndexTheme1=99;
	}
	
	[self homeScoreChangeTheme1];
}

-(void)Theme1leftHomeImageViewScoreDown{
    
	selectedImageViewNameTheme1 = @"leftHomeImageViewTheme1";
	homeScoreIndexTheme1 -=1;
	[self homeScoreChangeTheme1];
}




-(void)Theme1rightGuestImageViewScoreUp{
    NSLog(@"Its entering into the Theme1hiddenRightHomeImageViewScoreUp ");
    
	selectedImageViewNameTheme1 = @"rightGuestImageViewTheme1";
	guestScoreIndexTheme1 +=1;
	if (homeScoreIndexTheme1>99) {
		homeScoreIndexTheme1=99;
	}
	[self guestScoreChangeTheme1];
}

-(void)Theme1rightGuestImageViewScoreDown{
	selectedImageViewNameTheme1 = @"rightGuestImageViewTheme1";
	guestScoreIndexTheme1 -=1;
	[self guestScoreChangeTheme1];
}

-(void)Theme1leftGuestImageViewScoreUp{
	selectedImageViewNameTheme1 = @"leftGuestImageViewTheme1";
	guestScoreIndexTheme1 +=1;
	[self guestScoreChangeTheme1];
}

-(void)Theme1leftGuestImageViewScoreDown{
	selectedImageViewNameTheme1 = @"leftGuestImageViewTheme1";
	guestScoreIndexTheme1 -=1;
	[self guestScoreChangeTheme1];
}




#pragma mark Tap to incerse Score
-(void)Theme1homeScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    
    selectedImageViewNameTheme1 = @"rightHomeImageViewTheme1";
    selectedImageViewNameTheme1 = @"leftHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	if (homeScoreIndexTheme1>99)
    {
		homeScoreIndexTheme1=99;
	}
    
    [self homeScoreChangeTheme1];
}
-(void)Theme1guestScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewNameTheme1 = @"rightGuestImageViewTheme1";
    selectedImageViewNameTheme1 = @"leftGuestImageViewTheme1";
	guestScoreIndexTheme1 +=1;
	if (homeScoreIndexTheme1>99) {
		homeScoreIndexTheme1=99;
	}
	[self guestScoreChangeTheme1];
    
}
-(void)Theme1hiddenHomeScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewNameTheme1 = @"hiddenRightHomeImageViewTheme1";
    selectedImageViewNameTheme1 = @"hiddenLeftHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	[self homeScoreChangeTheme1];
}
-(void)Theme1hiddenGuestScoreChangeWithTap:(UIGestureRecognizer *)gesture
{
    selectedImageViewNameTheme1 = @"hiddenRightGuestImageView";
    selectedImageViewNameTheme1 = @"hiddenLeftGuestImageView";
	guestScoreIndexTheme1 +=1;
	[self guestScoreChangeTheme1];
}










-(void)homeScoreChangeTheme1
{
    if (homeScoreIndexTheme1>99) {
		homeScoreIndexTheme1=99;
		return;
	}
	if (homeScoreIndexTheme1<0) {
		homeScoreIndexTheme1=0;
	}
	
	if(homeScoreIndexTheme1<100)
	{
		
		
		int temp=homeScoreIndexTheme1;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
		
		[hiddenLeftHomeImageViewTheme1 setAlpha:0.0];
		[leftHomeImageViewTheme1 setAlpha:0.0];
		
		[rightHomeImageViewTheme1 setAlpha:0.0];
		[hiddenRightHomeImageViewTheme1 setAlpha:0.0];
		
		
		[self setupImageTheme1:hiddenRightHomeImageViewTheme1 :secondDigit];
		[self setupImageTheme1:rightHomeImageViewTheme1 :secondDigit];
		
		
		
		if (firstDigit!=0)
		{
			[self setupImageTheme1:hiddenLeftHomeImageViewTheme1 :firstDigit];
			[self setupImageTheme1:leftHomeImageViewTheme1 :firstDigit];
            
		}
		else
		{
			if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==1){
                hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
                leftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==2){
                hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
                leftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==3){
                hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
                leftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==4){
                hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
                leftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
            }
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpHomeTheme1)];
		[UIView commitAnimations];
		
		homeScoreFirstDigitTheme1=firstDigit;
	}
	
	
}
-(void)dimUpHomeTheme1{
	
    
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	
	[hiddenRightHomeImageViewTheme1 setAlpha:1.0];
	[hiddenLeftHomeImageViewTheme1 setAlpha:1.0];
	[rightHomeImageViewTheme1 setAlpha:1.0];
	[leftHomeImageViewTheme1 setAlpha:1.0];
	[UIView commitAnimations];
}


-(void)guestScoreChangeTheme1
{
	if (guestScoreIndexTheme1>99) {
		guestScoreIndexTheme1=99;
		return;
	}
	if (guestScoreIndexTheme1<0) {
		guestScoreIndexTheme1=0;
		return;
	}
	
	if(guestScoreIndexTheme1<100)
	{
		
		int temp=guestScoreIndexTheme1;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
		[hiddenLeftGuestImageViewTheme1 setAlpha:0.0];
		[leftGuestImageViewTheme1 setAlpha:0.0];
		
		[rightGuestImageViewTheme1 setAlpha:0.0];
		[hiddenRightGuestImageViewTheme1 setAlpha:0.0];
		
		
		
		[self setupImageTheme1:hiddenRightGuestImageViewTheme1 :secondDigit];
		[self setupImageTheme1:rightGuestImageViewTheme1 :secondDigit];
		
		
		if (firstDigit!=0)
		{
			
			[self setupImageTheme1:hiddenLeftGuestImageViewTheme1 :firstDigit];
			[self setupImageTheme1:leftGuestImageViewTheme1 :firstDigit];
		}
		else
		{    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==1){
			hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
			leftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
        }
        else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==2){
            hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
			leftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
        }
        else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==3){
            hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
			leftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
        }else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==4){
            hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
			leftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
            
        }
            
            
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpGuestTheme1)];
		[UIView commitAnimations];
		
		guestScoreFirstDigitTheme1 = firstDigit;
        
	}
    
}
#pragma mark hidden image scroll methods
-(void)Theme1hiddenRightHomeImageViewScoreUp{
    
	selectedImageViewNameTheme1 = @"hiddenRightHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	[self homeScoreChangeTheme1];
}

-(void)Theme1hiddenRightHomeImageViewScoreDown{
	selectedImageViewNameTheme1 = @"hiddenRightHomeImageViewTheme1";
	homeScoreIndexTheme1 -=1;
	[self homeScoreChangeTheme1];
}

-(void)Theme1hiddenLeftHomeImageViewScoreUp{
	selectedImageViewNameTheme1 = @"hiddenLeftHomeImageViewTheme1";
	homeScoreIndexTheme1 +=1;
	[self homeScoreChangeTheme1];
}

-(void)Theme1hiddenLeftHomeImageViewScoreDown{
	selectedImageViewNameTheme1 = @"hiddenLeftHomeImageViewTheme1";
	homeScoreIndexTheme1 -=1;
	[self homeScoreChangeTheme1];
}

-(void)Theme1hiddenRightGuestImageViewScoreUp{
	selectedImageViewName = @"hiddenRightGuestImageView";
	guestScoreIndexTheme1 +=1;
	[self guestScoreChangeTheme1];
}

-(void)Theme1hiddenRightGuestImageViewScoreDown{
	selectedImageViewNameTheme1 = @"hiddenRightGuestImageViewTheme1";
	guestScoreIndexTheme1 -=1;
	[self guestScoreChangeTheme1];
}

-(void)Theme1hiddenLeftGuestImageViewScoreUp{
	selectedImageViewNameTheme1 = @"hiddenLeftGuestImageViewTheme1";
	guestScoreIndexTheme1 +=1;
	
	[self guestScoreChangeTheme1];
}

-(void)Theme1hiddenLeftGuestImageViewScoreDown{
	selectedImageViewNameTheme1 = @"hiddenLeftGuestImageViewTheme1";
	guestScoreIndexTheme1 -=1;
	[self guestScoreChangeTheme1];
}

-(void)dimUpGuestTheme1
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[hiddenRightGuestImageViewTheme1 setAlpha:1.0];
	[hiddenLeftGuestImageViewTheme1 setAlpha:1.0];
	[rightGuestImageViewTheme1 setAlpha:1.0];
	[leftGuestImageViewTheme1 setAlpha:1.0];
	[UIView commitAnimations];
	
	
}

-(void)setupImageTheme1:(UIImageView *)imgView :(int)digit{
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==1){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"line-0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"line-1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"line-2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"line-3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"line-4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"line-5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"line-6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"line-7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"line-8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"line-9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==2){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"line-0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"line-1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"line-2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"line-3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"line-4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"line-5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"line-6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"line-7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"line-8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"line-9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==3){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"line-0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"line-1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"line-2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"line-3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"line-4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"line-5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"line-6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"line-7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"line-8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"line-9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme1ThemeNumber"]==4){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"line-0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"line-1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"line-2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"line-3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"line-4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"line-5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"line-6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"line-7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"line-8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"line-9.png"]];
                break;
        }
    }
    
}


-(void)Theme1settingsButtonClick:(id)sender{
    
    
    
    
	[UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	
	
	
	Theme1SettingsViewControllerBigger *theme1SettingsViewController = [[Theme1SettingsViewControllerBigger alloc]  init];
    //    theme1SettingsViewController.homeName=homeTextField.text;
    //    theme1SettingsViewController.guestName=guestTextField.text;
    //
    //	theme1SettingsViewController.homeScore =homeScoreIndex;
    //	theme1SettingsViewController.guestScore = guestScoreIndex;
	[self.navigationController pushViewController:theme1SettingsViewController animated:NO];
	[theme1SettingsViewController release];
    
}

#pragma mark Theme2Scoreboard Screen Design.....
-(void)DigitalScoreboardNewtheme2ScreenDesign{
    
   
    
    CGRect Boders = CGRectMake(202, 6, 102, 13);
    HomeBorderDigitalTheme2 = [[UIImageView alloc]initWithFrame:Boders];
    [HomeBorderDigitalTheme2 setImage:[UIImage imageNamed:@"DigitslLabels.png"]];
    [DigitalScoreBordNewTheme2 addSubview:HomeBorderDigitalTheme2];
    
    CGRect GuestBorderImage = CGRectMake(32, 6, 102, 13);
    GuestBorderDigitalTheme2 = [[UIImageView alloc]initWithFrame:GuestBorderImage];
    [GuestBorderDigitalTheme2 setImage:[UIImage imageNamed:@"DigitslLabels.png"]];
    [DigitalScoreBordNewTheme2 addSubview:GuestBorderDigitalTheme2];
    
    
    
    //    guestTextFieldTheme2 = [[UITextField alloc] initWithFrame:CGRectMake(29, 410, 255, 38)];
    //    //guestTextFieldTheme1.borderStyle = UITextBorderStyleBezel;
    //    guestTextFieldTheme2.textColor = [UIColor whiteColor];
    //    guestTextFieldTheme2.font = [UIFont systemFontOfSize:35];
    //    guestTextFieldTheme2.text = @"Guest";
    //    guestTextFieldTheme2.textAlignment=UITextAlignmentCenter;
    //    guestTextFieldTheme2.backgroundColor = [UIColor clearColor];
    //    guestTextFieldTheme2.autocorrectionType = UITextAutocorrectionTypeNo;
    //    guestTextFieldTheme2.keyboardType = UIKeyboardTypeDefault;
    //    guestTextFieldTheme2.returnKeyType = UIReturnKeyDone;
    //    guestTextFieldTheme2.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    //[self.view addSubview:guestTextField];
    //    [DigitalScoreBordNewTheme2 addSubview:guestTextFieldTheme2];
    //    guestTextFieldTheme2.delegate = self;
    
    
    //    homeTextFieldTheme2 = [[UITextField alloc] initWithFrame:CGRectMake(417, 400, 255, 38)];
    //    //homeTextFieldThemee1.borderStyle = UITextBorderStyleBezel;
    //    homeTextFieldTheme2.textColor = [UIColor whiteColor];
    //    homeTextFieldTheme2.font = [UIFont systemFontOfSize:35];
    //    homeTextFieldTheme2.text = @"Home";
    //    homeTextFieldTheme2.textAlignment=UITextAlignmentCenter;
    //    homeTextFieldTheme2.autocorrectionType = UITextAutocorrectionTypeNo;
    //    homeTextFieldTheme2.backgroundColor = [UIColor clearColor];
    //    homeTextFieldTheme2.keyboardType = UIKeyboardTypeDefault;
    //    homeTextFieldTheme2.returnKeyType = UIReturnKeyDone;
    //    homeTextFieldTheme2.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    // [self.view addSubview:homeTextField];
    //    [DigitalScoreBordNewTheme2 addSubview:homeTextFieldTheme2];
    //    homeTextFieldTheme2.delegate = self;
    
    
    
    
    
    
    
    
    
    ScrollViewTheme2 = [[UIScrollView alloc] initWithFrame:CGRectMake(-265, 0,1040,250)];
    ScrollViewTheme2.contentSize = CGSizeMake(DigitalScoreBordNewTheme2.frame.size.width, DigitalScoreBordNewTheme2.frame.size.height);
    ScrollViewTheme2.showsHorizontalScrollIndicator = YES;
    [ScrollViewTheme2 setBackgroundColor:[UIColor clearColor]];
    
    [DigitalScoreBordNewTheme2 addSubview:ScrollViewTheme2];
    
    guestTextFieldTheme2 = [[UITextField alloc] initWithFrame:CGRectMake(297, 6, 102, 13)];
   // guestTextFieldTheme2.borderStyle = UITextBorderStyleBezel;
    guestTextFieldTheme2.textColor = [UIColor whiteColor];
    guestTextFieldTheme2.font = [UIFont systemFontOfSize:12];
    guestTextFieldTheme2.text = @"Guest";
    guestTextFieldTheme2.textAlignment=UITextAlignmentCenter;
    guestTextFieldTheme2.backgroundColor = [UIColor clearColor];
    guestTextFieldTheme2.autocorrectionType = UITextAutocorrectionTypeNo;
    guestTextFieldTheme2.keyboardType = UIKeyboardTypeDefault;
    guestTextFieldTheme2.returnKeyType = UIReturnKeyDone;
    guestTextFieldTheme2.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [ScrollViewTheme2 addSubview:guestTextFieldTheme2];
    guestTextFieldTheme2.delegate = self;
    
    
    homeTextFieldTheme2 = [[UITextField alloc] initWithFrame:CGRectMake(467,6, 102, 13)];
   //homeTextFieldTheme2.borderStyle = UITextBorderStyleBezel;
    homeTextFieldTheme2.textColor = [UIColor whiteColor];
    homeTextFieldTheme2.font = [UIFont systemFontOfSize:12];
    homeTextFieldTheme2.text = @"Home";
    homeTextFieldTheme2.textAlignment=UITextAlignmentCenter;
    homeTextFieldTheme2.autocorrectionType = UITextAutocorrectionTypeNo;
    homeTextFieldTheme2.backgroundColor = [UIColor clearColor];
    homeTextFieldTheme2.keyboardType = UIKeyboardTypeDefault;
    homeTextFieldTheme2.returnKeyType = UIReturnKeyDone;
    homeTextFieldTheme2.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [ScrollViewTheme2 addSubview:homeTextFieldTheme2];
    homeTextFieldTheme2.delegate = self;
    [guestTextFieldTheme2 setUserInteractionEnabled:NO];
    [homeTextFieldTheme2 setUserInteractionEnabled:NO];
    
    
    
    Theme2Setting=[[UIButton alloc]initWithFrame:CGRectMake(285, 2, 20, 20)];
    [Theme2Setting setImage:[UIImage imageNamed:@"Vball-settings.png"] forState:UIControlStateNormal];
    [Theme2Setting addTarget:self action:@selector(Theme2Setting:) forControlEvents:UIControlEventTouchUpInside];
    [DigitalScoreBordNewTheme2 addSubview:Theme2Setting];
    
    
    
    Theme2Reset=[[UIButton alloc]initWithFrame:CGRectMake(255, 2, 20, 20)];
    [Theme2Reset setImage:[UIImage imageNamed:@"Vball-reset.png"] forState:UIControlStateNormal];
    [Theme2Reset addTarget:self action:@selector(Theme2Reset:) forControlEvents:UIControlEventTouchDown];
    [DigitalScoreBordNewTheme2 addSubview:Theme2Reset];
    [Theme2Setting setUserInteractionEnabled:NO];
    [Theme2Reset setUserInteractionEnabled:NO];
    
    
    
    smallScoreBoardbuttonDigitalTheme2=[[UIButton alloc]init];
    [smallScoreBoardbuttonDigitalTheme2 setFrame:CGRectMake(252, 285, 65, 35)];
    
    [smallScoreBoardbuttonDigitalTheme2 addTarget:self action:@selector(backButtonDigitalTheme2:)forControlEvents:UIControlEventTouchUpInside];
    [smallScoreBoardbuttonDigitalTheme2 setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [DigitalScoreBordNewTheme2 addSubview:smallScoreBoardbuttonDigitalTheme2];
    [smallScoreBoardbuttonDigitalTheme2 setHidden:YES];
    
   
    
    [Theme2Setting setFrame:CGRectMake(310, 2, 20, 20)];
    [Theme2Reset setFrame:CGRectMake(5, 2, 20, 20)];
    int H=120;
    int W=70;
    int Y=35;
    
    
    
   
        
        
        [homeTextFieldTheme2 setFrame:CGRectMake(467, 6, 100, 13)];
        [guestTextFieldTheme2 setFrame:CGRectMake(297,6, 100, 13)];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect7 = CGRectMake(275,Y, W, H);
    Theme2LeftGuestImageview = [[UIImageView alloc]initWithFrame:myImageRect7];
    [Theme2LeftGuestImageview setImage:[UIImage imageNamed:@"0s.png"]];
    Theme2LeftGuestImageview.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];
    
    [ScrollViewTheme2 addSubview:Theme2LeftGuestImageview];
    
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect8 = CGRectMake( 351, Y, W, H);
    Theme2RightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect8];
    [Theme2RightGuestImageView setImage:[UIImage imageNamed:@"0s.png"]];
    // [self.view addSubview:rightGuestImageView];
    Theme2RightGuestImageView.userInteractionEnabled=YES;
    [ScrollViewTheme2 addSubview:Theme2RightGuestImageView];
    
    
    // [rightGuestImageView setHidden:YES];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectd = CGRectMake( 443,Y, W, H);
    Theme2LeftHomeImageview = [[UIImageView alloc]initWithFrame:myImageRectd];
    [Theme2LeftHomeImageview setImage:[UIImage imageNamed:@"0s.png"]];
    Theme2LeftHomeImageview.userInteractionEnabled=YES;
    //[self.view addSubview:hiddenLeftGuestImageView];
    [ScrollViewTheme2 addSubview:Theme2LeftHomeImageview];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectc = CGRectMake(519, Y, W, H);
    Theme2RightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectc];
    [Theme2RightHomeImageView setImage:[UIImage imageNamed:@"0s.png"]];
    Theme2RightHomeImageView.userInteractionEnabled=YES;
    // [self.view addSubview:hiddenRightGuestImageView];
    [ScrollViewTheme2 addSubview:Theme2RightHomeImageView];
    
    [Theme2LeftHomeImageview setUserInteractionEnabled:NO];
    [Theme2LeftGuestImageview setUserInteractionEnabled:NO];
    [Theme2RightGuestImageView setUserInteractionEnabled:NO];
    [Theme2RightHomeImageView  setUserInteractionEnabled:NO];
    
    UISwipeGestureRecognizer *leftSwipeUpScrollTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalNewTheme2MoveScrollViewLeft)] autorelease];
	leftSwipeUpScrollTheme2.direction = UISwipeGestureRecognizerDirectionLeft;
	[ScrollViewTheme2 addGestureRecognizer:leftSwipeUpScrollTheme2];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDownScrollTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(DigitalNewTheme2moveScrollViewRight)] autorelease];
	rightSwipeDownScrollTheme2.direction = UISwipeGestureRecognizerDirectionRight;
	[ScrollViewTheme2 addGestureRecognizer:rightSwipeDownScrollTheme2];
    
    
    
    
    
    
    
    
    
    
    UISwipeGestureRecognizer *rightHomeImageViewSwipeUpTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2rightHomeImageViewScoreUp)] autorelease];
	rightHomeImageViewSwipeUpTheme2.direction = UISwipeGestureRecognizerDirectionUp;
	[Theme2RightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeUpTheme2];
    
	
	UISwipeGestureRecognizer *rightHomeImageViewSwipeDownTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2rightHomeImageViewScoreDown)] autorelease];
	rightHomeImageViewSwipeDownTheme2.direction = UISwipeGestureRecognizerDirectionDown;
	[Theme2RightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeDownTheme2];
    
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *leftHomeImageViewSwipeUpTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftHomeImageViewScoreUp)] autorelease];
	leftHomeImageViewSwipeUpTheme2.direction = UISwipeGestureRecognizerDirectionUp;
	[Theme2LeftHomeImageview addGestureRecognizer:leftHomeImageViewSwipeUpTheme2];
    
	
	UISwipeGestureRecognizer *leftHomeImageViewSwipeDownTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftHomeImageViewScoreDown)] autorelease];
	leftHomeImageViewSwipeDownTheme2.direction = UISwipeGestureRecognizerDirectionDown;
	[Theme2LeftHomeImageview addGestureRecognizer:leftHomeImageViewSwipeDownTheme2];
    
    
    
    UISwipeGestureRecognizer *RightHomeImageViewSwipeUpTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreUp)] autorelease];
	RightHomeImageViewSwipeUpTheme2.direction = UISwipeGestureRecognizerDirectionUp;
	[Theme2LeftGuestImageview addGestureRecognizer:RightHomeImageViewSwipeUpTheme2];
    
    
    
    UISwipeGestureRecognizer *RightHomeImageViewSwipeDownTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreDown)] autorelease];
	RightHomeImageViewSwipeDownTheme2.direction = UISwipeGestureRecognizerDirectionDown;
	[Theme2LeftGuestImageview addGestureRecognizer:RightHomeImageViewSwipeDownTheme2];
    
    
    
    
    UISwipeGestureRecognizer *RightGuestImageViewSwipeUpTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreUp)] autorelease];
	RightGuestImageViewSwipeUpTheme2.direction = UISwipeGestureRecognizerDirectionUp;
	[Theme2RightGuestImageView addGestureRecognizer:RightGuestImageViewSwipeUpTheme2];
    
    
    
    UISwipeGestureRecognizer *RightGuestImageViewSwipeDownTheme2 = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreDown)] autorelease];
	RightGuestImageViewSwipeDownTheme2.direction = UISwipeGestureRecognizerDirectionDown;
	[Theme2RightGuestImageView addGestureRecognizer:RightGuestImageViewSwipeDownTheme2];
    
    
    
    
    UITapGestureRecognizer *rightGuestScoreImageTapTheme2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreUp)];
    [rightGuestScoreImageTapTheme2 setNumberOfTapsRequired:1];
    [rightGuestScoreImageTapTheme2 setNumberOfTouchesRequired:1];
    [Theme2RightGuestImageView addGestureRecognizer:rightGuestScoreImageTapTheme2];
    
    UITapGestureRecognizer *LeftGuestScoreImageTapTheme2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftGuestImageViewScoreUp)];
    [LeftGuestScoreImageTapTheme2 setNumberOfTapsRequired:1];
    [LeftGuestScoreImageTapTheme2 setNumberOfTouchesRequired:1];
    [Theme2LeftGuestImageview addGestureRecognizer:LeftGuestScoreImageTapTheme2];
    
    
    UITapGestureRecognizer *RightHomeScoreImageTapTheme2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftHomeImageViewScoreUp)];
    [RightHomeScoreImageTapTheme2 setNumberOfTapsRequired:1];
    [RightHomeScoreImageTapTheme2 setNumberOfTouchesRequired:1];
    [Theme2RightHomeImageView addGestureRecognizer:RightHomeScoreImageTapTheme2];
    
    UITapGestureRecognizer *LefttHomeScoreImageTapTheme2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Theme2leftHomeImageViewScoreUp)];
    [LefttHomeScoreImageTapTheme2 setNumberOfTapsRequired:1];
    [LefttHomeScoreImageTapTheme2 setNumberOfTouchesRequired:1];
    [Theme2LeftHomeImageview addGestureRecognizer:LefttHomeScoreImageTapTheme2];
    
    
    
}
#pragma Theme2Scoreboard ScoreBoard Actions and methods
-(IBAction)Theme2Reset:(id)sender{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:4  forKey:@"Scorebaordnumber"];
    [prefs synchronize];
    
    UIActionSheet *resetActionSheetForDigital = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reset Names",@"Reset Score", @"Reset Both", nil];
    [resetActionSheetForDigital setTag:100];
    //Revmob reset
    
    [resetActionSheetForDigital showInView:self.view];
    [resetActionSheetForDigital release];
}
-(IBAction)Theme2Setting:(id)sender{
    //    Theme2SettingsViewController *tutorialViewController = [[Theme2SettingsViewController alloc] initWithNibName:@"Theme2SettingsViewController" bundle:nil];
    //	//tutorialViewController.vollyBallScore= YES;
    //	[self presentModalViewController:tutorialViewController animated:YES];
    //	[tutorialViewController release];
    
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	
	
	
	Theme2settingsViewControllerBigger *theme2SettingsViewController = [[Theme2settingsViewControllerBigger alloc]  init];
    //    theme1SettingsViewController.homeName=homeTextField.text;
    //    theme1SettingsViewController.guestName=guestTextField.text;
    //
    //	theme1SettingsViewController.homeScore =homeScoreIndex;
    //	theme1SettingsViewController.guestScore = guestScoreIndex;
	[self.navigationController pushViewController:theme2SettingsViewController animated:NO];
	[theme2SettingsViewController release];
}
-(void)DigitalNewTheme2MoveScrollViewLeft{
    
    if (Theme2ViewBigger==YES) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        
        // NSLog(@"gggfsgxfscgxdsfdgwcvdgcfvcfrcvfrc ghcv bfrhcvbfrchrcbrcvhrbcdhcbdrhuyc  ednbejcrcbrdcvnr rdb c");
        
        if (Theme2CourtChange==NO) {
            NSLog(@"scroll left");
            Theme2CourtChange=YES;
            
            int H=Theme2LeftGuestImageview.frame.size.height;
            int W=Theme2LeftGuestImageview.frame.size.width;
            int Y=Theme2LeftGuestImageview.frame.origin.y;
            
            //            [Theme2LeftGuestImageview setFrame:CGRectMake(583,Y, W, H)];
            //            [Theme2RightGuestImageView setFrame:CGRectMake(805,Y, W, H)];
            //            [Theme2LeftHomeImageview setFrame:CGRectMake(1090, Y, W, H)];
            //            [Theme2RightHomeImageView setFrame:CGRectMake(1314, Y, W, H)];
            //            [homeTextFieldTheme2 setFrame:CGRectMake(1167, 90, 355, 48)];
            //            [guestTextFieldTheme2 setFrame:CGRectMake(558, 90, 355, 48)];
            
            [Theme2LeftGuestImageview setFrame:CGRectMake(548,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(683,Y, W, H)];
            
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(257, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(392, Y, W, H)];
            
            
            
            
            [homeTextFieldTheme2 setFrame:CGRectMake(300, 10, 180, 24)];
            [guestTextFieldTheme2 setFrame:CGRectMake(570,10, 180, 24)];
            
            
                        
                        
            
            //            [Theme2LeftGuestImageview setFrame:CGRectMake(1090,Y, W, H)];
            //            [Theme2RightGuestImageView setFrame:CGRectMake(1314,Y, W, H)];
            //            [Theme2LeftHomeImageview setFrame:CGRectMake(583, Y, W, H)];
            //            [Theme2RightHomeImageView setFrame:CGRectMake(805, Y, W, H)];
            //
            //
            //            [homeTextFieldTheme2 setFrame:CGRectMake(558, 90, 355, 48)];
            //            [guestTextFieldTheme2 setFrame:CGRectMake(1167, 90, 355, 48)];
            
        }
        [UIView commitAnimations];
        
    }
    
}
-(void)DigitalNewTheme2moveScrollViewRight{
    
    NSLog(@"Scrool right");
    if (Theme2ViewBigger==YES) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        if (Theme2CourtChange==YES) {
            Theme2CourtChange=NO;
            
            NSLog(@"Scrool right");
            
            
            int H=Theme2LeftGuestImageview.frame.size.height;
            int W=Theme2LeftGuestImageview.frame.size.width;
            int Y=Theme2LeftGuestImageview.frame.origin.y;
            
            
            [Theme2LeftGuestImageview setFrame:CGRectMake(257,Y, W, H)];
            [Theme2RightGuestImageView setFrame:CGRectMake(392,Y, W, H)];
            
            [Theme2LeftHomeImageview setFrame:CGRectMake(548, Y, W, H)];
            [Theme2RightHomeImageView setFrame:CGRectMake(683, Y, W, H)];
            
            [homeTextFieldTheme2 setFrame:CGRectMake(570, 10, 200, 24)];
            [guestTextFieldTheme2 setFrame:CGRectMake(300,10, 200, 24)];

            
            
            
            
        }
        [UIView commitAnimations];
        
    }
}
-(void)Theme2rightHomeImageViewScoreUp{
    selectedImageViewNameTheme2 = @"rightHomeImageViewTheme1";
	HomescoreIndexTheme2 +=1;
	if (HomescoreIndexTheme2>99) {
		HomescoreIndexTheme2=99;
	}
	
	[self homeScoreChangeTheme2];
}

-(void)Theme2rightHomeImageViewScoreDown{
    
	selectedImageViewNameTheme2 = @"rightHomeImageViewTheme1";
	HomescoreIndexTheme2 -=1;
	
	[self homeScoreChangeTheme2];
}

-(void)Theme2leftHomeImageViewScoreUp{
   	selectedImageViewNameTheme2 = @"leftHomeImageViewTheme1";
	HomescoreIndexTheme2 +=1;
	if (HomescoreIndexTheme2>99) {
		HomescoreIndexTheme2=99;
	}
	
	[self homeScoreChangeTheme2];
}

-(void)Theme2leftHomeImageViewScoreDown{
    
	selectedImageViewNameTheme2 = @"leftHomeImageViewTheme1";
	HomescoreIndexTheme2 -=1;
	[self homeScoreChangeTheme2];
}




-(void)Theme2rightGuestImageViewScoreUp{
    NSLog(@"Its entering into the Theme1hiddenRightHomeImageViewScoreUp ");
    
	selectedImageViewNameTheme2 = @"rightGuestImageViewTheme1";
	GuestScoreIndexTheme2 +=1;
	if (GuestScoreIndexTheme2>99) {
		GuestScoreIndexTheme2=99;
	}
	[self guestScoreChangeTheme2];
}

-(void)Theme2rightGuestImageViewScoreDown{
	selectedImageViewNameTheme2 = @"rightGuestImageViewTheme1";
	GuestScoreIndexTheme2 -=1;
	[self guestScoreChangeTheme2];
}

-(void)Theme2leftGuestImageViewScoreUp{
	selectedImageViewNameTheme2 = @"leftGuestImageViewTheme1";
	GuestScoreIndexTheme2 +=1;
	[self guestScoreChangeTheme2];
}

-(void)Theme2leftGuestImageViewScoreDown{
	selectedImageViewNameTheme2 = @"leftGuestImageViewTheme1";
	GuestScoreIndexTheme2 -=1;
	[self guestScoreChangeTheme2];
}
-(void)homeScoreChangeTheme2
{
    if (HomescoreIndexTheme2>99) {
		HomescoreIndexTheme2=99;
		return;
	}
	if (HomescoreIndexTheme2<0) {
		HomescoreIndexTheme2=0;
	}
	
	if(HomescoreIndexTheme2<100)
	{
		
		
		int temp=HomescoreIndexTheme2;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
		
		//[hiddenLeftHomeImageViewTheme1 setAlpha:0.0];
		[Theme2LeftHomeImageview setAlpha:0.0];
		
		[Theme2RightHomeImageView setAlpha:0.0];
		//[hiddenRightHomeImageViewTheme1 setAlpha:0.0];
		
		
		//[self setupImageTheme1:hiddenRightHomeImageViewTheme1 :secondDigit];
		[self setupImageTheme2Home:Theme2RightHomeImageView :secondDigit];
		
		
		
		if (firstDigit!=0)
		{
			//[self setupImageTheme1:hiddenLeftHomeImageViewTheme1 :firstDigit];
			[self setupImageTheme2Home:Theme2LeftHomeImageview:firstDigit];
            
		}
		else
		{
			if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==1){
                // hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
                Theme2LeftHomeImageview.image = [UIImage imageNamed:@"squareYellow0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==2){
                // hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
                Theme2LeftHomeImageview.image = [UIImage imageNamed:@"squareGrey0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==3){
                // hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
                Theme2LeftHomeImageview.image = [UIImage imageNamed:@"squareRed0.png"];
            }else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==4){
                //hiddenLeftHomeImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
                Theme2LeftHomeImageview.image = [UIImage imageNamed:@"squareBlue0.png"];
            }
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpHomeTheme2)];
		[UIView commitAnimations];
		
		homeScoreFirstDigitTheme2=firstDigit;
	}
	
	
}
-(void)dimUpHomeTheme2{
	
    
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	
	
	[Theme2LeftHomeImageview setAlpha:1.0];
	[Theme2RightHomeImageView setAlpha:1.0];
	[UIView commitAnimations];
}


-(void)guestScoreChangeTheme2
{
	if (GuestScoreIndexTheme2>99) {
		GuestScoreIndexTheme2=99;
		return;
	}
	if (GuestScoreIndexTheme2<0) {
		GuestScoreIndexTheme2=0;
		return;
	}
	
	if(GuestScoreIndexTheme2<100)
	{
		
		int temp=GuestScoreIndexTheme2;
		
		int secondDigit = temp %10;
		temp = temp/10;
		int firstDigit = temp;
		
        //		[hiddenLeftGuestImageViewTheme1 setAlpha:0.0];
		[Theme2LeftGuestImageview setAlpha:0.0];
		
		[Theme2RightGuestImageView setAlpha:0.0];
        //	[hiddenRightGuestImageViewTheme1 setAlpha:0.0];
		
		
		
        //	[self setupImageTheme1:hiddenRightGuestImageViewTheme1 :secondDigit];
		[self setupImageTheme2:Theme2RightGuestImageView :secondDigit];
		
		
		if (firstDigit!=0)
		{
			
			//[self setupImageTheme1:hiddenLeftGuestImageViewTheme1 :firstDigit];
			[self setupImageTheme2:Theme2LeftGuestImageview :firstDigit];
		}
		else
		{    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==1){
			//hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineRed0.png"];
			Theme2LeftGuestImageview.image = [UIImage imageNamed:@"squareYellow0.png"];
        }
        else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==2){
            // hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineBlue0.png"];
			Theme2LeftGuestImageview.image = [UIImage imageNamed:@"squareGrey0.png"];
        }
        else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==3){
            // hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineYellow0.png"];
			Theme2LeftGuestImageview.image = [UIImage imageNamed:@"squareRed0.png"];
        }else     if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==4){
            // hiddenLeftGuestImageViewTheme1.image = [UIImage imageNamed:@"lineWhite0.png"];
			Theme2LeftGuestImageview.image = [UIImage imageNamed:@"squareBlue0.png"];
            
        }
            
            
		}
		
		
		//start animation
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(dimUpGuestTheme2)];
		[UIView commitAnimations];
		
		guestScoreFirstDigitTheme2 = firstDigit;
        
	}
    
}

-(void)dimUpGuestTheme2
{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
    
    [Theme2RightGuestImageView setAlpha:1.0];
	[Theme2LeftGuestImageview setAlpha:1.0];
	[UIView commitAnimations];
	
	
}
-(void)setupImageTheme2:(UIImageView *)imgView :(int)digit{
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==1){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareYellow0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareYellow1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareYellow2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareYellow3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareYellow4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareYellow5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareYellow6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareYellow7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareYellow8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareYellow9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==2){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareGrey0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareGrey1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareGrey2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareGrey3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareGrey4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareGrey5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareGrey6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareGrey7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareGrey8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareGrey9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==3){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareRed0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareRed1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareRed2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareRed3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareRed4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareRed5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareRed6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareRed7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareRed8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareRed9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==4){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareBlue0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareBlue1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareBlue2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareBlue3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareBlue4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareBlue5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareBlue6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareBlue7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareBlue8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareBlue9.png"]];
                break;
        }
    }
    
}
-(void)setupImageTheme2Home:(UIImageView *)imgView :(int)digit{
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==1){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareYellow0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareYellow1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareYellow2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareYellow3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareYellow4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareYellow5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareYellow6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareYellow7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareYellow8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareYellow9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==2){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareGrey0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareGrey1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareGrey2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareGrey3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareGrey4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareGrey5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareGrey6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareGrey7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareGrey8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareGrey9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==3){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareRed0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareRed1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareRed2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareRed3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareRed4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareRed5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareRed6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareRed7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareRed8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareRed9.png"]];
                break;
        }
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==4){
        
        switch (digit) {
            case 0:
                [imgView setImage:[UIImage imageNamed:@"squareBlue0.png"]];
                break;
            case 1:
                [imgView setImage:[UIImage imageNamed:@"squareBlue1.png"]];
                break;
            case 2:
                [imgView setImage:[UIImage imageNamed:@"squareBlue2.png"]];
                break;
            case 3:
                [imgView setImage:[UIImage imageNamed:@"squareBlue3.png"]];
                break;
            case 4:
                [imgView setImage:[UIImage imageNamed:@"squareBlue4.png"]];
                break;
            case 5:
                [imgView setImage:[UIImage imageNamed:@"squareBlue5.png"]];
                break;
            case 6:
                [imgView setImage:[UIImage imageNamed:@"squareBlue6.png"]];
                break;
            case 7:
                [imgView setImage:[UIImage imageNamed:@"squareBlue7.png"]];
                break;
            case 8:
                [imgView setImage:[UIImage imageNamed:@"squareBlue8.png"]];
                break;
            case 9:
                [imgView setImage:[UIImage imageNamed:@"squareBlue9.png"]];
                break;
        }
    }
    
}

-(void)Theme2ColorChange{
    int tempHome=HomescoreIndexTheme2;
    
    int secondDigitHome = tempHome %10;
    tempHome = tempHome/10;
    int firstDigitHome = tempHome;
    
    
    
    
    int temp=GuestScoreIndexTheme2;
    
    int secondDigit = temp %10;
    temp = temp/10;
    int firstDigit = temp;
    
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==1){
        
        Theme2LeftGuestImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareYellow%d.png",firstDigit]];
        
        
        Theme2RightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareYellow%d.png",secondDigit]];
        
        
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==2){
        Theme2LeftGuestImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareGrey%d.png",firstDigit]];
        
        
        Theme2RightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareGrey%d.png",secondDigit]];
        
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==3){
        Theme2LeftGuestImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareRed%d.png",firstDigit]];
        
        
        Theme2RightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareRed%d.png",secondDigit]];
        
        
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"]==4){
        Theme2LeftGuestImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareBlue%d.png",firstDigit]];
        
        
        Theme2RightGuestImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareBlue%d.png",secondDigit]];
        
        
    }
    
    
    
    
    
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==1){
        
        
        
        
        Theme2LeftHomeImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareYellow%d.png",firstDigitHome]];
        
        
        Theme2RightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareYellow%d.png",secondDigitHome]];
        
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==2){
        
        
        
        Theme2LeftHomeImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareGrey%d.png",firstDigitHome]];
        
        
        Theme2RightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareGrey%d.png",secondDigitHome]];
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==3){
        
        
        
        Theme2LeftHomeImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareRed%d.png",firstDigitHome]];
        
        
        Theme2RightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareRed%d.png",secondDigitHome]];
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"]==4){
        
        
        
        Theme2LeftHomeImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareBlue%d.png",firstDigitHome]];
        
        
        Theme2RightHomeImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"squareBlue%d.png",secondDigitHome]];
    }
}

#pragma mark VolleyBall scoreboard Actions and common actions and method


//////////////////////////////////////////// Volleyball and common aqctions and methods//////////////////////////////
-(IBAction)tutorialButtonClick:(id)sender
{
//	TutorialViewController *tutorialViewController = [[TutorialViewController alloc] initWithNibName:@"TutorialViewController" bundle:nil];
//	tutorialViewController.vollyBallScore= YES;
//	[self presentModalViewController:tutorialViewController animated:YES];
//	[tutorialViewController release];
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    [Tutorial setFrame:CGRectMake(0, 0, 568, 320)];
    [self.view bringSubviewToFront:Tutorial];
    [UIView commitAnimations];
	
}
-(IBAction)regulerSBButtonClick:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/scoreboard-pro/id442976974?mt=8"]];
}

-(void)FaceBookIconClicked{
    NSLog(@"Facebook Button Clicked");
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.facebook.com/pages/Scoreboard-Mobile/491660797511058"]];
}

-(void)TwitterIconClicked{
    NSLog(@"Twitter Button Clicked");
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/SoundHouseLLC"]];
    
}
-(void)moveMainScrollViewLeft{
    
    if (VolleyBallViewBigger == NO && DigitalViewBigger == NO && Theme1Bigger == NO && Theme2Bigger == NO) {
    
    NSLog(@"Scrolled from Right to Left");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    
    if (BackGroundScroll.center.x> -129) {
        
        [BackGroundScroll setCenter:CGPointMake(BackGroundScroll.center.x-372, BackGroundScroll.center.y)];
        PageNumber++;
        
    }
    
    NSLog(@"The page number value is %d",PageNumber);
    
    
    NSLog(@"TheScroll View Center is when scroll Left %f",BackGroundScroll.center.x);
    
    [UIView commitAnimations];
    
    if (PageNumber == 1) {
        [VolleyBallView setUserInteractionEnabled:YES];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor blackColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    }
    else if(PageNumber == 2){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:YES];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    }
    else if(PageNumber == 3){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:YES];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    }
    else if(PageNumber==4){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:YES];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor blackColor]];
    }
    }
}
-(void)moveMainScrollViewRight{
    if (VolleyBallViewBigger==NO&&DigitalViewBigger==NO&&Theme1Bigger==NO&&Theme2Bigger==NO) {

    NSLog(@"Scrolled from left to right");
    
    NSLog(@"TheScroll View Center is when scroll right %f",BackGroundScroll.center.x);
    
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    if (BackGroundScroll.center.x<524) {
        PageNumber--;
        
        [BackGroundScroll setCenter:CGPointMake(BackGroundScroll.center.x+372, BackGroundScroll.center.y)];
    }
    NSLog(@"The page number value is %d",PageNumber);
    if (PageNumber==1) {
        [VolleyBallView setUserInteractionEnabled:YES];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor blackColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    }
    else if(PageNumber==2){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:YES];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];

    }
    else if(PageNumber==3){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:YES];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:NO];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor clearColor]];
    }
    else if(PageNumber==4){
        [VolleyBallView setUserInteractionEnabled:NO];
        [DigitalScoreboard setUserInteractionEnabled:NO];
        [DigitalScoreboardNewtheme1 setUserInteractionEnabled:NO];
        [DigitalScoreBordNewTheme2 setUserInteractionEnabled:YES];
        [LeftSideViewForTap setBackgroundColor:[UIColor clearColor]];
        [RightsideViewForTap setBackgroundColor:[UIColor blackColor]];
    }
    
    [UIView commitAnimations];
    NSLog(@"The Scroll View Center is when scroll right %f",BackGroundScroll.center.x);
    }
}
#pragma mark Tap to incerse Score
-(void)homeScoreLabelTap:(UIGestureRecognizer *)gesture
{
    if (frontHomeLableScore<99)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.frontHomeScoreLable cache:YES];
        [UIView commitAnimations];
        
        
        frontHomeLableScore +=1;
        [frontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
        [self playSound];
        
        
    }
}
-(void)guestScoreLabelTap:(UIGestureRecognizer *)gesture
{
    if (frontGuestLableScore<99)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.frontGuestScoreLable cache:YES];
        [UIView commitAnimations];
        
        frontGuestLableScore +=1;
        [frontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
        [self playSound];
    }
}
-(void)hiddenHomeScoreLabelTap:(UIGestureRecognizer *)gesture
{
    if (frontHomeLableScore<99)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.hiddenFrontHomeScoreLable cache:YES];
        [UIView commitAnimations];
        
        
        frontHomeLableScore +=1;
        [hiddenFrontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
        [self playSound];
    }
}
-(void)hiddenGuestScoreLabelTap:(UIGestureRecognizer *)gesture
{
    if (frontGuestLableScore<99)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.hiddenFrontGuestScoreLable cache:YES];
        [UIView commitAnimations];
        
        frontGuestLableScore +=1;
        [hiddenFrontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
        [self playSound];
    }
}


#pragma mark Audio Initialization method
-(void)initializeAudio{
	NSString *path=[[NSBundle mainBundle]pathForResource:@"pageflip" ofType:@"mp3"];
	myAudio=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL ];
	myAudio.delegate=self;
	myAudio.volume=2.0;
	//[myAudio play];
	//[myAudio stop];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance]
     setCategory: AVAudioSessionCategoryAmbient
     error: &setCategoryError];
    
    if (setCategoryError) { /* handle the error condition */ }
}

#pragma mark Period lable score change methods
-(void)periodLableScoreUp{
	if(periodIndex<9)
		periodIndex+=1;
	[preiodLabel setText:[NSString stringWithFormat:@"%d",periodIndex]];
}

-(void)periodLableScoreDown{
	
	if (periodIndex>1) {
		periodIndex-=1;
		[preiodLabel setText:[NSString stringWithFormat:@"%d",periodIndex]];
		
	}
}


#pragma mark Scrollview move methods
-(void)MainScrollViewRight{
    //    [UIView beginAnimations:nil context:nil];
    //	[UIView setAnimationDuration:0.5];
    //	[UIView setAnimationDelegate:self];
    //	if (BackgroundScrollView.center.x+MOVE_RANGE>1400) {
    //		[BackgroundScrollView setCenter:CGPointMake(BackgroundScrollView.center.x, BackgroundScrollView.center.y)];
    //
    //	}
    //	else {
    //		[BackgroundScrollView setCenter:CGPointMake(BackgroundScrollView.center.x+MOVE_RANGE+200, BackgroundScrollView.center.y)];
    //	}
    //	[UIView commitAnimations];
    //	[self playSound];
}
-(void)MainScrollViewLeft{
    //    NSLog(@"Its mainScroll ");
    //
    //    [UIView beginAnimations:nil context:nil];
    //	[UIView setAnimationDuration:0.5];
    //	[UIView setAnimationDelegate:self];
    //
    //	if (BackgroundScrollView.center.x-MOVE_RANGE<-530) {
    //		[BackgroundScrollView setCenter:CGPointMake(BackgroundScrollView.center.x-500, BackgroundScrollView.center.y)];
    //	}
    //	else {
    //		[BackgroundScrollView setCenter:CGPointMake(BackgroundScrollView.center.x-MOVE_RANGE-200, BackgroundScrollView.center.y)];
    //	}
    //	[UIView commitAnimations];
    //	[self playSound];
    
}


-(void)moveScrollViewRight{
	
	if ([frontHomeLableName isEqualToString:@"frontHomeScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:frontHomeScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontHomeScoreLable];
		
		[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:backHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:hiddenBackHomeScoreLable withScore:backHomeLableScore];
    }
	if([frontHomeLableName isEqualToString:@"backHomeScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:backHomeScoreLable];
        [scrollView bringSubviewToFront:hiddenBackHomeScoreLable];
		
		[self setAlignmentForLable:backHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:hiddenBackHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
	}
    
    if ([frontGuestLableName isEqualToString:@"frontGuestScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:frontGuestScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontGuestScoreLable];
		
		[self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:backGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:hiddenBackGuestScoreLable withScore:backGuestLableScore];
		
        
    }
	if([frontGuestLableName isEqualToString:@"backGuestScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:backGuestScoreLable];
        [scrollView bringSubviewToFront:hiddenBackGuestScoreLable];
		
		[self setAlignmentForLable:backGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:hiddenBackGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
		
	}
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
    NSLog(@"the scroll view center is %f",scrollView.center.x);
    //
    //	if (scrollView.center.x+MOVE_RANGE>1400) {
    //		[scrollView setCenter:CGPointMake(scrollView.center.x, scrollView.center.y)];
    //
    //
    //	}
    //	else {
    //		[scrollView setCenter:CGPointMake(scrollView.center.x+388, scrollView.center.y)];
    //	}
    
	
	[self playSound];
    if (VolleyBallCourtChanged==NO&&VolleyBallViewBigger==YES) {
        VolleyBallCourtChanged=YES;
        //        [hiddenFrontHomeScoreLable setHidden:NO];
        //        [hiddenFrontGuestScoreLable setHidden:NO];
        //        [frontHomeScoreLable setHidden:YES];
        //        [frontGuestScoreLable setHidden:YES];
        
        int XpositionForHome=frontHomeScoreLable.frame.origin.x;
        int XpositionForGuest=frontGuestScoreLable.frame.origin.x;
        
        
        [frontGuestScoreLable setFrame:CGRectMake(XpositionForHome, frontHomeScoreLable.frame.origin.y, frontHomeScoreLable.frame.size.width,frontHomeScoreLable.frame.size.height)];
        
        
        
        [frontHomeScoreLable setFrame:CGRectMake(XpositionForGuest, frontGuestScoreLable.frame.origin.y, frontGuestScoreLable.frame.size.width, frontGuestScoreLable.frame.size.height)];
        
        [homeTextField setFrame:CGRectMake(27, 251, 205, 33)];
        [guestTextField setFrame:CGRectMake(340,251, 205, 33)];

        
    }
    [UIView commitAnimations];
}


-(void)moveScrollViewLeft{
	
    if ([frontHomeLableName isEqualToString:@"frontHomeScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:frontHomeScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontHomeScoreLable];
		
		[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:backHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:hiddenBackHomeScoreLable withScore:backHomeLableScore];
    }
	if([frontHomeLableName isEqualToString:@"backHomeScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:backHomeScoreLable];
        [scrollView bringSubviewToFront:hiddenBackHomeScoreLable];
		
		[self setAlignmentForLable:backHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:hiddenBackHomeScoreLable withScore:backHomeLableScore];
		[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
		[self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
	}
    
    if ([frontGuestLableName isEqualToString:@"frontGuestScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:frontGuestScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontGuestScoreLable];
		
		[self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:backGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:hiddenBackGuestScoreLable withScore:backGuestLableScore];
		
        
    }
	if([frontGuestLableName isEqualToString:@"backGuestScoreLable"]) {
		
		//getting back lable to front
		[scrollView bringSubviewToFront:backGuestScoreLable];
        [scrollView bringSubviewToFront:hiddenBackGuestScoreLable];
		
		[self setAlignmentForLable:backGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:hiddenBackGuestScoreLable withScore:backGuestLableScore];
		[self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
		[self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
		
	}
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	
    NSLog(@"the scroll view center is %f",scrollView.center.x);
    
    //	if (scrollView.center.x-MOVE_RANGE<-530) {
    //		[scrollView setCenter:CGPointMake(scrollView.center.x, scrollView.center.y)];
    //	}
    //	else {
    //        if (scrollView.center.x>512) {
    //            [scrollView setCenter:CGPointMake(scrollView.center.x-388, scrollView.center.y)];
    //        }
    //	}
	[self playSound];
    if (VolleyBallCourtChanged==YES&&VolleyBallViewBigger==YES) {
        VolleyBallCourtChanged=NO;
        int XpositionForHome=frontHomeScoreLable.frame.origin.x;
        int XpositionForGuest=frontGuestScoreLable.frame.origin.x;
        
        
        [frontGuestScoreLable setFrame:CGRectMake(XpositionForHome, frontHomeScoreLable.frame.origin.y, frontHomeScoreLable.frame.size.width,frontHomeScoreLable.frame.size.height)];
        
        
        
        [frontHomeScoreLable setFrame:CGRectMake(XpositionForGuest, frontGuestScoreLable.frame.origin.y, frontGuestScoreLable.frame.size.width, frontGuestScoreLable.frame.size.height)];
        
        [homeTextField setFrame:CGRectMake(340, 251, 205, 33)];
        [guestTextField setFrame:CGRectMake(27, 251, 205, 33)];

    }
    
    
    [UIView commitAnimations];
    
}



// Override to allow orientations other than the default portrait orientation.
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations.
//    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//        NSLog(@"11111111111111111111111111111111");
//        
//        return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
//    }
//    else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight){
//        return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//        NSLog(@"22222222222222222222222222222");
//        
//    }
//    else if(interfaceOrientation == UIInterfaceOrientationMaskPortrait){
//        return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//        NSLog(@"333333333333333333");
//        
//    }
//    else if(interfaceOrientation == UIInterfaceOrientationMaskPortraitUpsideDown){
//        return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//        NSLog(@"444444444444444444444");
//        
//    }
//
////    else
////        return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//    
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
 
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[suspendedLableName release];
	//[keyBrdDoneBtnView release];
    [frontHomeLableName release];
    [frontGuestLableName release];
	[hiddenBackHomeScoreLable release];
	[hiddenFrontHomeScoreLable release];
	[hiddenBackGuestScoreLable release];
	[hiddenFrontGuestScoreLable release];
	[hiddenHomeTextField release];
	[hiddenGuestTextField release];
	[guestLableImageName release];
	[homeLableImageName release];
	[backHomeScoreLable release];
	[frontHomeScoreLable release];
	[backGuestScoreLable release];
	[frontGuestScoreLable release];
	[scrollView release];
	[preiodLabel release];
	[homeTextField release];
	[guestTextField release];
	[presentLable release];
    [super dealloc];
}

#pragma mark PlaySound method
-(void)playSound
{
    //    AVAudioSession *session = [AVAudioSession sharedInstance];
    //    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    //    OSStatus propertySetError = 0;
    //    UInt32 allowMixing = true;
    //    propertySetError = AudioSessionSetProperty (
    //                                                kAudioSessionProperty_OverrideCategoryMixWithOthers,
    //                                                sizeof (allowMixing),
    //                                                &allowMixing
    //                                                );
    //    NSError *activationError = nil;
    //    [session setActive:YES error:&activationError];
    // Now play the sound in filePath
    //    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"pageflip" ofType:@"mp3"];
    //
    //    NSURL *fileUrl = [NSURL fileURLWithPath:soundPath];
    //    NSError *error;
    //    AVAudioPlayer *audio =[[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:@"error"];
    //
    //	[audio play];
    //    SystemSoundID sounds[0];
    //
    //
    //	NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Buzzer" ofType:@"mp3"];
    //    CFURLRef soundURL = (CFURLRef)[NSURL fileURLWithPath:soundPath];
    //
    //   // CFURLRef soundURL = (__bridge CFURLRef)[NSURL fileURLWithPath:soundPath];
    //    AudioServicesCreateSystemSoundID(soundURL, &sounds[0]);
    //    AudioServicesPlaySystemSound(sounds[0]);
    //    NSLog(@"frontHomeLable= %@ and fronGuestLable= %@",frontHomeLableName,frontGuestLableName);
}

#pragma mark Button clicke events

-(IBAction)doneButtonClick:(id)sender
{
    NSLog(@"ccbdjdkbchbcsdhbdhjnbvhvbfhfbfh");
	[homeTextField resignFirstResponder];
	[guestTextField resignFirstResponder];
	[hiddenHomeTextField resignFirstResponder];
	[hiddenGuestTextField resignFirstResponder];
    [homeTextFieldDigital resignFirstResponder];
    [homeTextFieldTheme1 resignFirstResponder];
    [homeTextFieldTheme2 resignFirstResponder];
    [guestTextFieldDigital resignFirstResponder];
    [guestTextFieldTheme1 resignFirstResponder];
    [guestTextFieldTheme2 resignFirstResponder];
	// scroll view back down
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	CGRect rect = self.view.frame;
	rect.origin.y = 0;  //scroll to
	self.view.frame = rect;
	[UIView commitAnimations];
    
}
- (IBAction)backButtonClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)settingsButtonClick:(id)sender {
	
	[UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	
    
    VolleyballSettingsViewControllerBigger *vollyballSettingsViewController = [[VolleyballSettingsViewControllerBigger alloc]  init];
    
    //vollyballSettingsViewController.guestTitle=guestTextField.text;
  //  vollyballSettingsViewController.homeTitle=homeTextField.text;
    
	/*VollyballSettingsViewController *vollyballSettingsViewController = [[VollyballSettingsViewController alloc]initWithNibName:@"VollyballSettingsViewController" bundle:nil hometitle:homeTextField.text guesttitle:guestTextField.text];
     //vollyballSettingsViewController.guestTitle=guestTextField.text;
     //vollyballSettingsViewController.homeTitle=homeTextField.text;
     */
	//vollyballSettingsViewController.homeScore = presentHomeScore;
	//vollyballSettingsViewController.guestScore = presentGuestScore;
	[self.navigationController pushViewController:vollyballSettingsViewController animated:NO];
	[vollyballSettingsViewController release];
    
}

- (IBAction)resetButtonClick:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:1  forKey:@"Scorebaordnumber"];
    [prefs synchronize];
	UIActionSheet *resetActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reset Names",@"Reset Score", @"Reset Both", nil];
    //Revmob reset
    
    [resetActionSheet setTag:ACTION_SHEET_TAG];
    [resetActionSheet showInView:self.view];
    [resetActionSheet release];
}


#pragma mark -
#pragma mark UIAction sheet delegate method

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clicked Button Index:%d", buttonIndex);
    
    switch (buttonIndex) {
        case 0:
            [self resetNames];
            
            break;
        case 1:
            [self resetScore];
            
            break;
        case 2:
			[self resetBoth];
            break;
            
        default:
            NSLog(@"clicked Button Index:%d", buttonIndex);
            break;
    }
}

#pragma mark Reset button methods
-(void)resetNames
{
    
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==1){
        
        homeTextField.text=@"Home";
        guestTextField.text=@"Guest";
        hiddenHomeTextField.text=@"Home";
        hiddenGuestTextField.text=@"Guest";
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==2){
        
        guestTextFieldDigital.text=@"Guest";
        homeTextFieldDigital.text=@"Home";
        
        
        
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==3){
        guestTextFieldTheme1.text=@"Guest";
        homeTextFieldTheme1.text=@"Home";
        
    }
    else{
        guestTextFieldTheme2.text=@"Guest";
        homeTextFieldTheme2.text=@"Home";
        
        NSLog(@"its the fourth scoreboard");
        
    }
    
}

-(void)resetScore
{
	//resetting the lables and that valuee as it was when the application started
	
    if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==1){
        frontHomeLableScore=0;
        backHomeLableScore=1;
        frontGuestLableScore=0;
        backGuestLableScore=1;
        
        
        frontHomeLableName=@"frontHomeScoreLable";
        frontGuestLableName=@"frontGuestScoreLable";
        
        [scrollView bringSubviewToFront:frontHomeScoreLable];
        [scrollView bringSubviewToFront:frontGuestScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontHomeScoreLable];
        [scrollView bringSubviewToFront:hiddenFrontGuestScoreLable];
        
        
        [self setAlignmentForLable:hiddenBackHomeScoreLable withScore:backHomeLableScore];
        [self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
        [self setAlignmentForLable:hiddenBackGuestScoreLable withScore:backGuestLableScore];
        [self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
        [self setAlignmentForLable:backHomeScoreLable withScore:backHomeLableScore];
        [self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
        [self setAlignmentForLable:backGuestScoreLable withScore:backGuestLableScore];
        [self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
        
    }
    else  if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==2){
        
        homeScoreIndex=0;
        guestScoreIndex=0;
        [self ChangeColor];
        
        
        
    }
    else if ([[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"]==3){
        
        homeScoreIndexTheme1=0;
        guestScoreIndexTheme1=0;
        [self Theme1ColorChange];
    }
    else{
        NSLog(@"its the fourth scoreboard");
        HomescoreIndexTheme2=0;
        GuestScoreIndexTheme2=0;
        [self Theme2ColorChange];
    }
}

-(void)resetBoth
{
    [self resetScore];
    [self resetNames];
}

-(void)setAlignmentForLable:(UILabel *)aScoreLable withScore:(int)aScore
{
	[aScoreLable setText:[NSString stringWithFormat:@"%d",aScore]];
	
	if (aScore>9)
		[aScoreLable setTextAlignment:UITextAlignmentCenter];
	else
		[aScoreLable setTextAlignment:UITextAlignmentCenter];
}

#pragma mark -
#pragma mark Text field delegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
	[homeTextField resignFirstResponder];
	[guestTextField resignFirstResponder];
	[hiddenHomeTextField resignFirstResponder];
	[hiddenGuestTextField resignFirstResponder];
    [homeTextFieldDigital resignFirstResponder];
    [homeTextFieldTheme1 resignFirstResponder];
    [homeTextFieldTheme2 resignFirstResponder];
    [guestTextFieldDigital resignFirstResponder];
    [guestTextFieldTheme1 resignFirstResponder];
    [guestTextFieldTheme2 resignFirstResponder];

    
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	
	if (textField.inputAccessoryView == nil) {
		// Loading the AccessoryView nib file sets the accessoryView outlet.
		//textField.inputAccessoryView = keyBrdDoneBtnView;
	}
    [toolbar setHidden:NO];
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.0	];
	[UIView setAnimationBeginsFromCurrentState:YES];
    [UIView commitAnimations];

    if(Theme2ViewBigger==YES){
	self.view.frame = CGRectMake(0, -158, self.view.frame.size.width, self.view.frame.size.height);
        [toolbar setFrame:CGRectMake(toolbar.frame.origin.x, toolbar.frame.origin.y-158, toolbar.frame.size.width, toolbar.frame.size.height)];
        
    }
    else{
      self.view.frame = CGRectMake(0, -158, self.view.frame.size.width, self.view.frame.size.height);
    }
	}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	[toolbar setHidden:YES];
    if(Theme2ViewBigger==YES){
    [toolbar setFrame:CGRectMake(toolbar.frame.origin.x, toolbar.frame.origin.y+158, toolbar.frame.size.width, toolbar.frame.size.height)];
    }
    
	if ([homeTextField.text isEqualToString:@""] ) {
		homeTextField.text =@"Home";
	}
	if ([guestTextField.text isEqualToString:@""] ) {
		guestTextField.text =@"Guest";
	}
	
	if ([hiddenHomeTextField.text isEqualToString:@""] ) {
		hiddenHomeTextField.text =@"Home";
	}
	if ([hiddenGuestTextField.text isEqualToString:@""] ) {
		hiddenGuestTextField.text =@"Guest";
	}
    if ([homeTextFieldDigital.text isEqualToString:@""]) {
        homeTextFieldDigital.text=@"Home";
        
    }
    if ([homeTextFieldTheme1.text isEqualToString:@""]) {
        homeTextFieldTheme1.text=@"Home";
        
    }
    if ([homeTextFieldTheme2.text isEqualToString:@""]) {
        homeTextFieldTheme2.text=@"Home";
    }
    if([guestTextFieldDigital.text isEqualToString:@""]){
        [guestTextFieldDigital setText:@"Guest"];
        
    }
    if([guestTextFieldTheme1.text isEqualToString:@""]){
        [guestTextFieldTheme1 setText:@"Guest"];
        
        
    }
    if([guestTextFieldTheme2.text isEqualToString:@""]){
        [guestTextFieldTheme2 setText:@"Guests"];
        
    }
    
    
    if (textField.tag == 1000)
        homeTextField.text = textField.text;
    if (textField.tag == 1001)
        hiddenGuestTextField.text = textField.text;
    if (textField.tag==1002)
        hiddenHomeTextField.text = textField.text;
    if (textField.tag == 1003)
        guestTextField.text = textField.text;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
   // [UIView commitAnimations];
    
    return YES;
}
#pragma mark Hidden score change methods
-(void)hiddenFrontHomeScoreLableScoreUp;
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.hiddenFrontHomeScoreLable cache:YES];
    [UIView commitAnimations];
    
    
    frontHomeLableScore +=1;
    [hiddenFrontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
    [self playSound];
    
}
-(void)hiddenFrontHomeScoreLableScoreDown;
{
    
    
    if (frontHomeLableScore>-9) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.hiddenFrontHomeScoreLable cache:YES];
        [UIView commitAnimations];
        frontHomeLableScore -=1;
        [hiddenFrontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
        [self playSound];
    }
    
}
-(void)hiddenFrontGuestScoreLableScoreUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.hiddenFrontGuestScoreLable cache:YES];
    [UIView commitAnimations];
    
    frontGuestLableScore +=1;
    [hiddenFrontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
    [self playSound];
}
-(void)hiddenFrontGuestScoreLableScoreDown
{
    if (frontGuestLableScore>-9) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.hiddenFrontGuestScoreLable cache:YES];
        [UIView commitAnimations];
        frontGuestLableScore -=1;
        [hiddenFrontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
        [self playSound];
    }
    
}

#pragma mark Score change methods

-(void)frontHomeScoreLableScoreUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.frontHomeScoreLable cache:YES];
    [UIView commitAnimations];
    
    
    frontHomeLableScore +=1;
    [frontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
    [self playSound];
    
}
-(void)frontHomeScoreLableScoreDown
{
    if (frontHomeLableScore>-9) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.frontHomeScoreLable cache:YES];
        [UIView commitAnimations];
        frontHomeLableScore -=1;
        [frontHomeScoreLable setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
        [self playSound];
    }
    
    
}

-(void)frontGuestScoreLableScoreUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.frontGuestScoreLable cache:YES];
    [UIView commitAnimations];
    
    frontGuestLableScore +=1;
    [frontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
    [self playSound];
    
}
-(void)frontGuestScoreLableScoreDown
{
    if (frontGuestLableScore>-9) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.85];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.frontGuestScoreLable cache:YES];
        [UIView commitAnimations];
        frontGuestLableScore -=1;
        [frontGuestScoreLable setText:[NSString stringWithFormat:@"%d",frontGuestLableScore]];
        [self playSound];
    }
    
}











-(void)frontHomeScoreLableInitialization
{
    
    
    //creating the the lable with same properties
    frontHomeScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(HOMESCORE_LABLE_XPOSITION,HOMESCORE_LABLE_YPOSITION-8,HOMESCORE_LABLE_WIDTH+3,HOMESCORE_LABLE_HEIGHT-34)];
    [frontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.jpg"]]];
    [frontHomeScoreLable setFont:[UIFont fontWithName:@"Arial" size:LABLE_FONTSIZE-40]];
    [self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
    [frontHomeScoreLable setUserInteractionEnabled:YES];
    [frontHomeScoreLable setTextColor:[UIColor whiteColor]];
    frontHomeScoreLable.layer.anchorPoint=CGPointMake(0,0);
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *frontHomeScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(frontHomeScoreLableScoreUp)] autorelease];
    frontHomeScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [frontHomeScoreLable addGestureRecognizer:frontHomeScoreLableSwipeUp];
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *frontHomeScoreLableSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(frontHomeScoreLableScoreDown)] autorelease];
    frontHomeScoreLableSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [frontHomeScoreLable addGestureRecognizer:frontHomeScoreLableSwipeDown];
    
    
    [scrollView addSubview:frontHomeScoreLable];
}
-(void)frontGuestScoreLableInitialization
{
    //creating the the lable with same properties
    frontGuestScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(GUESTSCORE_LABLE_XPOSITION,HOMESCORE_LABLE_YPOSITION-8,HOMESCORE_LABLE_WIDTH+3,HOMESCORE_LABLE_HEIGHT-34)];
    [frontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red.jpg"]]];
    [frontGuestScoreLable setFont:[UIFont fontWithName:@"Arial" size:LABLE_FONTSIZE-40]];
    [self setAlignmentForLable:frontGuestScoreLable withScore:frontGuestLableScore];
    [frontGuestScoreLable setUserInteractionEnabled:YES];
    [frontGuestScoreLable setTextColor:[UIColor whiteColor]];
    frontGuestScoreLable.layer.anchorPoint=CGPointMake(0,0);
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *frontGuestScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(frontGuestScoreLableScoreUp)] autorelease];
    frontGuestScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [frontGuestScoreLable addGestureRecognizer:frontGuestScoreLableSwipeUp];
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *frontGuestScoreLableSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(frontGuestScoreLableScoreDown)] autorelease];
    frontGuestScoreLableSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [frontGuestScoreLable addGestureRecognizer:frontGuestScoreLableSwipeDown];
    
    [scrollView addSubview:frontGuestScoreLable];
}

-(void)hiddenFrontHomeScoreLableInitialization
{
    //creating the the lable with same properties
    hiddenFrontHomeScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(GUESTSCORE_LABLE_XPOSITION,GUESTSCORE_LABLE_YPOSITION,GUESTSCORE_LABLE_WIDTH,GUESTSCORE_LABLE_HEIGHT)];
    [hiddenFrontHomeScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.jpg"]]];
    [hiddenFrontHomeScoreLable setFont:[UIFont fontWithName:@"Arial-BoldMT" size:LABLE_FONTSIZE]];
    [self setAlignmentForLable:hiddenFrontHomeScoreLable withScore:frontHomeLableScore];
    [hiddenFrontHomeScoreLable setUserInteractionEnabled:YES];
    [hiddenFrontHomeScoreLable setTextColor:[UIColor whiteColor]];
    hiddenFrontHomeScoreLable.layer.anchorPoint=CGPointMake(0,0);
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *hiddenFrontHomeScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenFrontHomeScoreLableScoreUp)] autorelease];
    hiddenFrontHomeScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [hiddenFrontHomeScoreLable addGestureRecognizer:hiddenFrontHomeScoreLableSwipeUp];
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *hiddenFrontHomeScoreLableSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenFrontHomeScoreLableScoreDown)] autorelease];
    hiddenFrontHomeScoreLableSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [hiddenFrontHomeScoreLable addGestureRecognizer:hiddenFrontHomeScoreLableSwipeDown];
    
    
    [scrollView addSubview:hiddenFrontHomeScoreLable];
    [hiddenFrontHomeScoreLable setHidden:YES];
    
}
-(void)hiddenFrontGuestScoreLableInitialization
{
    //creating the the lable with same properties
    hiddenFrontGuestScoreLable = [[UILabel alloc] initWithFrame:CGRectMake(HOMESCORE_LABLE_XPOSITION,HOMESCORE_LABLE_YPOSITION,HOMESCORE_LABLE_WIDTH,HOMESCORE_LABLE_HEIGHT)];
    [hiddenFrontGuestScoreLable  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red.jpg"]]];
    [hiddenFrontGuestScoreLable setFont:[UIFont fontWithName:@"Arial-BoldMT" size:LABLE_FONTSIZE]];
    [self setAlignmentForLable:hiddenFrontGuestScoreLable withScore:frontGuestLableScore];
    [hiddenFrontGuestScoreLable setUserInteractionEnabled:YES];
    [hiddenFrontGuestScoreLable setTextColor:[UIColor whiteColor]];
    hiddenFrontGuestScoreLable.layer.anchorPoint=CGPointMake(0,0);
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *hiddenFrontGuestScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenFrontGuestScoreLableScoreUp)] autorelease];
    hiddenFrontGuestScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [hiddenFrontGuestScoreLable addGestureRecognizer:hiddenFrontGuestScoreLableSwipeUp];
    
    //adding swipe guesture to the lable
    UISwipeGestureRecognizer *hiddenFrontGuestScoreLableSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenFrontGuestScoreLableScoreDown)] autorelease];
    hiddenFrontGuestScoreLableSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [hiddenFrontGuestScoreLable addGestureRecognizer:hiddenFrontGuestScoreLableSwipeDown];
    
    [scrollView addSubview:hiddenFrontGuestScoreLable];
    [hiddenFrontGuestScoreLable setHidden:YES];
    
    
}
-(IBAction)rightScollButtonClick:(id)sender
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation)];
    [scrollView setCenter:CGPointMake(scrollView.center.x+240, scrollView.center.y)];
    [UIView commitAnimations];
    [self playSound];
    
    
}
-(IBAction)leftScrollButtonClick:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(finishAnimation)];
    [scrollView setCenter:CGPointMake(scrollView.center.x-240, scrollView.center.y)];
    [UIView commitAnimations];
    [self playSound];
    
    
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
