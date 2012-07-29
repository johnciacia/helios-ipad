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

@interface MasterViewController : UIViewController {
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UINavigationController *navigationController;
    
    NSURLConnection *theConnection;
    SBJsonStreamParser *parser;
    SBJsonStreamParserAdapter *adapter;
    
    NSMutableDictionary *teachers;
}

@property (strong, nonatomic) DetailViewController *detailViewController;


-(IBAction)login:(id)sender;

@end
