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

@interface MasterViewController : UIViewController

@property (strong, nonatomic) DetailViewController *detailViewController;



@end
