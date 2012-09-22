//
//  setStarz.m
//  starDemo
//
//  Created by Spark on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "setStarz.h"
#import "ViewController.h"

@implementation setStarz

@synthesize preViewController = _preViewController;
@synthesize lblTitle;
@synthesize btnGroup;
@synthesize dToAccess = _dToAccess;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.lblTitle.text = [self.dToAccess valueForKey:@"title"];
    NSUInteger value = [[self.dToAccess valueForKey:@"rating"] integerValue];
    switch (value) {
        case 0:
            [[self.btnGroup objectAtIndex:0] setSelected:NO];
            [[self.btnGroup objectAtIndex:1] setSelected:NO];
            [[self.btnGroup objectAtIndex:2] setSelected:NO];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            break;
        case 1:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:NO];
            [[self.btnGroup objectAtIndex:2] setSelected:NO];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            break;
        case 2:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:NO];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            break;
        case 3:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            break;
        case 4:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:YES];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            break;
        case 5:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:YES];
            [[self.btnGroup objectAtIndex:4] setSelected:YES];
            break;
        default:
            break;
    }
    [super viewWillAppear:animated];
}

- (void)viewDidUnload
{
    [self setLblTitle:nil];
    [self setBtnGroup:nil];
    [self setDToAccess:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnBackTapped:(id)sender {
    [self.preViewController.tableView reloadData];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)btnRatingTapped:(id)sender {
    NSUInteger index = [self.btnGroup indexOfObject:sender];
    switch (index) {
        case 0:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:NO];
            [[self.btnGroup objectAtIndex:2] setSelected:NO];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            [self.dToAccess setValue:[NSNumber numberWithInt:1] forKey:@"rating"];
            break;
        case 1:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:NO];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            [self.dToAccess setValue:[NSNumber numberWithInt:2] forKey:@"rating"];
            break;
        case 2:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:NO];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            [self.dToAccess setValue:[NSNumber numberWithInt:3] forKey:@"rating"];
            break;
        case 3:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:YES];
            [[self.btnGroup objectAtIndex:4] setSelected:NO];
            [self.dToAccess setValue:[NSNumber numberWithInt:4] forKey:@"rating"];
            break;
        case 4:
            [[self.btnGroup objectAtIndex:0] setSelected:YES];
            [[self.btnGroup objectAtIndex:1] setSelected:YES];
            [[self.btnGroup objectAtIndex:2] setSelected:YES];
            [[self.btnGroup objectAtIndex:3] setSelected:YES];
            [[self.btnGroup objectAtIndex:4] setSelected:YES];
            [self.dToAccess setValue:[NSNumber numberWithInt:5] forKey:@"rating"];
            break;
        default:
            break;
    }
}

@end
