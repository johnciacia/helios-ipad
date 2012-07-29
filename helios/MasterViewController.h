//
//  MasterViewController.h
//  helios
//
//  Created by John Ciacia on 7/26/12.
//  Copyright (c) 2012 Onnolia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson/SBJson.h"

@class DetailViewController;
@class SBJsonStreamParser;

@interface MasterViewController : UIViewController <SBJsonStreamParserAdapterDelegate, NSURLConnectionDelegate> {
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UINavigationController *navigationController;
    
    NSURLConnection *theConnection;
    SBJsonStreamParser *parser;
    SBJsonStreamParserAdapter *adapter;
}

@property (strong, nonatomic) DetailViewController *detailViewController;


-(IBAction)login:(id)sender;

@end
