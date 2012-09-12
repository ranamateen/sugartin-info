//
//  MapkitDemoAppDelegate.m
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "MapkitDemoAppDelegate.h"
#import "MapkitDemoViewController.h"

@implementation MapkitDemoAppDelegate

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
