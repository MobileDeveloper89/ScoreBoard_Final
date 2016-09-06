//
//  BasketballMainViewController.m
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BasketballMainViewController.h"
#import "BasketballSettingsViewController.h"
#import"CountdownTimer.h"


#define ACTION_SHEET_TAG 2000

#define MOVE_RANGE 244


@implementation BasketballMainViewController
@synthesize homeTextField,keyBrdDoneBtnView;
@synthesize guestTextField;
@synthesize countdownTimerView;
@synthesize hiddenHomeTextField;
@synthesize hiddenGuestTextField;
@synthesize scrollView;
@synthesize rightHomeImageView;
@synthesize leftHomeImageView;
@synthesize rightGuestImageView;
@synthesize leftGuestImageView;
@synthesize hiddenRightHomeImageView;
@synthesize hiddenLeftHomeImageView;
@synthesize hiddenRightGuestImageView;
@synthesize hiddenLeftGuestImageView;
@synthesize selectedImageViewName;
@synthesize timerPlayandPauseButton;

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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(-241, 0, 960, 320)];    scrollView.contentSize = CGSizeMake(480, 320);
    scrollView.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:scrollView];
    
   countdownTimerView=[[CountdownTimer alloc]initWithFrame:CGRectMake(183, 6, 113, 61)];
    
    
    guestTextField = [[UITextField alloc] initWithFrame:CGRectMake(271, 268, 175, 31)];
    guestTextField.borderStyle = UITextBorderStyleBezel;
     guestTextField.textColor = [UIColor blackColor];
    guestTextField.font = [UIFont systemFontOfSize:17.0];
    guestTextField.placeholder = @"Guest"; 
    guestTextField.textAlignment=UITextAlignmentCenter;
    guestTextField.backgroundColor = [UIColor whiteColor];
    guestTextField.autocorrectionType = UITextAutocorrectionTypeNo;  
    guestTextField.backgroundColor = [UIColor clearColor];
    guestTextField.keyboardType = UIKeyboardTypeDefault;  
    guestTextField.returnKeyType = UIReturnKeyDone;  
    guestTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollView addSubview:guestTextField];
    guestTextField.delegate = self;
    
    
    homeTextField = [[UITextField alloc] initWithFrame:CGRectMake(514, 268, 175, 31)];
    homeTextField.borderStyle = UITextBorderStyleBezel;
    homeTextField.textColor = [UIColor blackColor];
    homeTextField.font = [UIFont systemFontOfSize:17.0];
    homeTextField.placeholder = @"Home";  
    homeTextField.textAlignment=UITextAlignmentCenter;
    homeTextField.backgroundColor = [UIColor whiteColor];
    homeTextField.autocorrectionType = UITextAutocorrectionTypeNo;  
    homeTextField.backgroundColor = [UIColor clearColor];
    homeTextField.keyboardType = UIKeyboardTypeDefault;  
    homeTextField.returnKeyType = UIReturnKeyDone;  
    homeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollView addSubview:homeTextField];
    homeTextField.delegate = self;
    
    
    hiddenHomeTextField = [[UITextField alloc] initWithFrame:CGRectMake(28, 268, 175, 31)];
    hiddenHomeTextField.borderStyle = UITextBorderStyleBezel;
    hiddenHomeTextField.textColor = [UIColor blackColor];
    hiddenHomeTextField.font = [UIFont systemFontOfSize:17.0];
    hiddenHomeTextField.placeholder = @"Home"; 
    hiddenHomeTextField.textAlignment=UITextAlignmentCenter;
    hiddenHomeTextField.backgroundColor = [UIColor whiteColor];
    hiddenHomeTextField.autocorrectionType = UITextAutocorrectionTypeNo;  
    hiddenHomeTextField.backgroundColor = [UIColor clearColor];
    hiddenHomeTextField.keyboardType = UIKeyboardTypeDefault;  
    hiddenHomeTextField.returnKeyType = UIReturnKeyDone;  
    hiddenHomeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // [self.view addSubview:homeTextField];
    [scrollView addSubview:hiddenHomeTextField];
    hiddenHomeTextField.delegate = self;
    
    
    hiddenGuestTextField = [[UITextField alloc] initWithFrame:CGRectMake(757, 268, 175, 31)];
    hiddenGuestTextField.borderStyle = UITextBorderStyleBezel;
    hiddenGuestTextField.textColor = [UIColor blackColor];
    hiddenGuestTextField.font = [UIFont systemFontOfSize:17.0];
    hiddenGuestTextField.placeholder = @"Guest"; 
    hiddenGuestTextField.textAlignment=UITextAlignmentCenter;
    hiddenGuestTextField.backgroundColor = [UIColor whiteColor];
    hiddenGuestTextField.autocorrectionType = UITextAutocorrectionTypeNo;  
    hiddenGuestTextField.backgroundColor = [UIColor clearColor];
    hiddenGuestTextField.keyboardType = UIKeyboardTypeDefault;  
    hiddenGuestTextField.returnKeyType = UIReturnKeyDone;  
    hiddenGuestTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.view addSubview:guestTextField];
    [scrollView addSubview:hiddenGuestTextField];
    hiddenGuestTextField.delegate = self;

    
    self.view.backgroundColor = [UIColor redColor];
    CGRect myImageRect = CGRectMake( 228, 10, 15, 50);
    UIImageView *tutorialImageView = [[UIImageView alloc]initWithFrame:myImageRect];
    [tutorialImageView setImage:[UIImage imageNamed:@"21dot.png"]];
    [self.view addSubview:tutorialImageView];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect1 = CGRectMake( 185, 10, 20, 50);
    UIImageView *tutorialImageView1 = [[UIImageView alloc]initWithFrame:myImageRect1];
    [tutorialImageView1 setImage:[UIImage imageNamed:@"green0.png"]];
    [self.view addSubview:tutorialImageView1];
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect2 = CGRectMake( 206, 10, 20, 50);
    UIImageView *tutorialImageView2 = [[UIImageView alloc]initWithFrame:myImageRect2];
    [tutorialImageView2 setImage:[UIImage imageNamed:@"green0.png"]];
    [self.view addSubview:tutorialImageView2];
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect3 = CGRectMake( 244, 10, 20, 50);
    UIImageView *tutorialImageView3 = [[UIImageView alloc]initWithFrame:myImageRect3];
    [tutorialImageView3 setImage:[UIImage imageNamed:@"green0.png"]];
    [self.view addSubview:tutorialImageView3];
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect4 = CGRectMake( 265, 10, 20, 50);
    UIImageView *tutorialImageView4 = [[UIImageView alloc]initWithFrame:myImageRect4];
    [tutorialImageView4 setImage:[UIImage imageNamed:@"green0.png"]];
    [self.view addSubview:tutorialImageView4];
    
    countdownTimerView.minuteImage1=tutorialImageView1;
    countdownTimerView.minuteImage2=tutorialImageView2;
    countdownTimerView.secondImage1=tutorialImageView3;
    countdownTimerView.secondImage2=tutorialImageView4;
    
    
    UIImage *timerPlayandPauseButtonImage = [UIImage imageNamed:@"play.png"];
  timerPlayandPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    timerPlayandPauseButton.frame = CGRectMake(228, 75, 22, 20);
   [self.view addSubview:timerPlayandPauseButton];
      //[scrollView addSubview:timerPlayandPauseButton];
    [timerPlayandPauseButton addTarget:self action:@selector(timerPlayandPauseButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [timerPlayandPauseButton setImage:timerPlayandPauseButtonImage forState:UIControlStateNormal]; 
    timerPlayandPauseButton=countdownTimerView.playPauseButton;
    
    
    
    
    
    
   /* UIImage *timerPlayandPauseButtonImage = [UIImage imageNamed:@"play.png"];
    timerPlayandPauseButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [timerPlayandPauseButton setFrame:CGRectMake(228, 75, 22, 20)];
    [self.view addSubview:timerPlayandPauseButton];
    [timerPlayandPauseButton addTarget:self action:@selector(timerPlayandPauseButtonClick:)
              forControlEvents:UIControlEventTouchDown];
    timerPlayandPauseButton=countdownTimerView.playPauseButton;
    [timerPlayandPauseButton setImage:timerPlayandPauseButtonImage forState:UIControlStateNormal]; 
    //[self.view addSubview:countdownTimerView];*/
    
  //  off.png

    UIImage * backImage = [UIImage imageNamed:@"RoundBackBtn2.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(225, 150, 28, 28);
    [backButton addTarget:self action:@selector(backButtonClick:)
        forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:backImage forState:UIControlStateNormal];
    //[scrollView addSubview:backButton];
    [self.view addSubview: backButton];
   
    
    
    UIImage * resetImage = [UIImage imageNamed:@"roundresetbtn.png"];
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    resetButton.frame = CGRectMake(225, 183, 28, 28);
    [resetButton addTarget:self action:@selector(resetButtonClick:)
          forControlEvents:UIControlEventTouchUpInside];
    [resetButton setImage:resetImage forState:UIControlStateNormal]; 
   // [scrollView addSubview:resetButton];
  [self.view addSubview: resetButton];
       
    
    UIImage * settingImage = [UIImage imageNamed:@"roundsettingbtn.png"];
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(225, 216, 28, 28);
        [settingButton addTarget:self action:@selector(settingsButtonClick:)
           forControlEvents:UIControlEventTouchUpInside];
    [settingButton setImage:settingImage forState:UIControlStateNormal]; 
    //[scrollView addSubview:settingButton];
   [self.view addSubview: settingButton];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect5 = CGRectMake( 239, 55, 144, 214);
    leftGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect5];
    [leftGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
    // [self.view addSubview:leftHomeImageView];
    leftGuestImageView.userInteractionEnabled=YES;
    [scrollView addSubview:leftGuestImageView];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect6 = CGRectMake( 334, 55, 144, 214);
    rightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRect6];
    [rightGuestImageView setImage:[UIImage imageNamed:@"0.png"]];
    // [self.view addSubview:rightHomeImageView];
    rightGuestImageView.userInteractionEnabled=YES;
    [scrollView addSubview:rightGuestImageView];
 
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect7 = CGRectMake( 480, 55, 144, 214);
    leftHomeImageView = [[UIImageView alloc]initWithFrame:myImageRect7];
    [leftHomeImageView setImage:[UIImage imageNamed:@"off.png"]];
    leftHomeImageView.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];
    
    [scrollView addSubview:leftHomeImageView];
    
    
   
   self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRect8 = CGRectMake( 578, 55, 144, 214);
   rightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRect8];
   [rightHomeImageView setImage:[UIImage imageNamed:@"0.png"]];
    // [self.view addSubview:rightGuestImageView];
   rightHomeImageView.userInteractionEnabled=YES;
    [scrollView addSubview:rightHomeImageView];  

      
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectd = CGRectMake( -7, 55, 144, 214);
    hiddenLeftHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectd];
    [hiddenLeftHomeImageView setImage:[UIImage imageNamed:@"off.png"]];
     hiddenLeftHomeImageView.userInteractionEnabled=YES;
   //[self.view addSubview:hiddenLeftGuestImageView];
    [scrollView addSubview:hiddenLeftHomeImageView];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectc = CGRectMake(89, 55, 144, 214);
    hiddenRightHomeImageView = [[UIImageView alloc]initWithFrame:myImageRectc];
    [hiddenRightHomeImageView setImage:[UIImage imageNamed:@"0.png"]];
     hiddenRightHomeImageView.userInteractionEnabled=YES;
   // [self.view addSubview:hiddenRightGuestImageView];
    [scrollView addSubview:hiddenRightHomeImageView];

   
    
       
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRectg = CGRectMake( 723, 55, 144, 214);
    hiddenLeftGuestImageView = [[UIImageView alloc]initWithFrame:myImageRectg];
    [hiddenLeftGuestImageView setImage:[UIImage imageNamed:@"off.png"]];
    hiddenLeftGuestImageView.userInteractionEnabled=YES;
    //[self.view addSubview:leftGuestImageView];/    
    [scrollView addSubview:hiddenLeftGuestImageView];
    
    
    
    self.view.backgroundColor = [UIColor clearColor];
    CGRect myImageRecth = CGRectMake( 820, 55, 144, 214);
    hiddenRightGuestImageView = [[UIImageView alloc]initWithFrame:myImageRecth];
    [hiddenRightGuestImageView setImage:[UIImage imageNamed:@"0.png"]];
    // [self.view addSubview:rightGuestImageView];
    hiddenRightGuestImageView.userInteractionEnabled=YES;
    [scrollView addSubview:hiddenRightGuestImageView];
    

    
    self.view.backgroundColor = [UIColor blackColor];
    CGRect myMainImageRect = CGRectMake( 1, 0, 480, 320);
    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:myMainImageRect];
    [mainImageView setImage:[UIImage imageNamed:@"bballbackground1.png"]];
    [self.view addSubview:mainImageView];
    

    
    
    //[self.view addSubview:countdownTimerView];
    
	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"basketballhomescore"];
	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"basketballguestscore"];
	homeTextField.delegate = self;
	guestTextField.delegate = self;
	hiddenHomeTextField.delegate = self;
	hiddenGuestTextField.delegate = self;
	
	
	//initializing swipe recognizers
	UISwipeGestureRecognizer *rightHomeImageViewSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightHomeImageViewScoreUp)] autorelease];
	rightHomeImageViewSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[rightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeUp];
	
	UISwipeGestureRecognizer *rightHomeImageViewSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightHomeImageViewScoreDown)] autorelease];
	rightHomeImageViewSwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
	[rightHomeImageView addGestureRecognizer:rightHomeImageViewSwipeDown];
	
	
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
	
	
	
	//scrollview guesture initialization
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *leftSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewLeft)] autorelease];
	leftSwipeUp.direction = UISwipeGestureRecognizerDirectionLeft;	
	[scrollView addGestureRecognizer:leftSwipeUp];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewRight)] autorelease];
	rightSwipeDown.direction = UISwipeGestureRecognizerDirectionRight;
	[scrollView addGestureRecognizer:rightSwipeDown];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetScore) name:@"shake" object:nil];
    //tap gesture 
    //1
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
    
	[self homeScoreChange];
    [self guestScoreChange];

	
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

