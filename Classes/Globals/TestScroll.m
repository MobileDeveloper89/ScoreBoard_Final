//
//  TestScroll.m
//  Scoreboard
//
//  Created by SmartPhoneTech on 10/25/12.
//
//

#import "TestScroll.h"

@interface TestScroll ()

@end

@implementation TestScroll

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    BackGroundScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,3136,768)];
    BackGroundScroll.contentSize = CGSizeMake(3136,768);
    BackGroundScroll.backgroundColor=[UIColor clearColor];
    BackGroundScroll.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:BackGroundScroll];
 //   [BackGroundScroll setCenter:CGPointMake(500, BackGroundScroll.center.y)];


    VolleyBallScoreBoard=[[UIView alloc] initWithFrame: CGRectMake(162, 184,700,500)];
    VolleyBallScoreBoard.backgroundColor=[UIColor redColor];
    [BackGroundScroll addSubview:VolleyBallScoreBoard];
    
    
    DigitalScoreboard=[[UIView alloc] initWithFrame: CGRectMake(920, 184,700,500)];
    DigitalScoreboard.backgroundColor=[UIColor orangeColor];
    [BackGroundScroll addSubview:DigitalScoreboard];
    
    DigitalScoreboardNewtheme1=[[UIView alloc] initWithFrame: CGRectMake(1678, 184,700,500)];
    DigitalScoreboardNewtheme1.backgroundColor=[UIColor blueColor];
    [BackGroundScroll addSubview:DigitalScoreboardNewtheme1];
    
    DigitalScoreBordNewTheme2=[[UIView alloc] initWithFrame: CGRectMake(2436, 184,700,500)];
    DigitalScoreBordNewTheme2.backgroundColor=[UIColor yellowColor];
    [BackGroundScroll addSubview:DigitalScoreBordNewTheme2];

	// Do any additional setup after loading the view.
    
    
    
    UISwipeGestureRecognizer *leftSwipeUp = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewLeft)] autorelease];
	leftSwipeUp.direction = UISwipeGestureRecognizerDirectionLeft;
	[BackGroundScroll addGestureRecognizer:leftSwipeUp];
	
	//scroll view swipe recognizers
	UISwipeGestureRecognizer *rightSwipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveScrollViewRight)] autorelease];
	rightSwipeDown.direction = UISwipeGestureRecognizerDirectionRight;
	[BackGroundScroll addGestureRecognizer:rightSwipeDown];

}
-(void)moveScrollViewLeft{
    NSLog(@"Scrolled from Right to Left");
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];

    if (BackGroundScroll.center.x>-500) {

    [BackGroundScroll setCenter:CGPointMake(BackGroundScroll.center.x-750, BackGroundScroll.center.y)];

    }
    NSLog(@"TheScroll View Center is when scroll Left %f",BackGroundScroll.center.x);

    [UIView commitAnimations];
}
-(void)moveScrollViewRight{
    NSLog(@"Scrolled from left to right");
   
    
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
      if (BackGroundScroll.center.x<1042) {
     [BackGroundScroll setCenter:CGPointMake(BackGroundScroll.center.x+750, BackGroundScroll.center.y)];
      }
    [UIView commitAnimations];
    NSLog(@"TheScroll View Center is when scroll right %f",BackGroundScroll.center.x);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
