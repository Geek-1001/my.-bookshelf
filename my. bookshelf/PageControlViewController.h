//
//  PageControlViewController.h
//  my. bookshelf
//
//  Created by Andrew Veles on 5/12/13.
//  Copyright (c) 2013 Andrew Veles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageArray;
@end
