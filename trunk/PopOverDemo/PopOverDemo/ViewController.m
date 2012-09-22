//
//  ViewController.m
//  PopOverDemo
//
//  Created by Spark on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize anyBarButtonTapped;
@synthesize popVCtr = _popVCtr;
@synthesize nxtpopVCtr = _nxtpopVCtr;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setAnyBarButtonTapped:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)anyButtonTapped:(id)sender {
    // type casting.
    UIBarButtonItem *item = (UIBarButtonItem*)sender;
    
    // create popover if needed
    if(!self.popVCtr) {
        // first create view controller
        self.nxtpopVCtr= [[popVCtr alloc] initWithNibName:@"popVCtr" bundle:nil];
        // assing view controller to popover
        self.popVCtr=[[UIPopoverController alloc] initWithContentViewController:self.nxtpopVCtr];
    }
    
    // display popover now.
    [self.popVCtr presentPopoverFromBarButtonItem:item permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


@end










