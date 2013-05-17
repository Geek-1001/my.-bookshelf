#import "MyBookshelfLoginPageViewController.h"
@interface MyBookshelfLoginPageViewController () @end
@implementation MyBookshelfLoginPageViewController                                                              // WTF
// UIScrollViev and PageControl View
@synthesize scrollView;
@synthesize pageControl;

@synthesize loginCard;
@synthesize discoveryRound;
// login buttons
@synthesize loginButtonLabelFacebook;
@synthesize loginButtonLabelEmail;

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
    NSMutableArray *discoveryRoundIllustrations = [[NSMutableArray alloc] initWithObjects:
                                       @"discoveryRoundOne.png",
                                       @"discoveryRoundTwo.png",
                                       @"discoveryRoundThree.png",
                                       nil];
    
    NSMutableArray *discoveryRoundLabels = [[NSMutableArray alloc] initWithObjects:
                                @"Discover and share thousands of books!",
                                @"Create your own book collection!",
                                @"Get your books. Anywhere.",                         
                                nil];
    
    [self createDiscoveryRounds:3 addIllutrations:discoveryRoundIllustrations];
    [self createLoginCard:1];
    [self scrollViewProperties:scrollView andPageControl:pageControl withNumberOfPages:4];
}
- (void)scrollViewProperties:(UIScrollView *)scrollView andPageControl:(UIPageControl *)pageControl withNumberOfPages:(int)n {
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(320 * n, 210);
    self.scrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = n;
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

- (void)createDiscoveryRounds:(int)quantity addIllutrations:(NSMutableArray *)loginCardIllustrations {
    for (int iterator = 0; iterator < quantity; iterator++) {
        discoveryRound = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[loginCardIllustrations objectAtIndex:iterator]]];
        discoveryRound.frame = CGRectMake((iterator) * 320 + 60, 0, 200, 200);
        [scrollView addSubview:discoveryRound];
        //[self addLabels:loginCardLabels withQuantity:iterator];
        //[self addIllustrations:loginCardIllustrations withQuantity:iterator];
    }
}
- (void)createLoginCard:(int)quantity {
    for(int iterator = 0; iterator < quantity; iterator++) {
        loginCard = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginCard.png"]];
        loginCard.frame = CGRectMake(960 + (iterator) * 320 + 8, 0, 303, 210);
        [scrollView addSubview:loginCard];
    }
}
/*
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
*/
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

