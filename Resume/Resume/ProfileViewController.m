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

@end

@implementation ProfileViewController

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

@end
