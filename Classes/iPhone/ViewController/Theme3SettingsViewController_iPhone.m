//
//  Theme3SettingsViewController_iPhone.m
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/10/12.
//
//

#import "Theme3SettingsViewController_iPhone.h"
#import "BluetoothViewController.h"
#import "ColorPickerView.h"
#import "UIColor-HSVAdditions.h"
#import "Main_ipadViewController.h"
#import "global.h"

@interface Theme3SettingsViewController_iPhone ()

//@property (nonatomic) IBOutlet InfColorBarView* barView;
//@property (nonatomic) IBOutlet InfColorBarPicker* barPicker;
@end

@implementation Theme3SettingsViewController_iPhone
static BOOL secSelected=0,minSelected=0;

@synthesize delegateSetting;
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
@synthesize defaultsKey;
@synthesize guestKey;
#else
@synthesize HomeColor;
@synthesize GuestColor;

#endif

NSString *keyForHue = @"hue";
NSString *keyForSat = @"sat";
NSString *keyForBright = @"bright";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
//        int avalue=[[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"];
//        
//        if (avalue!=5) {
        
            
        

        isHomeSelect = NO;
        isGuestSelect = NO;
        
        UIDevice  *thisDevice = [UIDevice currentDevice];
        if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
        {
            scoreboardWidthRate = 1024.0f / 480.0f;
            scoreboardHeightRate = 768.0f / 320.0f;
        } else {
            
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenHeight = screenSize.width;
            // iPhone
            if (screenHeight == 480.0f) {
                scoreboardWidthRate = 1.0f;
                scoreboardHeightRate = 1.0f;
            } else {
                scoreboardWidthRate = 568.0f / 480.0f;
                scoreboardHeightRate = 1.0f;
            }
        }
       // }
    }
    return self;
}

#pragma mark Fullscreen








