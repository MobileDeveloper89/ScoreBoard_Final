//
//  TutorialViewController_iPad.m
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TutorialViewController_iPad.h"


@implementation TutorialViewController_iPad

@synthesize tutorialImageView;
@synthesize vollyBallScore;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor clearColor];
	
	if (vollyBallScore) {
		[tutorialImageView setImage:[UIImage imageNamed:@"TutorialVlyBall.jpg"]];
	}
	else {
		[tutorialImageView setImage:[UIImage imageNamed:@"TutorialBsktBall.jpg"]];
	}
    
    
    UIImage * backImage = [UIImage imageNamed:@""];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 1024, 768);
    [backButton addTarget:self action:@selector(okButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    

    
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
 
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[tutorialImageView release];
    [super dealloc];
}

#pragma mark Button click methods
-(IBAction)okButtonClick:(id)sender
{
	[self dismissModalViewControllerAnimated:YES];
}

@end
