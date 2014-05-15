//
//  ViewController.m
//  MySafari
//
//  Created by frank.novak on 5/14/14.
//  Copyright (c) 2014 PHMobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *myStopLoading;

@property (weak, nonatomic) IBOutlet UIButton *myReLoadButton;
@property (weak, nonatomic) IBOutlet UITextField *myURLTextField;
@property (weak, nonatomic) IBOutlet UIButton *myForwardButton;


@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@property (weak, nonatomic) IBOutlet UIButton *myBackButton;
@end

@implementation WebViewController

- (IBAction)onReloadButtonPressed:(id)sender
{
    [self.myWebView reload];
}
- (IBAction)onStopLoadingButtonPressed:(id)sender
{
    [self.myWebView stopLoading];
}
- (IBAction)onForwardButtonPressed:(id)sender
{
    [self.myWebView goForward];
}


- (IBAction)onBackButtonPressed:(id)sender {
    [self.myWebView goBack];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.myBackButton setEnabled: NO];
    [self.myForwardButton setEnabled:
     NO];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
    {
        [self.myBackButton setEnabled:[self.myWebView canGoBack]];
        [self.myForwardButton setEnabled:[self.myWebView canGoForward]];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
   // [self goToUrlString:textField.text];

    NSURL *url = [NSURL URLWithString:textField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];


    // dismisses keyboard

    [textField resignFirstResponder];
    return YES;

}
@end
