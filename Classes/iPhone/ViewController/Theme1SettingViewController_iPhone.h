//
//  Theme1SettingViewController_iPhone.h
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/10/12.
//
//

#import <UIKit/UIKit.h>


#import "VollyballMainViewController.h"

@interface Theme1SettingViewController_iPhone : UIViewController
{
    UIImageView *ThemeTrailsImageView;
    int ThemeColour;
    UIPickerView *timePicker;
    
	NSMutableArray *minutesArray;
	NSMutableArray *secondsArray;
    UILabel *minutesLable;
	UILabel *secondsLable;
    UILabel *setTimerLable;
    UILabel *aLable;

    
}


@property (nonatomic, retain) VollyballMainViewController *m_pVolleyViewController;


- (IBAction)showFs:(id)sender;
- (IBAction)loadFs:(id)sender;


@end
