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
//    [usernameTextField resignFirstResponder];
//	[passwordTextField resignFirstResponder];
//	
//	adapter = [[SBJsonStreamParserAdapter alloc] init];
//	adapter.delegate = self;
//	parser = [[SBJsonStreamParser alloc] init];
//	parser.delegate = adapter;
//	parser.supportMultipleDocuments = YES;
	
    NSString *s1 = @"http://helios.staging.onnolia.dev/api.php?username=";
    NSString *s2 = [s1 stringByAppendingString:usernameTextField.text];
    NSString *s3 = [s2 stringByAppendingString:@"&password="];
    NSString *url = [s3 stringByAppendingString:passwordTextField.text];

	NSError *theError = nil;
//    NSArray *keys = [NSArray arrayWithObjects:@"UserId", @"Password", nil];
//    NSArray *objects = [NSArray arrayWithObjects:@"rajin.sasi", @"abhi1551", nil];
//    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
//    NSString *jsonString = [jsonDictionary JSONRepresentation];
//    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [request setValue:jsonString forHTTPHeaderField:@"json"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:jsonData];
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];      
    NSMutableString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *resp = [string JSONValue];
    
//	NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
//	
//	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//
    if( [[resp objectForKey:@"login"] isEqualToString:@"success"] ) {
        [self performSegueWithIdentifier:@"login" sender:self];
    } else {
        NSLog(@"login failed...");
    }
}

#pragma mark SBJsonStreamParserAdapterDelegate methods
- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array {
    [NSException raise:@"unexpected" format:@"Should not get here"];
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict {
    NSLog(@"HERE4");
    teachers = [[NSMutableDictionary alloc] initWithDictionary:dict];
}



#pragma mark NSURLConnectionDelegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"%@", response);
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSURLCredential *credential = [NSURLCredential credentialWithUser:usernameTextField.text
															 password:passwordTextField.text
														  persistence:NSURLCredentialPersistenceForSession];
    
	[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [parser parse:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {}

@end
