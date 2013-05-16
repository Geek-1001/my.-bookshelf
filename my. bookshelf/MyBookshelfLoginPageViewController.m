#import "MyBookshelfLoginPageViewController.h"
@interface MyBookshelfLoginPageViewController () @end
@implementation MyBookshelfLoginPageViewController                                                              // WTF
// UIScrollViev and PageControl View
@synthesize scrollView;
@synthesize pageControl;
// login buttons
@synthesize loginButtonLabelFacebook;
@synthesize loginButtonLabelEmail;
@synthesize loginCard;

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * TODO
     * intializes in console
     */
        NSArray *toDo = [[NSArray alloc] initWithObjects:
                     @"Создать public метод, который будет объединять в себе loginButtonLabelFacebook и loginButtionLabelEmail и будет давать возможность изменять лишь свойство .text;",
                     @"Добавить loginCardIllustrations, нарисовать их;"
                     , nil];
        NSLog(@"TODO: \n");
    for(int iterator = 0; iterator < toDo.count; iterator++) {
        NSLog(@"%d. %@", iterator + 1, [toDo objectAtIndex:iterator]);
    }
    
    /*
     * SCROLL VIEW
     * properties for variables and objects
     * initializes first
     */
    NSMutableArray *loginCardIllustrations = [[NSMutableArray alloc] initWithObjects:
                                       @"loginCardIllustration.png",
                                       @"loginCardIllustration.png",
                                       @"loginCardIllustration.png",
                                       // Destroy this item or return nil.       
                                       @"",
                                       nil];
    
    NSMutableArray *loginCardLabels = [[NSMutableArray alloc] initWithObjects:
                                @"Discover and share thousands of books!",
                                @"Create your own book collection!",
                                @"Get your books. Anywhere.",
                                // Destroy this item or return nil.
                                @"",                                                    
                                nil];
    
    [self createLoginCards:4 addLabels:loginCardLabels addIllutrations:loginCardIllustrations];
    [self scrollViewProperties:scrollView andPageControl:pageControl];
}
- (void)scrollViewProperties:(UIScrollView *)scrollView andPageControl:(UIPageControl *)pageControl {
    self.scrollView.delegate = self;
    [self.scrollView setScrollEnabled:YES];
    self.scrollView.contentSize = CGSizeMake(1280, 210);
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 0;
}
- (void)loginButtonLabelProperties:(UILabel *)loginButtonLabel andText:(NSString *)buttonLabelText {
    [loginButtonLabel setBackgroundColor:[UIColor clearColor]];
    loginButtonLabel.frame = CGRectMake(45, 0, 250, 52);
    loginButtonLabel.textColor = [UIColor whiteColor];
    loginButtonLabel.shadowColor = [UIColor colorWithWhite:0 alpha:0.2];
    loginButtonLabel.shadowOffset = CGSizeMake(0, 1);
    loginButtonLabel.textAlignment = NSTextAlignmentCenter;
    loginButtonLabel.font = [UIFont fontWithName:@"PT Sans" size:15];
    loginButtonLabel.text = [NSString stringWithFormat:@"%@", buttonLabelText];
}

- (void)createLoginCards:(int)iterator addLabels:(NSMutableArray *)loginCardLabels addIllutrations:(NSMutableArray *)loginCardIllustrations {
    for (iterator = 0; iterator < 4; iterator++) {
        loginCard = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"loginCard.png"]]];
        loginCard.frame = CGRectMake((iterator) * 320 + 8, 0, 303, 210);
        [scrollView addSubview:loginCard];
        [self addLabels:loginCardLabels withQuantity:iterator];
        [self addIllustrations:loginCardIllustrations withQuantity:iterator];
    }
}
- (void)addLabels:(NSMutableArray *)loginCardLabels withQuantity:(int)iterator {
    // loginCardLabel properties
    UILabel *loginCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 169, 297, 30)];
    loginCardLabel.text = [loginCardLabels objectAtIndex:iterator];
    loginCardLabel.font = [UIFont fontWithName:@"PT Sans" size:13];
    loginCardLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    loginCardLabel.textAlignment = NSTextAlignmentCenter;
    [loginCardLabel setBackgroundColor:[UIColor clearColor]];
    [loginCard addSubview:loginCardLabel];
}
- (void)addIllustrations:(NSMutableArray *)loginCardIllustrations withQuantity:(int)iterator {
    // loginCardIllustrations properties
    UIImageView *loginCardIllustration = [[UIImageView alloc] initWithImage:
                                          [UIImage imageNamed:[loginCardIllustrations objectAtIndex:iterator]]];
    loginCardIllustration.frame = CGRectMake(2, 1, 299, 160);
    [loginCard addSubview:loginCardIllustration];
}

- (void)setLoginButtonFacebook:(UIButton *)loginButtonFacebook {
    loginButtonLabelFacebook = [[UILabel alloc] init];
    [self loginButtonLabelProperties:loginButtonLabelFacebook andText:@"Connect with Facebook"];
    [loginButtonFacebook addSubview:loginButtonLabelFacebook];
}
- (void)setLoginButtonEmail:(UIButton *)loginButtonEmail {
    loginButtonLabelEmail = [[UILabel alloc] init];
    [self loginButtonLabelProperties:loginButtonLabelEmail andText:@"Sign in using Username or Email"];
    [loginButtonEmail addSubview:loginButtonLabelEmail];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    pageControl.currentPage = page;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}
@end

