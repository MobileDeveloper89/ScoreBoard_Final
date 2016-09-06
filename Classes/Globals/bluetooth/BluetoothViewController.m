
#import "BluetoothViewController.h"
#import "VollyballMainViewController.h"
#import "Game.h"
#import "global.h"

@implementation BluetoothViewController
{
	
}

@synthesize joinDeviceView = _joinDeviceView;
@synthesize hostDeviceView = _hostDeviceView;
@synthesize DeviceImageView = _deviceImageView;
@synthesize pImageView = _pImageView;
@synthesize hostGameButton;
@synthesize joinGameButton;

@synthesize game;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
	{
		_performAnimations = YES;
	}
	return self;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];//Doesn't help

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
    
    [self.view setFrame:CGRectMake(0.0f, 0.0f, 480.0f, 320.0f)];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
	if (_performAnimations)
		[self prepareForIntroAnimation];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)prepareForIntroAnimation
{
	
	self.joinDeviceView.alpha = 0.0f;
	self.hostDeviceView.alpha = 0.0f;
	self.DeviceImageView.alpha = 0.0f;
    
	_buttonsEnabled = NO;
}



- (IBAction)exitAction:(id)sender
{
    [UIView beginAnimations:nil context:nil];
  	[UIView setAnimationDuration:0.5];
	[UIView setAnimationTransition:UIViewAnimationOptionCurveEaseIn forView:self.navigationController.view cache:YES];
	[UIView commitAnimations];
	[self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)hostGameAction:(id)sender
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    
    UIDevice  *thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        // iPad
        HostViewController *controller = [[HostViewController alloc] initWithNibName:@"HostViewController_iPad" bundle:nil];
        controller.delegate = self;
        [self presentViewController:controller animated:NO completion:nil];
    } else {
        // iPhone
        if (screenHeight == 480) {
            HostViewController *controller = [[HostViewController alloc] initWithNibName:@"HostViewController" bundle:nil];
            controller.delegate = self;
            [self presentViewController:controller animated:NO completion:nil];
        }else{
            HostViewController *controller = [[HostViewController alloc] initWithNibName:@"HostViewController_iPhone5" bundle:nil];
            controller.delegate = self;
            [self presentViewController:controller animated:NO completion:nil];
        }
    }
}

- (IBAction)joinGameAction:(id)sender
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    
    UIDevice  *thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        // iPad
        JoinViewController *controller = [[JoinViewController alloc] initWithNibName:@"JoinViewController_iPad" bundle:nil];
        controller.delegate = self;
        [self presentViewController:controller animated:NO completion:nil];
    } else {
        // iPhone
        if (screenHeight == 480) {
            JoinViewController *controller = [[JoinViewController alloc] initWithNibName:@"JoinViewController" bundle:nil];
            controller.delegate = self;
            [self presentViewController:controller animated:NO completion:nil];
        }else{
            JoinViewController *controller = [[JoinViewController alloc] initWithNibName:@"JoinViewController_iPhone5" bundle:nil];
            controller.delegate = self;
            [self presentViewController:controller animated:NO completion:nil];
        }
    }
}

- (IBAction) onDisconnet:(id)sender
{
    if (self.game.isServer)
	{
		_alertView = [[UIAlertView alloc]
                      initWithTitle:NSLocalizedString(@"End Scoreboard Service?", @"Alert title (user is host)")
                      message:NSLocalizedString(@"This will terminate the scoreboard Service for all other players.", @"Alert message (user is host)")
                      delegate:self
                      cancelButtonTitle:NSLocalizedString(@"No", @"Button: No")
                      otherButtonTitles:NSLocalizedString(@"Yes", @"Button: Yes"),
                      nil];
        
		[_alertView show];
	}
	else
	{
		_alertView = [[UIAlertView alloc]
                      initWithTitle: NSLocalizedString(@"Leave Scoreboard Service?", @"Alert title (user is not host)")
                      message:nil
                      delegate:self
                      cancelButtonTitle:NSLocalizedString(@"No", @"Button: No")
                      otherButtonTitles:NSLocalizedString(@"Yes", @"Button: Yes"),
                      nil];
        
		[_alertView show];
	}
    
}

- (void)showNoNetworkAlert
{
	UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"No Network", @"No network alert title")
                              message:NSLocalizedString(@"To use multiplayer, please enable Bluetooth or Wi-Fi in your device's Settings.", @"No network alert message")
                              delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"Button: OK")
                              otherButtonTitles:nil];
    
	[alertView show];
}

