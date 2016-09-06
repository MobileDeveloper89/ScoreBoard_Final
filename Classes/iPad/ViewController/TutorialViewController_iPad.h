//
//  TutorialViewController_iPad.h
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TutorialViewController_iPad : UIViewController {
    
	BOOL vollyBallScore;
	UIImageView *tutorialImageView;
}
@property(nonatomic,assign)BOOL vollyBallScore;
@property(nonatomic,retain)IBOutlet UIImageView *tutorialImageView;

-(IBAction)okButtonClick:(id)sender;
@end