- (void)viewDidLoad
{
    [super viewDidLoad];


//    UIImage *backImage=[UIImage imageNamed:@"bluetooth_cancel.png"];
    UIImage *backImageNor=[UIImage imageNamed:@"setting_close_nor.png"];
    UIImage *backImageTou=[UIImage imageNamed:@"setting_close_tou.png"];
    
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    if (iOSDeviceDetect == 1)
    {
        backbutton.frame=CGRectMake(440 * scoreboardWidthRate, 12 * scoreboardHeightRate, 64, 64);
    } else {
        backbutton.frame=CGRectMake(440 * scoreboardWidthRate, 12 * scoreboardHeightRate, 32, 32);
    }
    [backbutton addTarget:self action:@selector(saveButtonClick:) forControlEvents:UIControlEventTouchDown];
//    [backbutton addTarget:self action:@selector(saveButtonClick:) forControlEvents: UIControlEventTouchUpInside];
    [backbutton setImage:backImageNor forState:UIControlStateNormal];
    [backbutton setImage:backImageTou forState:UIControlStateSelected];
    
    [self.view addSubview:backbutton];

    UIImage *backHomeImageNor=[UIImage imageNamed:@"setting_home_nor.png"];
    UIImage *backHomeImageTou=[UIImage imageNamed:@"setting_home_tou.png"];
    
    UIButton *backHomebutton=[UIButton buttonWithType:UIButtonTypeCustom];
    if (iOSDeviceDetect == 1)
    {
        backHomebutton.frame=CGRectMake(437 * scoreboardWidthRate, 280 * scoreboardHeightRate, 76, 68);
    } else {
        backHomebutton.frame=CGRectMake(437 * scoreboardWidthRate, 280 * scoreboardHeightRate, 38, 34);
    }
    [backHomebutton addTarget:self action:@selector(saveHomeButtonClick:) forControlEvents:UIControlEventTouchDown];
    //    [backbutton addTarget:self action:@selector(saveButtonClick:) forControlEvents: UIControlEventTouchUpInside];
    [backHomebutton setImage:backHomeImageNor forState:UIControlStateNormal];
    [backHomebutton setImage:backHomeImageTou forState:UIControlStateSelected];
    
    [self.view addSubview:backHomebutton];

    
    UIImage * syncbtn;
    if (isBluetooth) {
        syncbtn = [UIImage imageNamed:@"sync_cancel_button.png"];
    } else {
        syncbtn = [UIImage imageNamed:@"sync_button.png"];
    }
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    ///btn3.frame = CGRectMake(275 * scoreboardWidthRate, 250 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
    [btn3 setImage:syncbtn forState:UIControlStateNormal];
    [btn3 addTarget:self
             action:@selector(startBluetooth:)
   forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn3];

    UIImage * fbbtn = [UIImage imageNamed:@"fb_button.png"];
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn4.frame = CGRectMake(275 * scoreboardWidthRate, 139 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
    [btn4 setImage:fbbtn forState:UIControlStateNormal];
    [btn4 addTarget:self
             action:@selector(fbButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn4];
    
    UIImage * twbtn = [UIImage imageNamed:@"tw_button.png"];
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn5.frame = CGRectMake(275 * scoreboardWidthRate, 176 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
    [btn5 setImage:twbtn forState:UIControlStateNormal];
    [btn5 addTarget:self
             action:@selector(twButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn5];

//    UIImage * rsbtn = [UIImage imageNamed:@"rs_button.png"];
    UIImage * rsbtn = [UIImage imageNamed:@"score_only.png"];
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(224 * scoreboardWidthRate, 200 * scoreboardHeightRate, 37 * scoreboardWidthRate, 37 * scoreboardWidthRate);
    [btn6 setImage:rsbtn forState:UIControlStateNormal];
    [btn6 addTarget:self
             action:@selector(ScoreResetButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn6];
    
//    UIImage * rabtn = [UIImage imageNamed:@"ra_button.png"];
    UIImage * rabtn = [UIImage imageNamed:@"clear_all.png"];
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn7.frame = CGRectMake(206 * scoreboardWidthRate, 102 * scoreboardHeightRate, 70 * scoreboardWidthRate, 70 * scoreboardWidthRate);
    [btn7 setImage:rabtn forState:UIControlStateNormal];
    [btn7 addTarget:self
             action:@selector(AllResetButtonClick:)
   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn7];
    
    
    int avalueforsettingtimer = [[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"];
    
    if (avalueforsettingtimer == 3 || avalueforsettingtimer == 2) {
//        UIImage * resetImage = [UIImage imageNamed:@"Vball-reset.png"];
        UIImage * resetImage = [UIImage imageNamed:@"setting_timer.png"];
        UIButton *timeSetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        timeSetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        timeSetButton.frame = CGRectMake(320 * scoreboardWidthRate, 90 * scoreboardHeightRate, 126 * scoreboardWidthRate, 44 * scoreboardHeightRate);
        [timeSetButton addTarget:self action:@selector(DigitalsettingsButtonClick)
                forControlEvents:UIControlEventTouchUpInside];
        [timeSetButton setImage:resetImage forState:UIControlStateNormal];
       // [timeSetButton setUserInteractionEnabled:NO];
        // [scrollView addSubview:resetButton];
        
        [self.view addSubview: timeSetButton];
        NSString *mmString, *ssString;
        int mm = [[NSUserDefaults standardUserDefaults] integerForKey:@"minutes"];
        int ss = [[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];

        if (mm > 9)
            mmString = [NSString stringWithFormat:@"%d", mm];
        else
            mmString = [NSString stringWithFormat:@"0%d", mm];
        
        if (ss > 9)
            ssString = [NSString stringWithFormat:@"%d", ss];
        else
            ssString = [NSString stringWithFormat:@"0%d", ss];
        
        timeLabel = [[UILabel alloc] initWithFrame: CGRectMake(320 * scoreboardWidthRate, 88 * scoreboardHeightRate, 126 * scoreboardWidthRate, 44 * scoreboardHeightRate)];
        timeLabel.text = [NSString stringWithFormat:@"%@:%@", mmString, ssString];
        timeLabel.textAlignment = UITextAlignmentCenter;
        timeLabel.font = [UIFont fontWithName:@"HURTMOLD" size: 40];
        timeLabel.textColor = [UIColor colorWithRed: 1.0 green:0.6588 blue:0.0 alpha:1.0];
        
        [self.view addSubview: timeLabel];
        
        
    }
    
    int avalue = [[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"];
    if (avalue == 5) {
        if (iOSDeviceDetect == 1)
        {
            backbutton.frame=CGRectMake(440 * scoreboardWidthRate, 12 * scoreboardHeightRate, 64, 64);
        } else {
            backbutton.frame=CGRectMake(440 * scoreboardWidthRate, 12 * scoreboardHeightRate, 32, 32);
        }
        
//        btn3.frame = CGRectMake(self.view.frame.size.width/2-151 * scoreboardWidthRate/2, 250 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
//        
//        btn4.frame = CGRectMake(self.view.frame.size.width/2-151 * scoreboardWidthRate/2, 139 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
//        
//        btn5.frame = CGRectMake(self.view.frame.size.width/2-151 * scoreboardWidthRate/2, 176 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
        
//        btn6.frame = CGRectMake(self.view.frame.size.width/2-151 * scoreboardWidthRate/2, 55 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
//        btn7.frame = CGRectMake(self.view.frame.size.width/2-151 * scoreboardWidthRate/2, 92 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);

    }
    if (avalue != 5) {

    
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
	NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
	if (defaultsKey==nil) {
        self.defaultsKey = @"";
        NSLog(@"problem 0 in Theme3SettingsViewController.viewDidLoad");
    }
    
        NSData *colorData= [saveColors objectForKey:defaultsKey];
    UIColor *color;
    if (colorData!=nil) {
        color = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
    
    if (guestKey==nil) {
        self.guestKey = @"";
        NSLog(@"problem 0 in Theme3SettingsViewController.viewDidLoad");
    }
    
    NSData *colorData1= [saveColors objectForKey:guestKey];
    UIColor *color1;
    if (colorData1!=nil) {
        color1 = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData1];
    }
#endif
    
    [self moveToDefault];
    }// Move the crosshair to the default setting
}

-(void) moveToDefault {
    ColorPickerView *theView = (ColorPickerView*) [self view];
    ColorPickerView *theView1 = (ColorPickerView*) [self view];
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    NSUserDefaults *saveColors = [NSUserDefaults standardUserDefaults];
    NSData *colorData= [saveColors objectForKey:defaultsKey];
    UIColor *color;
    if (colorData!=nil) {
        color = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
    [theView setColor:color];
/*********/
    NSData *colorData1= [saveColors objectForKey:guestKey];
    UIColor *color1;
    if (colorData1!=nil) {
        color1 = (UIColor*)[NSKeyedUnarchiver unarchiveObjectWithData:colorData1];
    }
    [theView1 setColor1:color1];
///////////////
#else
    [theView setColor:HomeColor];
    [theView1 setColor:GuestColor];
#endif
}

-(void)DigitalsettingsButtonClick{
    timechooserview = [[UIView alloc]init];
    timechooserview.frame = self.view.frame;
    [self.view addSubview:timechooserview];
    
//    UIView *bg = [[UIView alloc]init];
//    bg.frame = self.view.frame;
//    [bg setBac]
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 568, 320)];
    [bg setImage: [UIImage imageNamed:@"black_opacity.png"]];
    [timechooserview addSubview:bg];
//    [bg setAlpha:0.8];
    
//    [bg setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *timerPanel = [[UIImageView alloc] initWithFrame:CGRectMake(375, 130, 160, 130)];
    timerPanel.image=[UIImage imageNamed:@"setting_time_panel.png"];
    [bg addSubview:timerPanel];

    minutesArray = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",nil];
	secondsArray = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",nil];
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
    [timePicker setBackgroundColor:[UIColor whiteColor]];
    
    // Set the picker's frame. We set the y coordinate to 50px.
    //[timePicker setFrame: CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];
    //[timePicker setFrame: CGRectMake(33, 40, 200, 150)];
    [timePicker setFrame: CGRectMake(370, 145, 170, 110)];
//    timePicker.center = bg.center;
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    timePicker.showsSelectionIndicator = YES;
    timePicker.transform = CGAffineTransformMakeScale(0.91, 0.965);
    // Allow us to pre-select the third option in the pickerView.
    int mm = [[NSUserDefaults standardUserDefaults] integerForKey:@"minutes"];
    int ss = [[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    
    [timePicker selectRow:mm inComponent:ss animated:NO];

//    [timePicker selectRow:0 inComponent:0 animated:YES];
    // OK, we are ready. Add the picker in our view.
    
//    [(UIView*)[[timePicker subviews] objectAtIndex:0] setAlpha: 0.0f];// 0.0f for transparent
//    [(UIView*)[[timePicker subviews] objectAtIndex:1] setAlpha: 0.0f];
//    [(UIView*)[[timePicker subviews] objectAtIndex:2] setAlpha: 0.0f];
    
    [timechooserview addSubview: timePicker];
    
    CGRect labelFrameSet = CGRectMake( self.view.frame.size.width/2-50, 28, 100, 40 );
    setTimerLable = [[UILabel alloc] initWithFrame: labelFrameSet];
    [setTimerLable setText: @"Timer"];
    setTimerLable.backgroundColor=[UIColor clearColor];
    [setTimerLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [setTimerLable setTextColor: [UIColor whiteColor]];
//   [timechooserview addSubview: setTimerLable];
    [setTimerLable setTextAlignment:NSTextAlignmentCenter];
    
    
    CGRect labelFrameMin = CGRectMake( 133+100, 28, 45, 40 );
    //CGRect labelFrameMin = CGRectMake( 145, 18, 35, 21 );
    minutesLable = [[UILabel alloc] initWithFrame: labelFrameMin];
    [minutesLable setText: [NSString stringWithFormat:@"%d", mm]];
    minutesLable.backgroundColor=[UIColor clearColor];
    [minutesLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [minutesLable setTextColor: [UIColor whiteColor]];
 //   [timechooserview addSubview: minutesLable];
    
    CGRect labelFrameA = CGRectMake( 167+100, 32, 5, 30 );
    //CGRect labelFrameA = CGRectMake( 179, 18, 10, 21 );
    UILabel *aLable = [[UILabel alloc] initWithFrame: labelFrameA];
    [aLable setText: @":"];
    aLable.backgroundColor=[UIColor clearColor];
    [aLable setTextColor: [UIColor whiteColor]];
   // [timechooserview addSubview: aLable];
    
    
    CGRect labelFrameSec = CGRectMake( 172+100, 28, 60, 40 );
    // CGRect labelFrameSec = CGRectMake( 190, 18, 35, 21 );
    secondsLable = [[UILabel alloc] initWithFrame: labelFrameSec];
    [secondsLable setText: [NSString stringWithFormat:@"%d", ss]];
    secondsLable.backgroundColor=[UIColor clearColor];
    [secondsLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [secondsLable setTextColor: [UIColor whiteColor]];
   // [timechooserview addSubview: secondsLable];
    UIImage *backImage=[UIImage imageNamed:@"bluetooth_cancel.png"];
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(440 * scoreboardWidthRate, 12 * scoreboardHeightRate, 32, 32);
    [backbutton addTarget:self action:@selector(savetimeButtonClick:) forControlEvents:UIControlEventTouchDown];
    [backbutton setImage:backImage forState:UIControlStateNormal];
    [timechooserview addSubview:backbutton];
}

-(IBAction)savetimeButtonClick:(id)sender
{
    [timechooserview removeFromSuperview];
    
    int avalueforsettingtimer=[[NSUserDefaults standardUserDefaults]integerForKey:@"Scorebaordnumber"];
    
    NSLog(@"===%d, %d===", [minutesLable.text intValue], [secondsLable.text intValue]);
    
    if (avalueforsettingtimer==3) {
        [[NSUserDefaults standardUserDefaults] setInteger:[minutesLable.text intValue] forKey:@"minutesTheme1"];
        [[NSUserDefaults standardUserDefaults] setInteger:[secondsLable.text intValue] forKey:@"secondsTheme1"];
    }
    
    
    if (avalueforsettingtimer==2) {
        [[NSUserDefaults standardUserDefaults] setInteger:[minutesLable.text intValue] forKey:@"minutes"];
        [[NSUserDefaults standardUserDefaults] setInteger:[secondsLable.text intValue] forKey:@"seconds"];
        
        NSString *mmString, *ssString;
        int mm = [[NSUserDefaults standardUserDefaults] integerForKey:@"minutes"];
        int ss = [[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];

        if (mm > 9)
            mmString = [NSString stringWithFormat:@"%d", mm];
        else
            mmString = [NSString stringWithFormat:@"0%d", mm];
        
        if (ss > 9)
            ssString = [NSString stringWithFormat:@"%d", ss];
        else
            ssString = [NSString stringWithFormat:@"0%d", ss];
        
        timeLabel.text = [NSString stringWithFormat:@"%@:%@", mmString, ssString];
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
	if (component == 0) {
		minSelected = 1;
		NSString *rowTitle = [minutesArray objectAtIndex:row];
		rowTitle = [rowTitle stringByAppendingString:@" Min"];
		return rowTitle;
	}
	else {
		NSString *rowTitle = [secondsArray objectAtIndex:row];
		rowTitle = [rowTitle stringByAppendingString:@" Sec"];
		return rowTitle;
	}
	return @"";
}

- ( void ) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if (component == 0) {
		minSelected = 1;
		NSMutableString *minutesString=[[NSMutableString alloc] initWithString:[minutesArray objectAtIndex:row]];
		minutesLable.text = minutesString;
		[minutesString release];
	}
	else {
		secSelected = 1;
		secondsLable.text = [secondsArray objectAtIndex:row];
	}
}

- ( void ) ThemetrailsUpMethod{
    NSLog(@"its swiped up");
    
    if (ThemeColour==1) {
        
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareGrey0.png"]];
        
    }
    else if (ThemeColour==2){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareRed0.png"]];
    }
    else if (ThemeColour==3){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareBlue0.png"]];
        
    }else if(ThemeColour==4){
        [ThemeTrailsImageView setImage:[UIImage imageNamed:@"squareYellow0.png"]];
    }
    
    if (ThemeColour < 4) {
        ThemeColour++;
    }
    else{
        ThemeColour = 1;
    }
}

- ( void ) ThemetrailsUpMethodGuest{
    NSLog(@"its swiped up");
    
    if (ThemeColourGuest==1) {
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareGrey0.png"]];
    }
    else if (ThemeColourGuest==2){
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareRed0.png"]];
    }
    else if (ThemeColourGuest==3){
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareBlue0.png"]];
    }else if(ThemeColourGuest==4){
        [ThemeTrailsImageviewGuest setImage:[UIImage imageNamed:@"squareYellow0.png"]];
    }
    
    if (ThemeColourGuest<4) {
        ThemeColourGuest++;
    }
    else{
        ThemeColourGuest=1;
    }
}

- ( void ) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) saveButtonClick:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:ThemeColour  forKey:@"Theme3ThemeNumberHome"];
    [prefs synchronize];
    [prefs setInteger:ThemeColourGuest  forKey:@"Theme3ThemeNumber"];
    [prefs synchronize];

    if (isHomeSelect) {
        [delegateSetting HomeColorViewController:self didSelectColor:[self getSelectedColor]];
    }
    
    if (isGuestSelect) {
        [delegateSetting GuestColorViewController:self didSelectColor:[self getSelectedColor1]];
    }
    
    [delegateSetting setTimer];
    
    float height = [[UIScreen mainScreen] bounds].size.width;
    float width = [[UIScreen mainScreen] bounds].size.height;
    
    [self.view setFrame:CGRectMake(0, 0, width, height)];
    [UIView beginAnimations:nil context:NULL];
    [self.view setFrame:CGRectMake(0, height, width, height)];
    [UIView commitAnimations];

    [self release];
    
}

- (IBAction) saveHomeButtonClick:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:ThemeColour  forKey:@"Theme3ThemeNumberHome"];
    [prefs synchronize];
    [prefs setInteger:ThemeColourGuest  forKey:@"Theme3ThemeNumber"];
    [prefs synchronize];
    
    if (isHomeSelect) {
        [delegateSetting HomeColorViewController:self didSelectColor:[self getSelectedColor]];
    }
    
    if (isGuestSelect) {
        [delegateSetting GuestColorViewController:self didSelectColor:[self getSelectedColor1]];
    }
    
    [delegateSetting setTimer];
    
    float height = [[UIScreen mainScreen] bounds].size.width;
    float width = [[UIScreen mainScreen] bounds].size.height;
    
    [self.view setFrame:CGRectMake(0, 0, width, height)];
    
//    [UIView beginAnimations:nil context:NULL];
//    [self.view setFrame:CGRectMake(0, height, width, height)];
//    [UIView commitAnimations];
    
    [UIView animateWithDuration:0.1
         animations:^{
             [self.view setFrame:CGRectMake(0, height, width, height)];
         }
         completion:^(BOOL finished){
             [delegateSetting onBackMainScreen];
     }];
    
    [self release];
}

- (IBAction) ScoreResetButtonClick:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Are you sure to reset score?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert setTag: 901];

    [alert show];
    [alert release];
}

-(IBAction)AllResetButtonClick:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WARNING" message:@"Are you sure to reset all?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert setTag: 903];

    [alert show];
    [alert release];
}

- (void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 901) {

        if (buttonIndex == 0) {

            [delegateSetting ScoreReset];
            [self saveButtonClick:nil];
        }
    }
    else if (alertView.tag == 903)
    {
        if (buttonIndex == 0) {
            NSLog(@"reset all");
            [delegateSetting AllReset];
            
            [self saveButtonClick:nil];

        } else
        {
            NSLog(@"No");
        }
    }
}

-(IBAction)fbButtonClick:(id)sender
{
    [delegateSetting FaceBookShare];
}

-(IBAction)twButtonClick:(id)sender
{
    [delegateSetting TwitterShare];
}

-(IBAction)startBluetooth:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];

    [delegateSetting startBluetooth];
}

- (UIColor *) getSelectedColor {
	return [(ColorPickerView *) [self view] getColorShown];
}

- (UIColor *) getSelectedColor1 {
	return [(ColorPickerView *) [self view] getColorShown1];
}

- (IBAction) SelectedHomeColor
{
//    [delegateSetting HomeColorViewController:self didSelectColor:[self getSelectedColor]];
}

- (IBAction) SelectedGestColor
{
//    [delegateSetting GuestColorViewController:self didSelectColor:[self getSelectedColor1]];
}

- (IBAction) CancelButton:(id)sender
{
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
    //Revmob reset
    //
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	[self.navigationController popViewControllerAnimated:NO];

	
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
