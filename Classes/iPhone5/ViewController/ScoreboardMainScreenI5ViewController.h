//
//  ScoreboardMainScreenI5ViewController.h
//  scoreboard
//
//  Created by admin on 7/4/16.
//
//

#import <UIKit/UIKit.h>

@interface ScoreboardMainScreenI5ViewController : UIViewController
{
    int nViewState;
    CGRect nRect1;
    CGRect nRect2;
    CGRect nRect3;
}

- (void) slideView:(int) val;
- (void) initSlideView;

- (void) onLeftSlide;
- (void) onRighftSlide;

@property(nonatomic, retain) IBOutlet UIImageView *m_pSubView1;
@property(nonatomic, retain) IBOutlet UIImageView *m_pSubView2;
@property(nonatomic, retain) IBOutlet UIImageView *m_pSubView3;

- (IBAction) onRateUs:(id)sender;

@end
