//
//  NavigationBarDemoAppDelegate.m
//  NavigationBarDemo
//
//  Created by Sagar R. Kothari on 18/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "NavigationBarDemoAppDelegate.h"
#import "NavigationBarDemoViewController.h"

@implementation NavigationBarDemoAppDelegate

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
