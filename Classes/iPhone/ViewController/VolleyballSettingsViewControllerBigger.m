//
//  VolleyballSettingsViewControllerBigger.m
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/16/12.
//
//

#import "VolleyballSettingsViewControllerBigger.h"

@interface VolleyballSettingsViewControllerBigger ()

@end

@implementation VolleyballSettingsViewControllerBigger
@synthesize hBlue,hRed,hSky,hPink,hGreen,hOrange,hPurple,hYellow,gRed,gSky,gBlue,gPink,gGreen,gOrange,gPurple,gYellow,hGray,hBlack,gGray,gBlack, homeTitle,guestTitle,homeScore,guestScore;

@synthesize minutesArray,secondsArray,timePicker,minutesLable,secondsLable;
@synthesize aLable,setTimerLable;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil hometitle:(NSString *)home guesttitle:(NSString *)guest {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeTitle=home;
		self.guestTitle=guest;
    }
    return self;
}

#pragma mark Fullscreen








// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *BackGround=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"volleySettingsBackground - 5.jpg"]]];
    [BackGround setFrame:CGRectMake(0, 0, 568, 320)];
    [self.view addSubview:BackGround];
    
    HomeColourChooseLabel = [[UILabel alloc] init];
	[HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.jpg"]]];
	[HomeColourChooseLabel setFont:[UIFont fontWithName:@"Arial" size:60]];
	//[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
    [HomeColourChooseLabel setText:@"here"];
    [HomeColourChooseLabel setTextAlignment:UITextAlignmentCenter];
    
	[HomeColourChooseLabel setUserInteractionEnabled:YES];
	[HomeColourChooseLabel setTextColor:[UIColor whiteColor]];
//	HomeColourChooseLabel.layer.anchorPoint=CGPointMake(0,0);
	[self.view addSubview:HomeColourChooseLabel];
    [HomeColourChooseLabel setFrame:CGRectMake(330, 69, 146, 164)];
    
	//adding swipe guesture to the lable
	UISwipeGestureRecognizer *HomeScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(HomeScoreLableScoreUp)] autorelease];
	HomeScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[HomeColourChooseLabel addGestureRecognizer:HomeScoreLableSwipeUp];
	
	//adding swipe guesture to the lable
	
    
    GuestColourChooseLabel=[[UILabel alloc]init];
    [GuestColourChooseLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orange.png"]]];
    [GuestColourChooseLabel setFont:[UIFont fontWithName:@"Arial" size:60]];
	//[self setAlignmentForLable:frontHomeScoreLable withScore:frontHomeLableScore];
    [GuestColourChooseLabel setText:@"tap"];
    [GuestColourChooseLabel setTextAlignment:UITextAlignmentCenter];
    
	[GuestColourChooseLabel setUserInteractionEnabled:YES];
	[GuestColourChooseLabel setTextColor:[UIColor whiteColor]];
	//GuestColourChooseLabel.layer.anchorPoint=CGPointMake(0,0);
	[self.view addSubview:GuestColourChooseLabel];
    [GuestColourChooseLabel setFrame:CGRectMake(92.5, 69, 146, 164)];
    
    
    
    
    UISwipeGestureRecognizer *GuestScoreLableSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(GuestScoreLableScoreUp)] autorelease];
	GuestScoreLableSwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
	[GuestColourChooseLabel addGestureRecognizer:GuestScoreLableSwipeUp];
    
    
    
    
    
    UITapGestureRecognizer *homeScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(HomeScoreLableScoreUp)];
    [homeScoreLabelTap setNumberOfTapsRequired:1];
    [homeScoreLabelTap setNumberOfTouchesRequired:1];
    [HomeColourChooseLabel addGestureRecognizer:homeScoreLabelTap];
    
    UITapGestureRecognizer *GuestScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GuestScoreLableScoreUp)];
    [GuestScoreLabelTap setNumberOfTapsRequired:1];
    [GuestScoreLabelTap setNumberOfTouchesRequired:1];
    [GuestColourChooseLabel addGestureRecognizer:GuestScoreLabelTap];
    
    [self.view setBackgroundColor: [UIColor blackColor]];
    UIImage * buttonImage = [UIImage imageNamed:@"Facebook_icon.png"];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 500, 150, 100);
    [btn setImage:buttonImage forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(facebookButtonClick)
  forControlEvents:UIControlEventTouchDown];
    
    
    //  [self.view addSubview:btn];
    
    
    
    
    
    UIImage *backImage=[UIImage imageNamed:@"cancelButton.png"];
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(430, 280,35, 35);
    [backbutton addTarget:self action:@selector(CancelButton:) forControlEvents:UIControlEventTouchDown];
    [backbutton setImage:backImage forState:UIControlStateNormal];
    [self.view addSubview:backbutton];
    
    
    
    
    UIImage * buttonImage1 = [UIImage imageNamed:@"TutorialBtn.png"];
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 600, 150, 70);
    [btn1 setImage:buttonImage1 forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(tutorialButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //   [self.view addSubview:btn1];
    
    UIImage * buttonImage2 = [UIImage imageNamed:@"doneButton.png"];
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(490, 280,45, 35);
    [btn2 setImage:buttonImage2 forState:UIControlStateNormal];
    [btn2 addTarget:self
             action:@selector(saveButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
    mainImageView = [[UIImageView alloc]init];
    [mainImageView setImage:[UIImage imageNamed:@"19_p2.jpeg"]];
    [self.view addSubview:mainImageView];
    
    guestImageView = [[UIImageView alloc]init];
    [guestImageView setImage:[UIImage imageNamed:@"19_p1.jpeg"]];
    [self.view addSubview:guestImageView];
    
    
    
    NSString *homeLableImageName1=[[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"];
    
    
    if (homeLableImageName1==@"red5.jpg") {
        HomeColorNumber=1;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSettings5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"blue5.jpg") {
        HomeColorNumber=2;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSettings5.jpg"]]];    }
    else if (homeLableImageName1==@"orange5.jpg") {
        
        HomeColorNumber=3;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSettings5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"green5.jpg") {
        HomeColorNumber=4;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSettings5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"grey5.jpg") {
        HomeColorNumber=5;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySettings5.jpg"]]];
        
    }
    else if (homeLableImageName1==@"pink5.jpg") {
        HomeColorNumber=6;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSettings5.jpg"]]];
    }
    else if (homeLableImageName1==@"purple5.jpg") {
        HomeColorNumber=7;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSettings5.jpg"]]];
        
    }
    
    else if (homeLableImageName1==@"yellow5.jpg") {
        HomeColorNumber=8;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSettings5.jpg"]]];
        
        
    }
    else if (homeLableImageName1==@"black5.jpg") {
        HomeColorNumber=9;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSettings5.jpg"]]];
    }
    else if (homeLableImageName1==@"sky5.jpg") {
        
        HomeColorNumber=10;
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySettings5.jpg"]]];
    }
    
    
    NSLog(@"The Home color number is %d",HomeColorNumber);
    
    
    
    
    
    
    NSString *guestLableImageName=[[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"];
    
    if (guestLableImageName==@"red5.jpg") {
        
        
        GuestColorNumber=1;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSettings5.jpg"]]];
        
        
    }
    else if (guestLableImageName==@"blue5.jpg") {
        
        GuestColorNumber=2;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSettings5.jpg"]]];
    }
    else if (guestLableImageName==@"orange5.jpg") {
        
        GuestColorNumber=3;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSettings5.jpg"]]];
        
    }
    else if (guestLableImageName==@"green5.jpg") {
        
        GuestColorNumber=4;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSettings5.jpg"]]];
        
    }
    else if (guestLableImageName==@"grey5.jpg") {
        
        GuestColorNumber=5;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySettings5.jpg"]]];
        
        
    }
    else if (guestLableImageName==@"pink5.jpg") {
        
        GuestColorNumber=6;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSettings5.jpg"]]];
        
        
    }
    else if (guestLableImageName==@"purple5.jpg") {
        
        GuestColorNumber=7;
        
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSettings5.jpg"]]];
        
    }
    else if (guestLableImageName==@"yellow5.jpg") {
        
        GuestColorNumber=8;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSettings5.jpg"]]];
        
    }
    
    else if (guestLableImageName==@"black5.jpg") {
        
        GuestColorNumber=9;
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSettings5.jpg"]]];
        
        
    }
    
    else if (guestLableImageName==@"sky5.jpg") {
        
        GuestColorNumber=10;
        
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySettings5.jpg"]]];
        
    }
    
    
    
    
    
}






-(void)HomeScoreLableScoreUp
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self->HomeColourChooseLabel cache:YES];
    
    
    if (HomeColorNumber==1) {
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSettings5.jpg"]]];
    }
    else if (HomeColorNumber==2){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSettings5.jpg"]]];
    }
    else if (HomeColorNumber==3){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSettings5.jpg"]]];
    }
    else if (HomeColorNumber==4){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySettings5.jpg"]]];
    }
    else if (HomeColorNumber==5){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSettings5.jpg"]]];
    }
    else if (HomeColorNumber==6){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSettings5.jpg"]]];
    }
    else if (HomeColorNumber==7){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSettings5.jpg"]]];
    }
    else if (HomeColorNumber==8){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSettings5.jpg"]]];
    }
    else if (HomeColorNumber==9){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySettings5.jpg"]]];
    }
    else if (HomeColorNumber==10){
        [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSettings5.jpg"]]];
    }
    
    
    
    
    if (HomeColorNumber<10) {
        HomeColorNumber++;
        
    }
    else{
        HomeColorNumber=1;
        
    }
    
    
    
    [UIView commitAnimations];
    
    // [HomeColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow.jpg"]]];
	//HomeColourChooseLabel +=1;
    //[HomeColourChooseLabel setText:[NSString stringWithFormat:@"%d",frontHomeLableScore]];
    //[self playSound];
    
}
-(void)GuestScoreLableScoreUp{
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.85];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self->GuestColourChooseLabel cache:YES];
    [UIView commitAnimations];
    
    //    [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.jpg"]]];
    if (GuestColorNumber==1) {
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blueSettings5.jpg"]]];
    }
    else if (GuestColorNumber==2){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orangeSettings5.jpg"]]];
    }
    else if (GuestColorNumber==3){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenSettings5.jpg"]]];
    }
    else if (GuestColorNumber==4){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greySettings5.jpg"]]];
    }
    else if (GuestColorNumber==5){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pinkSettings5.jpg"]]];
    }
    else if (GuestColorNumber==6){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleSettings5.jpg"]]];
    }
    else if (GuestColorNumber==7){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yellowSettings5.jpg"]]];
    }
    else if (GuestColorNumber==8){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blackSettings5.jpg"]]];
    }
    else if (GuestColorNumber==9){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"skySettings5.jpg"]]];
    }
    else if (GuestColorNumber==10){
        [GuestColourChooseLabel  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redSettings5.jpg"]]];
    }
    
    
    NSLog(@"The guest score number is equall to the %d",GuestColorNumber);
    if (GuestColorNumber<10) {
        GuestColorNumber++;
        
    }
    else{
        GuestColorNumber=1;
        
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


-(IBAction)ColorSelection:(id)sender{
    //UIButton *currentButton = (UIButton *)sender;
    //[currentButton setBackgroundImage:[UIImage imageNamed:@"19_p2.jpeg"] forState:UIControlStateNormal];
    
    
    
    if(HomeColorNumber==1){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"red.jpg"forKey:@"homeScoreLableColour"];
    }
    
    else if (HomeColorNumber==2) {
        [[NSUserDefaults standardUserDefaults] setObject:@"blue.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==3){
        [[NSUserDefaults standardUserDefaults] setObject:@"orange.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==4){
        [[NSUserDefaults standardUserDefaults] setObject:@"green.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==5){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"grey.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==6){
        [[NSUserDefaults standardUserDefaults] setObject:@"pink.jpg"forKey:@"homeScoreLableColour"];
    }
    
    else if(HomeColorNumber==7){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"purple.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==8){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"yellow.jpg"forKey:@"homeScoreLableColour"];
    }
    else if(HomeColorNumber==9){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"black.jpg"forKey:@"homeScoreLableColour"];
        
    }
    else if(HomeColorNumber==10){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"sky.jpg"forKey:@"homeScoreLableColour"];
        
    }
    else if(GuestColorNumber==1){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"red.jpg"forKey:@"guestScoreLableColour"];
    }
    else if(GuestColorNumber==2){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"blue.jpg"forKey:@"guestScoreLableColour"];
    }
    else if(GuestColorNumber==3){
        [[NSUserDefaults standardUserDefaults] setObject:@"orange.jpg"forKey:@"guestScoreLableColour"];
    }
    else if(GuestColorNumber==4){
        [[NSUserDefaults standardUserDefaults] setObject:@"green.jpg"forKey:@"guestScoreLableColour"];
    }
    else if(GuestColorNumber==5){
        [[NSUserDefaults standardUserDefaults] setObject:@"grey.jpg"forKey:@"guestScoreLableColour"];
    }
    else if(GuestColorNumber==6){
        [[NSUserDefaults standardUserDefaults] setObject:@"pink.jpg"forKey:@"guestScoreLableColour"];
    }
    
    else if(GuestColorNumber==7){
        [[NSUserDefaults standardUserDefaults] setObject:@"purple.jpg"forKey:@"guestScoreLableColour"];
    }
    else if (GuestColorNumber==8){
        [[NSUserDefaults standardUserDefaults] setObject:@"yellow.jpg"forKey:@"guestScoreLableColour"];
    }
    else if (GuestColorNumber==9){
        [[NSUserDefaults standardUserDefaults] setObject:@"black.jpg"forKey:@"guestScoreLableColour"];
    }
    
    else if (GuestColorNumber==10){
        [[NSUserDefaults standardUserDefaults] setObject:@"sky.jpg"forKey:@"guestScoreLableColour"];
        
    }
    
    
}



-(IBAction)tutorialButtonClick:(id)sender
{
    //	TutorialViewController_iPad *tutorialViewController = [[TutorialViewController_iPad alloc] initWithNibName:@"TutorialViewController" bundle:nil];
    //	tutorialViewController.vollyBallScore= YES;
    //	[self presentModalViewController:tutorialViewController animated:YES];
    //	[tutorialViewController release];
    //
}

- (void)dealloc {
    [super dealloc];
	[homeUserSegmentedControll release];
	[guestUserSegmentedControll release];
	
}

-(IBAction)saveButtonClick:(id)sender
{
    
    NSLog(@"the home andd guest color numberes are H:%d,G%d",HomeColorNumber,GuestColorNumber);
    
    if(HomeColorNumber==1){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"red5.jpg"forKey:@"homeScoreLableColour5"];
    }
    
    else if (HomeColorNumber==2) {
        [[NSUserDefaults standardUserDefaults] setObject:@"blue5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==3){
        [[NSUserDefaults standardUserDefaults] setObject:@"orange5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==4){
        [[NSUserDefaults standardUserDefaults] setObject:@"green5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==5){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"grey5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==6){
        [[NSUserDefaults standardUserDefaults] setObject:@"pink5.jpg"forKey:@"homeScoreLableColour5"];
    }
    
    else if(HomeColorNumber==7){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"purple5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==8){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"yellow5.jpg"forKey:@"homeScoreLableColour5"];
    }
    else if(HomeColorNumber==9){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"black5.jpg"forKey:@"homeScoreLableColour5"];
        
    }
    else if(HomeColorNumber==10){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"sky5.jpg"forKey:@"homeScoreLableColour5"];
        
    }
    
    
    if(GuestColorNumber==1){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"red5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if(GuestColorNumber==2){
        
        [[NSUserDefaults standardUserDefaults] setObject:@"blue5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if(GuestColorNumber==3){
        [[NSUserDefaults standardUserDefaults] setObject:@"orange5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if(GuestColorNumber==4){
        [[NSUserDefaults standardUserDefaults] setObject:@"green5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if(GuestColorNumber==5){
        [[NSUserDefaults standardUserDefaults] setObject:@"grey5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if(GuestColorNumber==6){
        [[NSUserDefaults standardUserDefaults] setObject:@"pink5.jpg"forKey:@"guestScoreLableColour5"];
    }
    
    else if(GuestColorNumber==7){
        [[NSUserDefaults standardUserDefaults] setObject:@"purple5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if (GuestColorNumber==8){
        [[NSUserDefaults standardUserDefaults] setObject:@"yellow5.jpg"forKey:@"guestScoreLableColour5"];
    }
    else if (GuestColorNumber==9){
        [[NSUserDefaults standardUserDefaults] setObject:@"black5.jpg"forKey:@"guestScoreLableColour5"];
    }
    
    else if (GuestColorNumber==10){
        [[NSUserDefaults standardUserDefaults] setObject:@"sky5.jpg"forKey:@"guestScoreLableColour5"];
        
    }
    
    
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
    
    [UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
    //
    
	[self.navigationController popViewControllerAnimated:NO];
	
}
-(IBAction)CancelButton:(id)sender{
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
    
    [UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
    //
    
	[self.navigationController popViewControllerAnimated:NO];
	
    
}
-(IBAction)facebookButtonClick {
    //	SoundHouseLLC_iPad *shllc=[[SoundHouseLLC_iPad alloc]initWithNibName:@"SoundHouseLLC" bundle:nil];
    //    [self.navigationController pushViewController:shllc animated:YES];
    //    [shllc release];
    
    
	
    //	Facebook *facebook = [( ScoreboardAppDelegate *)[[UIApplication sharedApplication] delegate] faceBook];
    //
    //    facebook.sessionDelegate = self;
    //
    //	if ([facebook isSessionValid]) {
    //		NSLog(@"session is valid. starting stream publishing");
    //
    //		NSLog(@"homescore;%i",[[NSUserDefaults standardUserDefaults] integerForKey:@"homescore"]);
    //		NSLog(@"guestscore;%i",[[NSUserDefaults standardUserDefaults] integerForKey:@"guestscore"]);
    //
    //		NSString *messageToPost = [NSString stringWithFormat:@"%@ : %i       %@ : %i",self.homeTitle, homeScore, self.guestTitle, guestScore];//[NSString stringWithString:@"I am invincible"];
    //
    //		NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"5108de59ff507ac23fc7710d2a84c4e5", @"api_key",messageToPost,@"message", nil];
    //
    //		[facebook dialog: @"stream.publish" andParams: params andDelegate:self];
    //
    //	} else {
    //		NSLog(@"session is not valid. authorizing");
    //
    //		[facebook authorize:@"5108de59ff507ac23fc7710d2a84c4e5" permissions:[NSArray arrayWithObjects:@"publish_stream",@"offline_access", nil] delegate:self];
    //	}
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// FBRequestDelegate

/**
 * Callback when a request receives Response
 */

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
