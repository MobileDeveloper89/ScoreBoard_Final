//
//  Theme2SettingsViewController_iPhone.h
//  Scoreboard
//
//  Created by SmartPhoneTech on 11/10/12.
//
//

#import <UIKit/UIKit.h>



@class Theme3SettingsViewController_iPhone;

@protocol VollyballMainSettingDelegate <NSObject>

- (void) ScoreReset;
- (void) AllReset;
- (void) FaceBookShare;
- (void) TwitterShare;
- (void) HomeColorViewController:(Theme3SettingsViewController_iPhone *)colorPicker didSelectColor:(UIColor *)color;
- (void) GuestColorViewController:(Theme3SettingsViewController_iPhone *)colorPicker didSelectColor:(UIColor *)color;
- (void) setTimer;
- (void) startBluetooth;
- (void) onBackMainScreen;

@end


@interface Theme3SettingsViewController_iPhone : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource, UIWebViewDelegate> {
    id<VollyballMainSettingDelegate> delegateSetting;
    int ThemeColour;
    int ThemeColourGuest;
    UIPickerView *timePicker;
    UIView *timechooserview;
    UILabel *timeLabel;
    
	NSMutableArray *minutesArray;
	NSMutableArray *secondsArray;
	UILabel *minutesLable;
	UILabel *secondsLable;
    UILabel *setTimerLable;
    UIImageView *ThemeTrailsImageView;
    UIImageView *ThemeTrailsImageviewGuest;
    
#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
    NSString *defaultsKey;
    NSString *guestKey;
#else
    UIColor *HomeColor;
    UIColor *GuestColor;
#endif
    
    float scoreboardWidthRate;
    float scoreboardHeightRate;
}

- (void) moveToDefault;
- (IBAction) SelectedHomeColor;
- (IBAction) SelectedGestColor;



@property (nonatomic, retain) id <VollyballMainSettingDelegate> delegateSetting;

#ifdef IPHONE_COLOR_PICKER_SAVE_DEFAULT
@property(readwrite,nonatomic,retain) NSString *defaultsKey;
@property(readwrite,nonatomic,retain) NSString *guestKey;
#else
@property(readwrite,nonatomic,retain) UIColor *HomeColor;
@property(readwrite,nonatomic,retain) UIColor *GuestColor;
#endif

@end

