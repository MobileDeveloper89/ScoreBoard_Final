//
//  ScoreboardAppDelegate.m
//  Scoreboard
//
//  Created by Kata on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScoreboardAppDelegate.h"
#import <AudioToolbox/AudioServices.h>
#import "SptcsViewController.h"
#import "SptcsViewController_iPad.h"
#import "VolleyBallViewControllerBigger.h"
#import "LargeSPTCSViewController.h"

#import "VollyballMainViewController.h"
#import "Main_ipadViewController.h"
#import "VollyballMainViewController_iphone.h"

#import "ScoreboardMainScreenI5ViewController.h"

#import "global.h"

@implementation ScoreboardAppDelegate

@synthesize window,faceBook;
@synthesize viewController = _viewController, navController;
@synthesize scoreboardIndex;
@synthesize score_home;
@synthesize score_guest;

#pragma mark -
#pragma mark Application lifecycle
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.

    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    
//    
     UIDevice  *thisDevice = [UIDevice currentDevice];
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
   {
//       Main_ipadViewController *main=[[Main_ipadViewController alloc]init];
//       navController = [[UINavigationController alloc] initWithRootViewController:main];
//       self.window.rootViewController = self.navController;
//       [navController setNavigationBarHidden:YES];
       
       self.viewController = [[VollyballMainViewController alloc] initWithNibName:@"ScoreboardMainScreen_ipad" bundle:nil];
       navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
       self.window.rootViewController = self.navController;
       [navController setNavigationBarHidden:YES];

       iOSDeviceDetect = 1;
    }
   else
   {
       CGRect screenBound = [[UIScreen mainScreen] bounds];
       CGSize screenSize = screenBound.size;
        CGFloat screenWidth = screenSize.width;
        CGFloat screenHeight = screenSize.height;
       
       NSLog(@"%f:%f",screenWidth,screenHeight);
       
         // iPhone
      if (screenWidth == 480) {
//          VollyballMainViewController_iphone *iphone = [[VollyballMainViewController_iphone alloc] init];
//          navController = [[UINavigationController alloc] initWithRootViewController:iphone];
//          self.window.rootViewController = self.navController;
//          [navController setNavigationBarHidden:YES];
          self.viewController = [[VollyballMainViewController alloc] initWithNibName:@"ScoreboardMainScreen_i5" bundle:nil];
          navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
          self.window.rootViewController = self.navController;
          [navController setNavigationBarHidden:YES];
          
          iOSDeviceDetect = 2;
       }
      else{
          self.viewController = [[VollyballMainViewController alloc] initWithNibName:@"ScoreboardMainScreen_i5" bundle:nil];
          navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
          self.window.rootViewController = self.navController;
          [navController setNavigationBarHidden:YES];
          
          iOSDeviceDetect = 3;
      }
   }
    
    
//    self.viewController = [[VollyballMainViewController alloc] initWithNibName:@"ScoreboardMainScreen_i5" bundle:nil];
//    navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
//    self.window.rootViewController = self.navController;
//    [navController setNavigationBarHidden:YES];
    
    
    //            self.Vcontroller = [[LargeSPTCSViewController alloc] initWithNibName:@"SptcsViewController_iPhone5" bundle:nil];
//            navController = [[UINavigationController alloc] initWithRootViewController:self.Vcontroller];
//            self.window.rootViewController = self.navController;
//            [navController setNavigationBarHidden:YES];
//            self.viewController = [[SptcsViewController alloc] initWithNibName:@"SptcsViewController_iPhone5" bundle:nil];
//            navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
//            self.window.rootViewController = self.navController;
//            [navController setNavigationBarHidden:YES];
//        }

//    }

	faceBook=[[Facebook alloc] init];
    [[NSUserDefaults standardUserDefaults] setObject:@"red.jpg"forKey:@"guestScoreLableColour"];

     [[NSUserDefaults standardUserDefaults] setObject:@"blue.jpg"forKey:@"homeScoreLableColour"];
    //Storing all the settings and score in user defaults to maintain persitancy
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:@"blue.png" forKey:@"homeScoreLableColour"];
        
	}
	
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour"]==nil) {
		[[NSUserDefaults standardUserDefaults] setObject:@"red.png" forKey:@"guestScoreLableColour"];
	}
    [[NSUserDefaults standardUserDefaults] setObject:@"red4.jpg"forKey:@"guestScoreLableColour4"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"blue4.jpg"forKey:@"homeScoreLableColour4"];
    //Storing all the settings and score in user defaults to maintain persitancy
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour4"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:@"orange4.jpg" forKey:@"homeScoreLableColour4"];
	}
	
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour4"]==nil) {
		[[NSUserDefaults standardUserDefaults] setObject:@"orange4.jpg" forKey:@"guestScoreLableColour4"];
	}
    
    [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"isuue"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"red5.jpg"forKey:@"guestScoreLableColour5"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"blue5.jpg"forKey:@"homeScoreLableColour5"];
    //Storing all the settings and score in user defaults to maintain persitancy
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"homeScoreLableColour5"]==nil) {
        [[NSUserDefaults standardUserDefaults] setObject:@"orange5.jpg" forKey:@"homeScoreLableColour5"];
        
	}
	
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"guestScoreLableColour5"]==nil) {
		[[NSUserDefaults standardUserDefaults] setObject:@"orange5.jpg" forKey:@"guestScoreLableColour5"];
	}
    
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"BugFixingValueForVoleyBall"];

    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"StartingInstructions"];
    
	
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"minutes"];
	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"seconds"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"minutesTheme1"];
	[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"secondsTheme1"];
	
	
	// Override point for customization after application launch.
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"DigitalThemeNumber"];
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Scorebaordnumber"];
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Theme1ThemeNumber"];
    
    [[NSUserDefaults standardUserDefaults]setInteger:1 forKey:@"Theme2ThemeNumber"];
    
    [[NSUserDefaults standardUserDefaults]setInteger:3 forKey:@"Theme2ThemeNumberHome"];
    
    
	
	[self.window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

-(void)gameOver:(NSTimeInterval)time{
	   
    //	NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Buzzer.mp3",[[NSBundle mainBundle] resourcePath]]];
    //	NSError *error;
    //	timeOverSoundPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    //	timeOverSoundPlayer.numberOfLoops = 0;
    //	timeOverSoundPlayer.volume = 10.0;	
    //	[timeOverSoundPlayer play];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    OSStatus propertySetError = 0;
    UInt32 allowMixing = true;
    propertySetError = AudioSessionSetProperty (
                                                kAudioSessionProperty_OverrideCategoryMixWithOthers,
                                                sizeof (allowMixing),
                                                &allowMixing
                                                );
    NSError *activationError = nil;
    [session setActive:YES error:&activationError];
    // Now play the sound in filePath
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Buzzer" ofType:@"mp3"];
    
    NSURL *fileUrl = [NSURL fileURLWithPath:soundPath];
    NSError *error;
    AVAudioPlayer *audio =[[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:@"error"];
    
	[audio play];
    SystemSoundID sounds[0];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    //
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[faceBook release];
	[navController release];
    [window release];
    [super dealloc];
}


@end
