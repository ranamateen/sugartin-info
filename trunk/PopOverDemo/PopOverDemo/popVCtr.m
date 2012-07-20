//
//  popVCtr.m
//  PopOverDemo
//
//  Created by Spark on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "popVCtr.h"

@interface popVCtr ()

@end

@implementation popVCtr

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modalInPopover = NO;
    self.contentSizeForViewInPopover = CGSizeMake(300, 300);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


@end
