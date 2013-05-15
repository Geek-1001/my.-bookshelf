#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface MyBookshelfLoginPageViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView  *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UIButton       *loginButtonFacebook;
@property (strong, nonatomic) IBOutlet UIButton       *loginButtonEmail;

@property (strong, nonatomic) IBOutlet UILabel        *loginButtonLabelFacebook;
@property (strong, nonatomic) IBOutlet UILabel        *loginButtonLabelEmail;

@property (strong, nonatomic) IBOutlet UILabel        *loginButtonLabel;
@property (strong, nonatomic) IBOutlet UIImageView    *loginCard;
- (IBAction)loginButtonEmailCreatePage:(UIButton *)sender;
@end
