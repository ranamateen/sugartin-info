//
//  ActionSheetAppDelegate.m
//  ActionSheet
//
//  Created by Sagar R. Kothari
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "ActionSheetAppDelegate.h"
#import "ActionSheetViewController.h"

@implementation ActionSheetAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
