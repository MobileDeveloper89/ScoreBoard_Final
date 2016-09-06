
#import "HostViewController.h"
#import "JoinViewController.h"
#import "VollyballMainViewController.h"
#import "Main_ipadViewController.h"
#import "VollyballMainViewController_iphone.h"

#import "Game.h"
@class BluetoothViewController;

@protocol GameViewControllerDelegate <NSObject>

- (void)gameViewController:(BluetoothViewController *)controller didQuitWithReason:(QuitReason)reason;

@end

@interface BluetoothViewController : UIViewController <HostViewControllerDelegate, JoinViewControllerDelegate, VollyballMainViewControllerDelegate, UIAlertViewDelegate, GameDelegate>
{
    BOOL _buttonsEnabled;
	BOOL _performAnimations;
    
    UIAlertView *_alertView;
    
    float scoreboardWidthRate;
    float scoreboardHeightRate;
    
}
@property (nonatomic, retain) id <GameViewControllerDelegate> delegate;

@property (nonatomic, retain) IBOutlet UIButton *hostGameButton;
@property (nonatomic, retain) IBOutlet UIButton *joinGameButton;

@property (nonatomic, retain) IBOutlet UIImageView *pImageView;
@property (nonatomic, retain) IBOutlet UIImageView *joinDeviceView;
@property (nonatomic, retain) IBOutlet UIImageView *hostDeviceView;
@property (nonatomic, retain) IBOutlet UIImageView *DeviceImageView;
@property (nonatomic, retain) IBOutlet UIButton *ExitButton;

@property (nonatomic, strong) Game * game;

- (IBAction)hostGameAction:(id)sender;
- (IBAction)joinGameAction:(id)sender;

- (IBAction) onDisconnet:(id)sender;

@end
