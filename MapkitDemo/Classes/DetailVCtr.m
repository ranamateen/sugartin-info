//
//  DetailVCtr.m
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import "DetailVCtr.h"

@implementation DetailVCtr
@synthesize lblDetail;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
	[self setLblDetail:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)btnBackTapped:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
	[lblDetail release];
	[super dealloc];
}
@end
