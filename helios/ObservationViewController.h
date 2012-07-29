//
//  ObservationViewController.h
//  helios
//
//  Created by John Ciacia on 7/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObservationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSInteger teacher_id;
}

@property (nonatomic, readwrite) NSInteger teacher_id;

@end
