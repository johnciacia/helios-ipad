//
//  DetailViewController.h
//  helios
//
//  Created by John Ciacia on 7/26/12.
//  Copyright (c) 2012 Onnolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIGestureRecognizerDelegate> {

    // Classroom Stuff
    int maleDeskCount;
    int femaleDeskCount;
    NSMutableArray *maleInteractions;
    NSMutableArray *femaleInteractions;
    
    // Position Stuff
    int DESK_HEIGHT;
    int DESK_WIDTH;
    int DESK_PADDING_LEFT;
    int DESK_PADDING_BOTTOM;
    int START_X;
    int START_Y;
    
    // Timer Stuff
    int teacherTimerCount;
    BOOL teacherTimerEnabled;
    NSTimer *teacherTimer;
    int studentTimerCount;
    BOOL studentTimerEnabled;
    NSTimer *studentTimer;
    
    // Toolbar
    IBOutlet UIBarButtonItem *teacherTimerLabel;
    IBOutlet UIBarButtonItem *studentTimerLabel;
    IBOutlet UISwitch *switchMode;
    IBOutlet UIBarButtonItem *barButtonItemPresets;
    IBOutlet UIBarButtonItem *barButtonItemAdd;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)addMaleDesk:(id)sender;
- (IBAction)teacherTimer:(id)sender;
- (IBAction)studentTimer:(id)sender;
- (IBAction)toggleMode:(id)sender;

@end