#pragma mark Scrollview move methods
-(void)moveScrollViewRight{
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	if (scrollView.center.x+MOVE_RANGE>700) {
		[scrollView setCenter:CGPointMake(scrollView.center.x, scrollView.center.y)];
	}
	else {
		[scrollView setCenter:CGPointMake(scrollView.center.x+MOVE_RANGE, scrollView.center.y)];
	}
	[UIView commitAnimations];
	
}


-(void)moveScrollViewLeft{	
	

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	
	if (scrollView.center.x-MOVE_RANGE<-215) {
		[scrollView setCenter:CGPointMake(scrollView.center.x, scrollView.center.y)];
	}
	else {
		[scrollView setCenter:CGPointMake(scrollView.center.x-MOVE_RANGE, scrollView.center.y)];
	}	
	[UIView commitAnimations];
	
}

-(void)viewWillAppear:(BOOL)animated
{
	if (countdownTimerView!=nil) {
		
		countdownTimerView.timerFlag= YES;
        int mins=[[NSUserDefaults standardUserDefaults]integerForKey:@"minutes"];
        int secs=[[NSUserDefaults standardUserDefaults]integerForKey:@"seconds"];

		[countdownTimerView settime:mins seconds:secs];
		
	}
}

// Override to allow orientations other than the default portrait orientation.
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
	[selectedImageViewName release];
	[keyBrdDoneBtnView release]; 
	[rightHomeImageView release];
	[leftHomeImageView release];
	[rightGuestImageView release];
	[leftGuestImageView release];
	[hiddenRightHomeImageView release];
	[hiddenLeftHomeImageView release];
	[hiddenRightGuestImageView release];
	[hiddenLeftGuestImageView release];
	[hiddenHomeTextField release];
	[hiddenGuestTextField release];
	[homeTextField release];
	[guestTextField release];
	[scrollView release];
    [super dealloc];
}
#pragma mark Button click methods
-(IBAction)doneButtonClick:(id)sender
{
	
	[homeTextField resignFirstResponder];
	[guestTextField resignFirstResponder];
	[hiddenHomeTextField resignFirstResponder];
	[hiddenGuestTextField resignFirstResponder];
	
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
	
//	[UIView beginAnimations:nil context:nil];
//  	[UIView setAnimationDuration:0.5];
//	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:YES];
//	[UIView commitAnimations];
//	

    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Attention"
                          message:@"Are You Sure To Reset The Timer" 
                          delegate:self  
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:@"cancel", nil];
    [alert show];
    [alert release];
    
    

	
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{ 
    if (buttonIndex == 0)
    {
        BasketballSettingsViewController *basketballSettingsViewController = [[BasketballSettingsViewController alloc]  init];
        
        basketballSettingsViewController.homeName=homeTextField.text;
        basketballSettingsViewController.guestName=guestTextField.text;
        
        basketballSettingsViewController.homeScore =homeScoreIndex;
        basketballSettingsViewController.guestScore = guestScoreIndex;
        [self.navigationController pushViewController:basketballSettingsViewController animated:NO];
        [basketballSettingsViewController release];
        
        
    }
 
}

