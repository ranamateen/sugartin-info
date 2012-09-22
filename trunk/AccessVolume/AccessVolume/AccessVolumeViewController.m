//
//  AccessVolumeViewController.m
//  AccessVolume
//
//  Created by Sagar R. Kothari on 25/08/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import "AccessVolumeViewController.h"

@implementation AccessVolumeViewController
@synthesize viewVolume;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	// autorelease will not work as we are using STRONG - ARC now.
	
	// following code will create a Volume Controll with using the size of our view
	MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:self.viewVolume.bounds] ;
	
	// now we will add Volume Slider to our View
	[self.viewVolume addSubview:volumeView];
	
	// now fit the volume slider to our view.
	[volumeView sizeToFit];
	
	// ready to run.
}

- (void)viewDidUnload
{
    [self setViewVolume:nil];
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

@end
