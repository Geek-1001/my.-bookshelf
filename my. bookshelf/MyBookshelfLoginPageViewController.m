#import "MyBookshelfLoginPageViewController.h"
@interface MyBookshelfLoginPageViewController ()
@end

@implementation MyBookshelfLoginPageViewController
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
    for (unsigned int iterator = 0; iterator < 4; iterator++) {
        loginCard = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"loginCard.png"]]];
        loginCard.frame = CGRectMake((iterator) * 320 + 8, 0, 303, 210);
        [scrollView addSubview:loginCard];
        
        // loginCardLabel properties
        UILabel *loginCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 165, 297, 30)];
        loginCardLabel.text = [loginCardLabels objectAtIndex:iterator];
        loginCardLabel.font = [UIFont fontWithName:@"PT Sans" size:13];
        loginCardLabel.textColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
        loginCardLabel.textAlignment = NSTextAlignmentCenter;
        [loginCardLabel setBackgroundColor:[UIColor clearColor]];
        [loginCard addSubview:loginCardLabel];
        
        // loginCardIllustrations properties
        UIImageView *loginCardIllustration = [[UIImageView alloc] initWithImage:
                                              [UIImage imageNamed:[loginCardIllustrations objectAtIndex:iterator]]];
        loginCardIllustration.frame = CGRectMake(2, 1, 299, 160);
        [loginCard addSubview:loginCardIllustration];
    }
    
    
    /* UIImageView *imageViewLogin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"loginCard.png"]]];
    [scrollView addSubview:imageViewLogin];
    imageViewLogin.frame = CGRectMake(960 + 8, 0, 303, 210);
    UITextField *loginTextFieldUsername, *loginTextFieldPassword = [[UITextField alloc] init];
    loginTextFieldPassword.frame = CGRectMake(10, 80, 200, 30);
    loginTextFieldPassword.frame = CGRectMake(10, 40, 200, 30);
    [imageViewLogin addSubview:loginTextFieldUsername];
    [imageViewLogin addSubview:loginTextFieldPassword];
    loginTextFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    loginTextFieldUsername.borderStyle = UITextBorderStyleRoundedRect; */
    
    scrollView.delegate = self;
    [scrollView setScrollEnabled:YES];
    scrollView.contentSize = CGSizeMake(1280, 210);
    scrollView.pagingEnabled = YES;
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
}
- (void)setLoginButtonFacebook:(UIButton *)loginButtonFacebook {
    loginButtonLabelFacebook = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 250, 52)];
    [loginButtonLabelFacebook setBackgroundColor:[UIColor clearColor]];
    loginButtonLabelFacebook.textColor = [UIColor whiteColor];
    loginButtonLabelFacebook.shadowColor = [UIColor colorWithWhite:0 alpha:0.2];
    loginButtonLabelFacebook.shadowOffset = CGSizeMake(0, 1);
    loginButtonLabelFacebook.textAlignment = NSTextAlignmentCenter;
    loginButtonLabelFacebook.font = [UIFont fontWithName:@"PT Sans" size:15];
    loginButtonLabelFacebook.text = [NSString stringWithFormat:@"Connect with Facebook"];
    [loginButtonFacebook addSubview:loginButtonLabelFacebook];
}
- (void)setLoginButtonEmail:(UILabel *)loginButtonEmail {
    loginButtonLabelEmail = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 250, 52)];
    [loginButtonLabelEmail setBackgroundColor:[UIColor clearColor]];
    loginButtonLabelEmail.textColor = [UIColor whiteColor];
    loginButtonLabelEmail.shadowColor = [UIColor colorWithWhite:0 alpha:0.2];
    loginButtonLabelEmail.shadowOffset = CGSizeMake(0, 1);
    loginButtonLabelEmail.textAlignment = NSTextAlignmentCenter;
    loginButtonLabelEmail.font = [UIFont fontWithName:@"PT Sans" size:15];
    loginButtonLabelEmail.text = [NSString stringWithFormat:@"Sign up with Username or Email"];
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

- (IBAction)loginButtonEmailCreatePage:(UIButton *)sender {
    self.pageControl.currentPage = 4;
    
}
@end