- (IBAction)resetButtonClick:(id)sender {
	
	UIActionSheet *resetActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reset Names",@"Reset Score", @"Reset Both", nil];
    [resetActionSheet setTag:ACTION_SHEET_TAG];
    [resetActionSheet showInView:self.view];
    [resetActionSheet release];
	
}
-(IBAction)timerPlayandPauseButtonClick:(id)sender
{
    UIButton *button=(UIButton *)sender;
    [countdownTimerView playPauseTimer:button];
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
	homeTextField.text=@"Home";
	guestTextField.text=@"Guest";
	hiddenHomeTextField.text=@"Home";
	hiddenGuestTextField.text=@"Guest";
}


-(void)resetScore
{
	homeScoreIndex = 0;
	guestScoreIndex = 0;
	[self setupImage:leftHomeImageView :0];
	[self setupImage:rightHomeImageView :0];
	[self setupImage:leftGuestImageView :0];
	[self setupImage:rightGuestImageView :0];
	[self setupImage:hiddenLeftHomeImageView :0];
	[self setupImage:hiddenRightHomeImageView :0];
	[self setupImage:hiddenLeftGuestImageView :0];
	[self setupImage:hiddenRightGuestImageView :0];
}
-(void)resetTimer
{
    
}

-(void)resetBoth
{
	[self resetNames];
	[self resetScore];
}


