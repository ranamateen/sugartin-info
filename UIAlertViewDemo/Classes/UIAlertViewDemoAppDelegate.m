//
//  UIAlertViewDemoAppDelegate.m
//  UIAlertViewDemo
//
//  Created by Sagar R. Kothari on 24/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "UIAlertViewDemoAppDelegate.h"
#import "UIAlertViewDemoViewController.h"

@implementation UIAlertViewDemoAppDelegate

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
