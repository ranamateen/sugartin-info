//
//  CheckBoxAppDelegate.m
//  CheckBox
//
//  Created by Sagar R. Kothari on 07/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "CheckBoxAppDelegate.h"
#import "CheckBoxViewController.h"

@implementation CheckBoxAppDelegate

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
