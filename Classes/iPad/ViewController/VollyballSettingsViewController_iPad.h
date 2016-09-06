//
//  VollyballSettingsViewController.h
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Facebook.h"

#import "FBLoginDialog.h"

#import "FBDialog.h"





@interface VollyballSettingsViewController_iPad : UIViewController<FBDialogDelegate,FBSessionDelegate,UIPickerViewDelegate,UIPickerViewDataSource> {
    
    UIImage *img;
    
    UIPickerView *timePicker;
    UIImageView *mainImageView;
    UIImageView *guestImageView;
    
	NSMutableArray *minutesArray;
	NSMutableArray *secondsArray;
	UILabel *minutesLable;
	UILabel *secondsLable;
    UILabel *setTimerLable;
	UISegmentedControl *homeUserSegmentedControll;
	UISegmentedControl *guestUserSegmentedControll;
	NSString *homeTitle;
	NSString *guestTitle;
    UIButton *btn;
    UIButton *btn1;
    UIButton *btn2;
    
    int GuestColorNumber;
    int HomeColorNumber;
    
	
	int homeScore;
	int guestScore;
    UILabel *GuestColourChooseLabel;
    
    UILabel *HomeColourChooseLabel;
	
	
}

@property(nonatomic,assign)int homeScore;
@property(nonatomic,assign)int guestScore;
@property(nonatomic,retain)NSString *homeTitle;
@property(nonatomic,retain)NSString *guestTitle;
@property(nonatomic,retain)IBOutlet UIButton *hBlue;
@property(nonatomic,retain)IBOutlet UIButton *hGreen;
@property(nonatomic,retain)IBOutlet UIButton *hOrange;
@property(nonatomic,retain)IBOutlet UIButton *hPink;
@property(nonatomic,retain)IBOutlet UIButton *hSky;
@property(nonatomic,retain)IBOutlet UIButton *hRed;
@property(nonatomic,retain)IBOutlet UIButton *hYellow;
@property(nonatomic,retain)IBOutlet UIButton *hPurple;
@property(nonatomic,retain)IBOutlet UIButton *gBlue;
@property(nonatomic,retain)IBOutlet UIButton *gGreen;
@property(nonatomic,retain)IBOutlet UIButton *gOrange;
@property(nonatomic,retain)IBOutlet UIButton *gPink;
@property(nonatomic,retain)IBOutlet UIButton *gSky;
@property(nonatomic,retain)IBOutlet UIButton *gRed;
@property(nonatomic,retain)IBOutlet UIButton *gYellow;
@property(nonatomic,retain)IBOutlet UIButton *gPurple;
@property(nonatomic,retain)IBOutlet UIButton *hBlack;
@property(nonatomic,retain)IBOutlet UIButton *gBlack;
@property(nonatomic,retain)IBOutlet UIButton *hGray;
@property(nonatomic,retain)IBOutlet UIButton *gGray;
@property(nonatomic,retain) UILabel *setTimerLable;
@property(nonatomic,retain) UILabel *minutesLable;
@property(nonatomic,retain) UILabel *secondsLable;
@property(nonatomic,retain)NSMutableArray *minutesArray;
@property(nonatomic,retain)NSMutableArray *secondsArray;
@property(nonatomic,retain) UIPickerView *timePicker;
@property(nonatomic,retain)IBOutlet UILabel *aLable;




-(IBAction)ColorSelection:(id)sender;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil hometitle:(NSString *)home guesttitle:(NSString *)guest; 
-(IBAction)saveButtonClick:(id)sender;

-(IBAction)facebookButtonClick;
-(IBAction)tutorialButtonClick:(id)sender;
@end
