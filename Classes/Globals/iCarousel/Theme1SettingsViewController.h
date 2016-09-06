//
//  Theme1SettingsViewController.h
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/1/12.
//
//

#import <UIKit/UIKit.h>



@interface Theme1SettingsViewController : UIViewController{
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



@end
