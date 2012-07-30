//
//  LoginViewController.h
//  helios
//
//  Created by John Ciacia on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson/SBJson.h"

@class DetailViewController;
@class SBJsonStreamParser;

@interface LoginViewController : UIViewController {
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
    
    NSURLConnection *theConnection;
    SBJsonStreamParser *parser;
    SBJsonStreamParserAdapter *adapter;
    
    NSMutableDictionary *teachers;
}


-(IBAction)login:(id)sender;


@end