#pragma mark -
#pragma mark Text field delegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	
	[hiddenHomeTextField resignFirstResponder];
	[hiddenGuestTextField resignFirstResponder];
	[homeTextField resignFirstResponder];
	[guestTextField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
	
	if (textField.inputAccessoryView == nil) {
		// Loading the AccessoryView nib file sets the accessoryView outlet.
		textField.inputAccessoryView = keyBrdDoneBtnView;
	}
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.3	];
	[UIView setAnimationBeginsFromCurrentState:YES];
	self.view.frame = CGRectMake(0, -150, self.view.frame.size.width, self.view.frame.size.height);
	[UIView commitAnimations];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	
	
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
	[UIView commitAnimations];
	
	return YES;
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
	
	if(homeScoreIndex < 100)
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
			
			hiddenLeftHomeImageView.image = [UIImage imageNamed:@"off.png"];
			leftHomeImageView.image = [UIImage imageNamed:@"off.png"];
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
			hiddenLeftGuestImageView.image = [UIImage imageNamed:@"off.png"];
			leftGuestImageView.image = [UIImage imageNamed:@"off.png"];
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
	switch (digit) {
		case 0:
			[imgView setImage:[UIImage imageNamed:@"0.png"]];
			break;	
		case 1:
			[imgView setImage:[UIImage imageNamed:@"1.png"]];
			break;	
		case 2:
			[imgView setImage:[UIImage imageNamed:@"2.png"]];
			break;	
		case 3:
			[imgView setImage:[UIImage imageNamed:@"3.png"]];
			break;	
		case 4:
			[imgView setImage:[UIImage imageNamed:@"4.png"]];
			break;	
		case 5:
			[imgView setImage:[UIImage imageNamed:@"5.png"]];
			break;	
		case 6:
			[imgView setImage:[UIImage imageNamed:@"6.png"]];
			break;	
		case 7:
			[imgView setImage:[UIImage imageNamed:@"7.png"]];
			break;	
		case 8:
			[imgView setImage:[UIImage imageNamed:@"8.png"]];
			break;	
		case 9:
			[imgView setImage:[UIImage imageNamed:@"9.png"]];
			break;	
	}
}

@end
