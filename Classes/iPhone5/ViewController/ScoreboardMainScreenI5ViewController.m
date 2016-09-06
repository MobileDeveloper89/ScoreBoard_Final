//
//  ScoreboardMainScreenI5ViewController.m
//  scoreboard
//
//  Created by admin on 7/4/16.
//
//

#import "ScoreboardMainScreenI5ViewController.h"

@interface ScoreboardMainScreenI5ViewController ()

@end

@implementation ScoreboardMainScreenI5ViewController

@synthesize m_pSubView1, m_pSubView2, m_pSubView3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *leftSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onLeftSlide)];
    leftSwipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: leftSwipeLeft];
    
    UISwipeGestureRecognizer *rightSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onRighftSlide)];
    rightSwipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: rightSwipeLeft];
    
    UITapGestureRecognizer *firstScoreBoardClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstTapDetected)];
    firstScoreBoardClick.numberOfTapsRequired = 1;
    [m_pSubView1 setUserInteractionEnabled:YES];
    [m_pSubView1 addGestureRecognizer:firstScoreBoardClick];
    
    UITapGestureRecognizer *secondScoreBoardClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secondTapDetected)];
    secondScoreBoardClick.numberOfTapsRequired = 1;
    [m_pSubView2 setUserInteractionEnabled:YES];
    [m_pSubView2 addGestureRecognizer:secondScoreBoardClick];
    
    UITapGestureRecognizer *thirdScoreBoardClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thirdTapDetected)];
    thirdScoreBoardClick.numberOfTapsRequired = 1;
    [m_pSubView3 setUserInteractionEnabled:YES];
    [m_pSubView3 addGestureRecognizer:thirdScoreBoardClick];
    
    [self initSlideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) firstTapDetected{
    NSLog(@"first scoreboard");
}

- (void) secondTapDetected{
    NSLog(@"second scoreboard");
}

- (void) thirdTapDetected{
    NSLog(@"third scoreboard");
}

- (void) initSlideView
{
    nViewState = 2;
    
    nRect1 = m_pSubView1.frame;
    nRect2 = m_pSubView2.frame;
    nRect3 = m_pSubView3.frame;
    m_pSubView1.alpha = 0.8;
    m_pSubView3.alpha = 0.8;
    m_pSubView2.alpha = 1.0;
    
    [self TapTheVolleyBallView:nil];
}

- (void) slideView:(int) val
{
    
}

- (void) onLeftSlide
{

    if (nViewState == 2)
    {
        nViewState = 1;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView2.frame = nRect1;
        m_pSubView3.frame = nRect2;
        m_pSubView2.alpha = 0.8;
        m_pSubView3.alpha = 1.0;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect1;
        rect1.origin.x = rect1.origin.x - rect1.size.width;
        
        CGRect rect2 = nRect3;
        rect2.origin.x = rect2.origin.x + rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView1.frame = rect1;
                             m_pSubView1.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView1.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView1.frame = nRect3;
                             m_pSubView1.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    } else if (nViewState == 1)
    {
        nViewState = 3;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView3.frame = nRect1;
        m_pSubView1.frame = nRect2;
        m_pSubView3.alpha = 0.8;
        m_pSubView1.alpha = 1.0;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect1;
        rect1.origin.x = rect1.origin.x - rect1.size.width;
        
        CGRect rect2 = nRect3;
        rect2.origin.x = rect2.origin.x + rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView2.frame = rect1;
                             m_pSubView2.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView2.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView2.frame = nRect3;
                             m_pSubView2.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    } else {
        nViewState = 2;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView1.frame = nRect1;
        m_pSubView2.frame = nRect2;
        m_pSubView1.alpha = 0.8;
        m_pSubView2.alpha = 1.0;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect1;
        rect1.origin.x = rect1.origin.x - rect1.size.width;
        
        CGRect rect2 = nRect3;
        rect2.origin.x = rect2.origin.x + rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView3.frame = rect1;
                             m_pSubView3.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView3.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView3.frame = nRect3;
                             m_pSubView3.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    }
}

- (void) onRighftSlide
{

    if (nViewState == 2)
    {
        nViewState = 3;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView1.frame = nRect2;
        m_pSubView2.frame = nRect3;
        m_pSubView1.alpha = 1.0;
        m_pSubView2.alpha = 0.8;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect3;
        rect1.origin.x = rect1.origin.x + rect1.size.width;
        
        CGRect rect2 = nRect1;
        rect2.origin.x = rect2.origin.x - rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView3.frame = rect1;
                             m_pSubView3.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView3.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView3.frame = nRect1;
                             m_pSubView3.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    } else if (nViewState == 3)
    {
        nViewState = 1;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView3.frame = nRect2;
        m_pSubView1.frame = nRect3;
        m_pSubView3.alpha = 1.0;
        m_pSubView1.alpha = 0.8;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect3;
        rect1.origin.x = rect1.origin.x + rect1.size.width;
        
        CGRect rect2 = nRect1;
        rect2.origin.x = rect2.origin.x - rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView2.frame = rect1;
                             m_pSubView2.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView2.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView2.frame = nRect1;
                             m_pSubView2.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    } else {
        nViewState = 2;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        m_pSubView2.frame = nRect2;
        m_pSubView3.frame = nRect3;
        m_pSubView2.alpha = 1.0;
        m_pSubView3.alpha = 0.8;
        [UIView commitAnimations];
        
        CGRect rect1 = nRect3;
        rect1.origin.x = rect1.origin.x + rect1.size.width;
        
        CGRect rect2 = nRect1;
        rect2.origin.x = rect2.origin.x - rect2.size.width * 0.75;
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             m_pSubView1.frame = rect1;
                             m_pSubView1.alpha = 0.9;
                         }
                         completion:^(BOOL finished){
                             m_pSubView1.frame = rect2;
                             
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:0.25];
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                             m_pSubView1.frame = nRect1;
                             m_pSubView1.alpha = 0.8;
                             [UIView commitAnimations];
                         }];
    }
}

- (IBAction) onRateUs:(id)sender
{
    
}

@end


