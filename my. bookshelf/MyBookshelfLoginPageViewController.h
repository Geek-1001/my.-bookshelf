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
- (void)scrollViewProperties:(UIScrollView *)scrollView andPageControl:(UIPageControl *)pageControl;
- (void)createLoginCards:(int)iterator addLabels:(NSMutableArray *)loginCardLabels addIllutrations:(NSMutableArray *)loginCardIllustrations;
- (void)addLabels:(NSMutableArray *)loginCardLabels withQuantity:(int)iterator;
- (void)addIllustrations:(NSMutableArray *)loginCardIllustrations withQuantity:(int)iterator;
- (void)loginButtonLabelProperties:(UILabel *)loginButtonLabel andText:(NSString *)buttonLabelText;
- (void)setLoginButtonFacebook:(UIButton *)loginButtonFacebook;
- (void)setLoginButtonEmail:(UIButton *)loginButtonEmail;
@end