- (void)showDisconnectedAlert
{
	UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:NSLocalizedString(@"Disconnected", @"Client disconnected alert title")
                              message:NSLocalizedString(@"You were disconnected from the server.", @"Client disconnected alert message")
                              delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", @"Button: OK")
                              otherButtonTitles:nil];
    
	[alertView show];
}

- (void)startGameWithBlock:(void (^)(Game *))block
{
    UIDevice  *thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        Main_ipadViewController *gameViewController = [[Main_ipadViewController alloc]init];
        gameViewController.delegate = self;
        
        [self presentViewController:gameViewController animated:NO completion:^
         {
             Game *game = [[Game alloc] init];
             gameViewController.game = game;
             game.delegate = gameViewController;
             block(game);
         }];
    } else {
        
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        
        CGFloat screenHeight = screenSize.height;
        // iPhone
        if (screenHeight == 480.0f) {
            VollyballMainViewController_iphone *gameViewController = [[VollyballMainViewController_iphone alloc]init];
            gameViewController.delegate = self;
            
            [self presentViewController:gameViewController animated:NO completion:^
             {
                 Game *game = [[Game alloc] init];
                 gameViewController.game = game;
                 game.delegate = gameViewController;
                 block(game);
             }];
        } else {
            VollyballMainViewController *gameViewController = [[VollyballMainViewController alloc]init];
            gameViewController.delegate = self;
            
            [self presentViewController:gameViewController animated:NO completion:^
             {
                 Game *game = [[Game alloc] init];
                 gameViewController.game = game;
                 game.delegate = gameViewController;
                 block(game);
             }];
        }
    }
    
}

#pragma mark - HostViewControllerDelegate

- (void)hostViewControllerDidCancel:(HostViewController *)controller
{
	[self dismissViewControllerAnimated:NO completion:nil];
}

- (void)hostViewController:(HostViewController *)controller didEndSessionWithReason:(QuitReason)reason
{
	if (reason == QuitReasonNoNetwork)
	{
		[self showNoNetworkAlert];
	}
}

- (void)hostViewController:(HostViewController *)controller startGameWithSession:(GKSession *)session playerName:(NSString *)name clients:(NSArray *)clients
{
	_performAnimations = NO;
    
	[self dismissViewControllerAnimated:NO completion:^
     {
         _performAnimations = YES;
         
         [self startGameWithBlock:^(Game *game)
          {
              [game startServerGameWithSession:session playerName:name clients:clients];
          }];
     }];
}

#pragma mark - JoinViewControllerDelegate

- (void)joinViewControllerDidCancel:(JoinViewController *)controller
{
	[self dismissViewControllerAnimated:NO completion:nil];
}

- (void)joinViewController:(JoinViewController *)controller didDisconnectWithReason:(QuitReason)reason
{
	// The "No Wi-Fi/Bluetooth" alert does not close the Join screen,
	// but the "Connection Dropped" disconnect does.
    
	if (reason == QuitReasonNoNetwork)
	{
		[self showNoNetworkAlert];
	}
	else if (reason == QuitReasonConnectionDropped)
	{
		[self dismissViewControllerAnimated:NO completion:^
         {
             [self showDisconnectedAlert];
         }];
	}
}
//
- (void)joinViewController:(JoinViewController *)controller startGameWithSession:(GKSession *)session playerName:(NSString *)name server:(NSString *)peerID
{
	_performAnimations = NO;
    
	[self dismissViewControllerAnimated:NO completion:^
     {
         _performAnimations = YES;
         
         [self startGameWithBlock:^(Game *game)
          {
              [game startClientGameWithSession:session playerName:name server:peerID];
          }];
     }];
}

#pragma mark - GameViewControllerDelegate

- (void)gameViewController:(VollyballMainViewController *)controller didQuitWithReason:(QuitReason)reason
{
	[self dismissViewControllerAnimated:NO completion:^
     {
         isBluetooth = NO;
//         if (reason == QuitReasonConnectionDropped)
//         {
             [self showDisconnectedAlert];
//         }
     }];
}

- (void)game:(Game *)game didQuitWithReason:(QuitReason)reason
{
	[self.delegate gameViewController:self didQuitWithReason:reason];
}


//#pragma mark - UIAlertViewDelegate
//
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//	if (buttonIndex != alertView.cancelButtonIndex)
//	{
//		// Stop any pending performSelector:withObject:afterDelay: messages.
//		[NSObject cancelPreviousPerformRequestsWithTarget:self];
//        
//		[self.game quitGameWithReason:QuitReasonUserQuit];
//	}
//}

@end
