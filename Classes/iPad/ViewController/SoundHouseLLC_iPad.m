//
//  SoundHouseLLC_iPad.m
//  Scoreboard
//
//  Created by SPT on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundHouseLLC_iPad.h"


@implementation SoundHouseLLC_iPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect webFrame = CGRectMake(0, 0, 1024, 748);
    UIWebView *webView = [[UIWebView alloc] initWithFrame:webFrame];
    //[webView setBackgroundColor:[UIColor greenColor]];
    NSString *urlAddress = @"http://www.facebook.com/soundhousellc";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.view addSubview:webView]; 
    
    
    Back= [UIButton buttonWithType:UIButtonTypeCustom];
    [Back addTarget:self 
             action:@selector(backButtonClicked)
   forControlEvents:UIControlEventTouchDown];
    [Back setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
    //[Back setTitle:@"Back" forState:UIControlStateNormal];
    Back.frame = CGRectMake(5, 5, 105, 36);
    [self.view addSubview:Back]; 
    
    
    /*
     Menu= [UIButton buttonWithType:UIButtonTypeRoundedRect];
     [Menu addTarget:self 
     action:@selector(MenuButtonClicked)
     forControlEvents:UIControlEventTouchDown];
     [Menu setTitle:@"Menu" forState:UIControlStateNormal];
     Menu.frame = CGRectMake(700, 10, 60, 40.0);
     [self.view addSubview:Menu];
     */
    
}
-(void)backButtonClicked{
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 -(void)MenuButtonClicked{
 PathGameViewController *pathGamneViewController =[[PathGameViewController alloc]initWithNibName:@"PathGameViewController" bundle:Nil];
 [self.navigationController pushViewController:pathGamneViewController animated:YES];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    NSLog(@"cbdc dfishbveficdfc fcv fcvuf");

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
@end
