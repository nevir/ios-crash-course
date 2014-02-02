//
//  EmailViewController.m
//  Resume
//
//  Created by Ian MacLeod on 2/2/14.
//  Copyright (c) 2014 Jane Developer. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *senderTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

- (IBAction)send:(id)sender;

@end

@implementation EmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.senderTextField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutWithKeyboardEvent:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(layoutWithKeyboardEvent:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutWithKeyboardEvent:(NSNotification *)notification
{
    CGFloat animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardEndFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat newBottom = MIN(keyboardEndFrame.origin.y, self.view.frame.size.height);

    [UIView animateWithDuration:animationDuration animations:^{
        // Animations work like keyframes: Any values set within the animations block will become
        // text destination values. So we set the height of the body text view so that it will be
        // snug with the keyboard while it shows/hides.
        CGRect bodyFrame = self.bodyTextView.frame;
        bodyFrame.size.height = newBottom - bodyFrame.origin.y;
        self.bodyTextView.frame = bodyFrame;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [self.senderTextField becomeFirstResponder];
}

- (IBAction)send:(id)sender
{

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.bodyTextView becomeFirstResponder];
    return NO;
}

@end
