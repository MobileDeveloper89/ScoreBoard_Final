//
//  BasketballSettingsViewController_iPad.m
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BasketballSettingsViewController_iPad.h"
#import "BasketballMainViewController_iPad.h"
#import"CountdownTimer.h"
#import"ScoreboardAppDelegate.h"
#import "TutorialViewController.h"
#import "SoundHouseLLC_iPad.h"

static BOOL secSelected=0,minSelected=0;

@implementation BasketballSettingsViewController_iPad
@synthesize minutesArray,secondsArray,timePicker,minutesLable,secondsLable,homeName,guestName,homeScore,guestScore;
@synthesize setTimerLable,aLable,fbButton,tutorialButton,homeButton;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil home:(NSString *)hName guest:(NSString *)gName {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeName=hName;
		self.guestName=gName;
    }
    return self;
}

#pragma mark Fullscreen








// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    ThemeColour=[[NSUserDefaults standardUserDefaults]integerForKey:@"DigitalThemeNumber"];
    NSLog(@"The theme color is equall to %d",ThemeColour);
    
    UIImageView *BackGround=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"digitalSettingsBackground-ipad.jpg"]];
    
    [BackGround setFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:BackGround];
    
    
    CGRect themeTrailposition = CGRectMake( 660, 175, 255, 360);
    ThemeTrailsImageView = [[UIImageView alloc]initWithFrame:themeTrailposition];
    if (ThemeColour==1) {
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
        
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"sb0.png"]];
        
        
    }
    else if (ThemeColour==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotBlue0.png"]];
    }
    else if (ThemeColour==3){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotYellow0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
    }else if(ThemeColour==4){
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotWhite0.png"]];
    }    // [self.view addSubview:rightGuestImageView];
    ThemeTrailsImageView.userInteractionEnabled=YES;
    [self.view addSubview:ThemeTrailsImageView];
    
    UISwipeGestureRecognizer *ThemeTrails = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ThemetrailsUpMethod)] autorelease];
	ThemeTrails.direction = UISwipeGestureRecognizerDirectionUp;
	[ThemeTrailsImageView addGestureRecognizer:ThemeTrails];
   
    
    UITapGestureRecognizer *homeScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ThemetrailsUpMethod)];
    [homeScoreLabelTap setNumberOfTapsRequired:1];
    [homeScoreLabelTap setNumberOfTouchesRequired:1];
    [ThemeTrailsImageView addGestureRecognizer:homeScoreLabelTap];
    
    
    
	minutesArray=[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",nil];
	secondsArray=[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",nil];
    
    [timePicker setDataSource: self];
    [timePicker setDelegate: self];
    
    // Calculate the screen's width.
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    //float pickerWidth = screenWidth * 3 / 4;
    
    // Calculate the starting x coordinate.
    // float xPoint = screenWidth / 2 - pickerWidth / 2;
    
    // Init the picker view.
    timePicker = [[UIPickerView alloc] init];
    
    // Set the delegate and datasource. Don't expect picker view to work
    // correctly if you don't set it.
    [timePicker setDataSource: self];
    [timePicker setDelegate: self];
    
    // Set the picker's frame. We set the y coordinate to 50px.
    //[timePicker setFrame: CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];
    //[timePicker setFrame: CGRectMake(33, 40, 200, 150)];
    [timePicker setFrame: CGRectMake(95, 280, 433, 216)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    timePicker.showsSelectionIndicator = YES;
    	timePicker.transform = CGAffineTransformMakeScale(1.0, 1.2);
    // Allow us to pre-select the third option in the pickerView.
    [timePicker selectRow:0 inComponent:0 animated:YES];
    // OK, we are ready. Add the picker in our view.
    [self.view addSubview: timePicker];
    
    //CGRect labelFrameSet = CGRectMake( 63, 18, 81, 21 );
    CGRect labelFrameSet = CGRectMake( 53, 170, 130, 40 );
    setTimerLable = [[UILabel alloc] initWithFrame: labelFrameSet];
    [setTimerLable setText: @"Set Timer:"];
    setTimerLable.backgroundColor=[UIColor clearColor];
    [setTimerLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [setTimerLable setTextColor: [UIColor whiteColor]];
    [self.view addSubview: setTimerLable];
    
    
    CGRect labelFrameMin = CGRectMake( 183, 170, 45, 40 );
    //CGRect labelFrameMin = CGRectMake( 145, 18, 35, 21 );
    minutesLable = [[UILabel alloc] initWithFrame: labelFrameMin];
    [minutesLable setText: @"Min"];
    minutesLable.backgroundColor=[UIColor clearColor];
    [minutesLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [minutesLable setTextColor: [UIColor whiteColor]];
    [self.view addSubview: minutesLable];
    
    CGRect labelFrameA = CGRectMake( 229, 175, 5, 30 );
    //CGRect labelFrameA = CGRectMake( 179, 18, 10, 21 );
    aLable = [[UILabel alloc] initWithFrame: labelFrameA];
    [aLable setText: @":"];
    aLable.backgroundColor=[UIColor clearColor];
     [aLable setTextColor: [UIColor whiteColor]];
    [self.view addSubview: aLable];
    
    
    CGRect labelFrameSec = CGRectMake( 236, 170, 60, 40 );
    // CGRect labelFrameSec = CGRectMake( 190, 18, 35, 21 );
    secondsLable = [[UILabel alloc] initWithFrame: labelFrameSec];
    [secondsLable setText: @"Sec"];
    secondsLable.backgroundColor=[UIColor clearColor];
    [secondsLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [secondsLable setTextColor: [UIColor whiteColor]];
    [self.view addSubview: secondsLable];
   // [self.view setBackgroundColor: [UIColor purpleColor]];
    /* CGRect fbButtonFrame = CGRectMake(33, 220, 50, 20);
     UIButton *fbbutton = [[UIButton alloc] initWithFrame: fbButtonFrame];
     [fbbutton setTitle: @"Fb" forState: UIControlStateNormal];
     [fbbutton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
     [self.view addSubview: fbbutton];*/
    
    
    UIImage * fbImage = [UIImage imageNamed:@"Facebook_icon.png"];
    
    UIButton *fbbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    fbbutton.frame = CGRectMake(50, 500, 150, 100);
   // fbbutton.frame = CGRectMake(33, 220, 30, 30);

    [fbbutton addTarget:self action:@selector(facebookButtonClick)
       forControlEvents:UIControlEventTouchDown];
    
    
    [fbbutton setImage:fbImage forState:UIControlStateNormal]; 
   // [self.view addSubview: fbbutton];
    
    
    
    /*CGRect tutorialButtonFrame = CGRectMake(33, 235, 100, 30);
     tutorialButton = [[UIButton alloc] initWithFrame: tutorialButtonFrame];
     [tutorialButton setTitle: @"Tutorial" forState: UIControlStateNormal];
     [tutorialButton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
     [self.view addSubview: tutorialButton];
     
     [tutorialButton addTarget:self action:@selector(tutorialButtonClick:) forControlEvents:UIControlEventTouchDown];*/
    
    
    UIImage * tutorialImage = [UIImage imageNamed:@"TutorialBtn.png"];
    
    tutorialButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tutorialButton.frame = CGRectMake(50, 600, 150, 70);
    [tutorialButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:70]];
    //tutorialButton.frame = CGRectMake(33, 250, 135, 35);
    [tutorialButton addTarget:self action:@selector(tutorialButtonClick:)
             forControlEvents:UIControlEventTouchDown];
    
    [tutorialButton setImage:tutorialImage forState:UIControlStateNormal]; 
   // [self.view addSubview: tutorialButton];
    
        
    
    UIImage * btnImage = [UIImage imageNamed:@"doneButton.png"];
    
    homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //homeButton.frame = CGRectMake(350, 250, 100, 30);
     homeButton.frame = CGRectMake(870, 690, 90, 70);
    [homeButton addTarget:self action:@selector(saveButtonClick:)
         forControlEvents:UIControlEventTouchDown];
    
    [homeButton setImage:btnImage forState:UIControlStateNormal]; 
    [self.view addSubview: homeButton];
    
    
    
    
    UIImage *backImage=[UIImage imageNamed:@"cancelButton.png"];
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(770, 690, 70, 70);
    [backbutton addTarget:self action:@selector(tutorialButtonClick:) forControlEvents:UIControlEventTouchDown];
    [backbutton setImage:backImage forState:UIControlStateNormal];
    [self.view addSubview:backbutton];
    
    
    
    /*[btn2 addTarget:self 
     action:@selector(saveButtonClick:)
     forControlEvents:UIControlEventTouchDown]; */
    
    /*UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 435)];
     scroll.contentSize = CGSizeMake(320, 700);
     scroll.showsHorizontalScrollIndicator = YES;
     
     
     [self.view addSubview:scroll];*/
    
    
    // Do any additional setup after loading the view from its nib.
    
    /*CGRect labelFrame = CGRectMake( 10, 40, 500, 30 );
     UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
     [label setText: @"WelCome To SPTCS"];
     [label setTextColor: [UIColor redColor]];
     [self.view addSubview: label];*/
}

#pragma mark Gesturemethods

-(void)ThemetrailsUpMethod{
    NSLog(@"its swiped up");
    
    if (ThemeColour==1) {
       // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
      
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotBlue0.png"]];
        
        
    }
    else if (ThemeColour==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
         [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotYellow0.png"]];
    }
    else if (ThemeColour==3){
         [ThemeTrailsImageView setImage:[UIImage imageNamed:@"dotWhite0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
         
    }else if(ThemeColour==4){
       // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
          [ThemeTrailsImageView setImage:[UIImage imageNamed:@"sb0.png"]];
    }
    
    if (ThemeColour<4) {
        ThemeColour++;
    }
    else{
        ThemeColour=1;
    }


}
#pragma mark picker datasource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component==0) {
		return [minutesArray count];
	}
	else {
		return [secondsArray count];
	}
	return 0;
	
	
}
#pragma mark 
#pragma mark picker delegatr methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (component==0) {
		minSelected=1;
		NSString *rowTitle=[minutesArray objectAtIndex:row];
		rowTitle=[rowTitle stringByAppendingString:@" Min"];
		return rowTitle;
	}
	else {
		NSString *rowTitle=[secondsArray objectAtIndex:row];
		rowTitle=[rowTitle stringByAppendingString:@" Sec"];		
		return rowTitle; 
	}
	return @"";
	
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if (component==0) {
		minSelected=1;
		NSMutableString *minutesString=[[NSMutableString alloc] initWithString:[minutesArray objectAtIndex:row]];
		minutesLable.text=minutesString;
		[minutesString release];
	}
	else {
		secSelected=1;
		secondsLable.text=[secondsArray objectAtIndex:row];
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
	[timePicker release];
	[minutesArray release];
	[secondsArray release];
	[minutesLable release];
	[secondsLable release];
	
    [super dealloc];
}

#pragma mark Button click events
-(IBAction) saveButtonClick:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:ThemeColour  forKey:@"DigitalThemeNumber"];
    [prefs synchronize];
    
	[[NSUserDefaults standardUserDefaults] setInteger:[minutesLable.text intValue] forKey:@"minutes"];
	[[NSUserDefaults standardUserDefaults] setInteger:[secondsLable.text intValue] forKey:@"seconds"];
    
	[UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
    //
	[self.navigationController popViewControllerAnimated:NO];
    
	
	
}

-(IBAction)tutorialButtonClick:(id)sender
{
//	TutorialViewController *tutorialViewController = [[TutorialViewController alloc] initWithNibName:@"TutorialViewController" bundle:nil];
//    
//	[self presentModalViewController:tutorialViewController animated:YES];
//	tutorialViewController.vollyBallScore= NO;
//	[tutorialViewController release];
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
    //
	[self.navigationController popViewControllerAnimated:NO];
    

	
}

-(IBAction)facebookButtonClick {
	
	SoundHouseLLC_iPad *shllc=[[SoundHouseLLC_iPad alloc]init];
    //WithNibName:@"" bundle:nil];
    [self.navigationController pushViewController:shllc animated:YES];
    [shllc release];
    //	Facebook *facebook = [( ScoreboardAppDelegate *)[[UIApplication sharedApplication] delegate] faceBook];
    //	
    //	facebook.sessionDelegate = self;
    //	
    //	if ([facebook isSessionValid]) {
    //		NSLog(@"session is valid. starting stream publishing");
    //		
    //		NSLog(@"homescore;%i",[[NSUserDefaults standardUserDefaults] integerForKey:@"homescore"]);
    //		NSLog(@"guestscore;%i",[[NSUserDefaults standardUserDefaults] integerForKey:@"guestscore"]);
    //		
    //		NSString *messageToPost = [NSString stringWithFormat:@"%@ : %i       %@ : %i",self.homeName, homeScore,self.guestName, guestScore];//[NSString stringWithString:@"I am invincible"];
    //        
    //		NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"5108de59ff507ac23fc7710d2a84c4e5", @"api_key",messageToPost,@"message", nil];
    //		
    //		[facebook dialog: @"stream.publish" andParams: params andDelegate:self];
    //		
    //	} else 
    //	{
    //		NSLog(@"session is not valid. authorizing");		
    //		[facebook authorize:@"5108de59ff507ac23fc7710d2a84c4e5" permissions:[NSArray arrayWithObjects:@"publish_stream",@"offline_access", nil] delegate:self];	
    //	}
    
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// FBRequestDelegate

/**
 * Callback when a request receives Response
 */ 
- (void)request:(FBRequest*)request didReceiveResponse:(NSURLResponse*)response{
	NSLog(@"received response");
}

/**
 * Called when an error prevents the request from completing successfully.
 */
- (void)request:(FBRequest*)request didFailWithError:(NSError*)error{
	NSLog(@"error");
}

/**
 * Called when a request returns and its response has been parsed into an object.
 * The resulting object may be a dictionary, an array, a string, or a number, depending
 * on thee format of the API response.
 */
- (void)request:(FBRequest*)request didLoad:(id)result{
	if ([result isKindOfClass:[NSArray class]]) {
		result = [result objectAtIndex:0]; 
	}
	if ([result objectForKey:@"owner"]) {
		//[self.label setText:@"Photo upload Success"];
	} else {
		NSLog(@"logged in!");
	}
	NSLog(@"request did load");
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBDialogDelegate

/** 
 * Called when a UIServer Dialog successfully return
 */
- (void)dialogDidComplete:(FBDialog*)dialog{
	NSLog(@"dialog did complete");
	if ([dialog isMemberOfClass:[FBLoginDialog class]]) NSLog(@"login succeeded!");
        }


/**
 * Called when the dialog successful log in the user
 */
- (void)fbDidLogin {
	NSLog(@"did log in!");
	[self facebookButtonClick];
}

/**
 * Called when the user dismiss the dialog without login
 */
- (void)fbDidNotLogin {
	NSLog(@"couldnt log in. bummer!");	
}

/**
 * Called when the user is logged out
 */
- (void)fbDidLogout {
	NSLog(@"logged out");	
}


-(void)fbDialogNotLogin
{
	
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end

