//
//  Theme2settingsViewControllerBigger.m
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/16/12.
//
//

#import "Theme2settingsViewControllerBigger.h"

@interface Theme2settingsViewControllerBigger ()

@end

@implementation Theme2settingsViewControllerBigger

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    
    
    if (self) {
        // Custom initialization
    }
    return self;
    
    
}

#pragma mark Fullscreen








- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImageView *BackGround=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"volleySettingsBackground - 5.jpg"]]];
    [BackGround setFrame:CGRectMake(0, 0, 568, 320)];
    [self.view addSubview:BackGround];
    UIImage *backImage=[UIImage imageNamed:@"cancelButton.png"];
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(430, 280, 35, 35);
    [backbutton addTarget:self action:@selector(CancelButton:) forControlEvents:UIControlEventTouchDown];
    [backbutton setImage:backImage forState:UIControlStateNormal];
    [self.view addSubview:backbutton];
    
    UIImage * buttonImage2 = [UIImage imageNamed:@"doneButton.png"];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(490, 280,45, 35);
    [btn2 setImage:buttonImage2 forState:UIControlStateNormal];
    [btn2 addTarget:self
             action:@selector(saveButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
    ThemeColour=[[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumberHome"];
    ThemeColourGuest=[[NSUserDefaults standardUserDefaults]integerForKey:@"Theme2ThemeNumber"];
    
    CGRect themeTrailposition = CGRectMake( 353, 76, 100, 150);
    ThemeTrailsImageView = [[UIImageView alloc]initWithFrame:themeTrailposition];
    if (ThemeColour==1) {
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
        
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareYellow0.png"]];
        
        
    }
    else if (ThemeColour==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareGrey0.png"]];
    }
    else if (ThemeColour==3){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareRed0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
    }else if(ThemeColour==4){
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareBlue0.png"]];
    }    // [self.view addSubview:rightGuestImageView];
    ThemeTrailsImageView.userInteractionEnabled=YES;
    [self.view addSubview:ThemeTrailsImageView];
    
    
    
    CGRect themeTrailpositionguest = CGRectMake( 115, 76, 100, 150);
    ThemeTrailsImageviewGuest = [[UIImageView alloc]initWithFrame:themeTrailpositionguest];
    if (ThemeColourGuest==1) {
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
        
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareYellow0.png"]];
        
        
    }
    else if (ThemeColourGuest==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareGrey0.png"]];
    }
    else if (ThemeColourGuest==3){
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareRed0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
    }else if(ThemeColourGuest==4){
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareBlue0.png"]];
    }    // [self.view addSubview:rightGuestImageView];
    ThemeTrailsImageviewGuest.userInteractionEnabled=YES;
    [self.view addSubview:ThemeTrailsImageviewGuest];
    
    
    
    
    
    
    
    
    
    UISwipeGestureRecognizer *ThemeTrails = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ThemetrailsUpMethod)] autorelease];
	ThemeTrails.direction = UISwipeGestureRecognizerDirectionUp;
	[ThemeTrailsImageView addGestureRecognizer:ThemeTrails];
    
    UISwipeGestureRecognizer *ThemeTrailsGuest=[[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(ThemetrailsUpMethodGuest)]autorelease];
    
    ThemeTrailsGuest.direction = UISwipeGestureRecognizerDirectionUp;
	[ThemeTrailsImageviewGuest addGestureRecognizer:ThemeTrailsGuest];
    
    UITapGestureRecognizer *homeScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ThemetrailsUpMethod)];
    [homeScoreLabelTap setNumberOfTapsRequired:1];
    [homeScoreLabelTap setNumberOfTouchesRequired:1];
    [ThemeTrailsImageView addGestureRecognizer:homeScoreLabelTap];
    
    UITapGestureRecognizer *GuestScoreLabelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ThemetrailsUpMethodGuest)];
    [GuestScoreLabelTap setNumberOfTapsRequired:1];
    [GuestScoreLabelTap setNumberOfTouchesRequired:1];
    [ThemeTrailsImageviewGuest addGestureRecognizer:GuestScoreLabelTap];

}

-(void)ThemetrailsUpMethod{
    NSLog(@"its swiped up");
    
    if (ThemeColour==1) {
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
        
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareGrey0.png"]];
        
    }
    else if (ThemeColour==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareRed0.png"]];
    }
    else if (ThemeColour==3){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareBlue0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
    }else if(ThemeColour==4){
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareYellow0.png"]];
    }
    
    if (ThemeColour<4) {
        ThemeColour++;
    }
    else{
        ThemeColour=1;
    }
    
    
}

-(void)ThemetrailsUpMethodGuest{
    NSLog(@"its swiped up");
    
    if (ThemeColourGuest==1) {
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
        
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareGrey0.png"]];
        
    }
    else if (ThemeColourGuest==2){
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareRed0.png"]];
    }
    else if (ThemeColourGuest==3){
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareBlue0.png"]];
        //[ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        
    }else if(ThemeColourGuest==4){
        // [ThemeTrailsImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", ThemeColour]]];
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareYellow0.png"]];
    }
    
    if (ThemeColourGuest<4) {
        ThemeColourGuest++;
    }
    else{
        ThemeColourGuest=1;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)saveButtonClick:(id)sender
{
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:ThemeColour  forKey:@"Theme2ThemeNumberHome"];
    [prefs synchronize];
    [prefs setInteger:ThemeColourGuest  forKey:@"Theme2ThemeNumber"];
    [prefs synchronize];
    
	[UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
    //
	[self.navigationController popViewControllerAnimated:NO];
    
	
	
}

-(IBAction)CancelButton:(id)sender
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
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
