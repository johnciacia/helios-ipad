//
//  LoginViewController.m
//  helios
//
//  Created by John Ciacia on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "SideViewController.h"
#import "SBJson/SBJson.h"
#import "HeliosData.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor underPageBackgroundColor];
    
    loginFormView.layer.cornerRadius = 5;
    loginFormView.layer.masksToBounds = YES;
    
//    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
//    loginButton.backgroundColor = [UIColor whiteColor];
//    loginButton.layer.borderColor = [UIColor blackColor].CGColor;
//    loginButton.layer.borderWidth = 0.5f;
//    loginButton.layer.cornerRadius = 10.0f;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


-(IBAction)login:(id)sender 
{	
    NSString *s1 = @"http://helios.staging.onnolia.dev/api.php?username=";
    NSString *s2 = [s1 stringByAppendingString:usernameTextField.text];
    NSString *s3 = [s2 stringByAppendingString:@"&password="];
    NSString *url = [s3 stringByAppendingString:passwordTextField.text];
    
	NSError *theError = nil;    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse *theResponse =[[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];      
    NSMutableDictionary *resp = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] JSONValue];
    
    if([[resp objectForKey:@"login"] isEqualToString:@"success"]) {
        [HeliosData instance].data = resp;
        //        NSLog(@"%@", [resp objectForKey:@"teachers"]);
        [self performSegueWithIdentifier:@"login" sender:self];
    } else {
        //        NSLog(@"login failed...");
    }
}

@end
