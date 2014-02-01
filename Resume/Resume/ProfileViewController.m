//
//  ViewController.m
//  Resume
//
//  Created by Ian MacLeod on 1/31/14.
//  Copyright (c) 2014 Jane Developer. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ProfileViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
}

- (void)viewDidLayoutSubviews
{
    // Force the text view to resize to fit its content.
    CGRect descriptionFrame = self.descriptionTextView.frame;
    descriptionFrame.size = [self.descriptionTextView sizeThatFits:self.view.bounds.size];
    self.descriptionTextView.frame = descriptionFrame;

    // Calculate the scroll view's content size, since all our subviews are of
    // a known size and position.
    CGSize scrollContentSize = self.view.frame.size;
    // We walk through all subviews and find the bottommost point: That's our new height.
    for (UIView *subview in self.scrollView.subviews) {
        CGFloat viewBottom = CGRectGetMaxY(subview.frame);
        if (viewBottom > scrollContentSize.height) {
            scrollContentSize.height = viewBottom;
        }
    }

    self.scrollView.contentSize = scrollContentSize;
}

#pragma mark - UIScrollViewDelegate

// Advanced: Support for bouncing the background image when the user pulls down on the scroll view.
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // We only want to extend above the scroll view.
    CGFloat topOffset = MIN(self.scrollView.contentOffset.y, 0.0);

    // Adjust the top and height so that the background is always pinned to the
    // top of the screen (while the bottom stays pinned to the scrolling content).
    CGRect frame = self.backgroundImageView.frame;
    // Calculate the image's height as if we were at the top of the screen.
    CGFloat baseHeight = frame.size.height + frame.origin.y;
    // And then stretch us so that the bottom doesn't move.
    frame.origin.y = topOffset;
    frame.size.height = baseHeight - topOffset;

    self.backgroundImageView.frame = frame;
}

@end
