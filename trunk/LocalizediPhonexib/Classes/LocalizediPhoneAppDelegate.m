//
//  LocalizediPhoneAppDelegate.m
//  LocalizediPhone
//
//  Created by Sagar R. Kothari  on 09/05/09.
//  Copyright http://sugartin.info 2009. All rights reserved.
//

#import "LocalizediPhoneAppDelegate.h"
#import "LocalizediPhoneViewController.h"

@implementation LocalizediPhoneAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    // Override point for customization after app launch    
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
