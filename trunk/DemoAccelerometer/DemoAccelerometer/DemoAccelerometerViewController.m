//
//  DemoAccelerometerViewController.m
//  DemoAccelerometer
//
//  Created by Sagar R. Kothari on 11/08/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import "DemoAccelerometerViewController.h"

@implementation DemoAccelerometerViewController
@synthesize imgVPendulum;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIAccelerometer*  theAccelerometer = [UIAccelerometer sharedAccelerometer];
	theAccelerometer.updateInterval = 1 / 50.0; // 50 times in a second
	theAccelerometer.delegate = self;
}

- (void)viewDidUnload
{
    [self setImgVPendulum:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	CGFloat x=acceleration.x;
	self.imgVPendulum.transform=CGAffineTransformMakeRotation(-x);
}

@end
