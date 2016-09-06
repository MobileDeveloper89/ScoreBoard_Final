//
//  TutorialViewController.h
//  Scoreboard
//
//  Created by Kata on 16/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TutorialViewController : UIViewController {

	BOOL vollyBallScore;
	UIImageView *tutorialImageView;
}
@property(nonatomic,assign)BOOL vollyBallScore;
@property(nonatomic,retain)IBOutlet UIImageView *tutorialImageView;

-(IBAction)okButtonClick:(id)sender;
@end
