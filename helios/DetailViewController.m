//
//  DetailViewController.m
//  helios
//
//  Created by John Ciacia on 7/26/12.
//  Copyright (c) 2012 Onnolia. All rights reserved.
//

#import "DetailViewController.h"
#import "LoginViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	LoginViewController *modalLoginView = [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
	[modalLoginView setModalPresentationStyle:UIModalPresentationFullScreen];
	[self presentModalViewController:modalLoginView animated:NO];
    
    [super viewDidLoad];

    // Initialize variables
    maleDeskCount = 0;
    femaleDeskCount = 0;
    maleInteractions = [[NSMutableArray alloc] init];
    femaleInteractions = [[NSMutableArray alloc] init];
    
    DESK_HEIGHT = 37;
    DESK_WIDTH = 72;
    DESK_PADDING_LEFT = 8;
    DESK_PADDING_BOTTOM = 9;
    START_X = 56;
    START_Y = 38;
    
    studentTimerCount = 0;
    studentTimerEnabled = NO;
    teacherTimerCount = 0;
    teacherTimerEnabled = NO;
    
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



- (void)buttonClicked:(UIButton*)button
{
    NSLog(@"Button %ld clicked.", (long int)[button tag]);
}



- (IBAction)addMaleDesk:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(START_X, START_Y, DESK_WIDTH, DESK_HEIGHT);
    button.tag = maleDeskCount;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"0" forState:UIControlStateNormal];
    
    
    // double tap gesture recognizer
    UITapGestureRecognizer *dtapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGestureRecognizer:)];
    dtapGestureRecognize.delegate = self;
    dtapGestureRecognize.numberOfTapsRequired = 2;
    [button addGestureRecognizer:dtapGestureRecognize];
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [tapGestureRecognize requireGestureRecognizerToFail:dtapGestureRecognize];
    [button addGestureRecognizer:tapGestureRecognize];
    
    [maleInteractions addObject:button];
    
    [self.view addSubview:button];
    
    maleDeskCount++;
    START_X = START_X + DESK_WIDTH + DESK_PADDING_LEFT;
}

/**
 * Increment the count
 */
- (void)singleTapGestureRecognizer:(UIGestureRecognizer*)sender {
    int x = [[[maleInteractions objectAtIndex:(int)sender.view.tag] currentTitle] intValue];
    [[maleInteractions objectAtIndex:(int)sender.view.tag] setTitle:[NSString stringWithFormat:@"%d", ++x] forState:UIControlStateNormal];
}

/**
 * Decrement the count
 */
- (void)doubleTapGestureRecognizer:(UIGestureRecognizer *)sender {
    int x = [[[maleInteractions objectAtIndex:(int)sender.view.tag] currentTitle] intValue];
    if(x != 0) {
        x = x-1;
    }
    [[maleInteractions objectAtIndex:(int)sender.view.tag] setTitle:[NSString stringWithFormat:@"%d", x] forState:UIControlStateNormal];
}

- (IBAction)teacherTimer:(id)sender {
    if(teacherTimerEnabled == NO) {
        teacherTimerEnabled = YES;
        teacherTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(increaseTimerCount) userInfo:nil repeats:YES];
        [teacherTimer fire];   
    } else {
        teacherTimerEnabled = NO;
        [teacherTimer invalidate];
    }
}

- (void)increaseTimerCount {
    int seconds = teacherTimerCount % 60; 
    int minutes = (teacherTimerCount / 60) % 60; 
    //int hours = teacherTimerCount / 3600;

    teacherTimerLabel.title = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    teacherTimerCount++;
}

- (IBAction)studentTimer:(id)sender {
    NSLog(@"Student timer...");
}
@end
