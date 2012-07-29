//
//  MasterViewController.m
//  helios
//
//  Created by John Ciacia on 7/26/12.
//  Copyright (c) 2012 Onnolia. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SideViewController.h"
#import "SBJson/SBJson.h"
#import "HeliosData.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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
