//
//  Theme3NocolorchooserViewController.m
//  Scoreboard
//
//  Created by venkat on 19/07/14.
//
//

#import "Theme3NocolorchooserViewController.h"

@interface Theme3NocolorchooserViewController ()

@end

@implementation Theme3NocolorchooserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIDevice  *thisDevice = [UIDevice currentDevice];
        if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
        {
            scoreboardWidthRate = 1024.0f / 480.0f;
            scoreboardHeightRate = 768.0f / 320.0f;
        } else {
            
            CGRect screenBound = [[UIScreen mainScreen] bounds];
            CGSize screenSize = screenBound.size;
            CGFloat screenHeight = screenSize.height;
            // iPhone
            if (screenHeight == 480.0f) {
                scoreboardWidthRate = 1.0f;
                scoreboardHeightRate = 1.0f;
            } else {
                scoreboardWidthRate = 568.0f / 480.0f;
                scoreboardHeightRate = 1.0f;
            }
        }
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *backImage=[UIImage imageNamed:@"bluetooth_cancel.png"];
    UIButton *backbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame=CGRectMake(430 * scoreboardWidthRate, 20 * scoreboardHeightRate, 32 * scoreboardWidthRate, 32 * scoreboardHeightRate);
    [backbutton addTarget:self action:@selector(saveButtonClick:) forControlEvents:UIControlEventTouchDown];
    [backbutton setImage:backImage forState:UIControlStateNormal];
    [self.view addSubview:backbutton];
    
    UIImage * syncbtn;
  //  if (isBluetooth) {
        syncbtn = [UIImage imageNamed:@"sync_cancel_button.png"];
//    } else {
//        syncbtn = [UIImage imageNamed:@"sync_button.png"];
//    }
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn3.frame = CGRectMake(275 * scoreboardWidthRate, 250 * scoreboardHeightRate, 151 * scoreboardWidthRate, 27 * scoreboardHeightRate);
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

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
