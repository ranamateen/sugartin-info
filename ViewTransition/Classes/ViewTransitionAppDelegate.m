//
//  ViewTransitionAppDelegate.m
//  ViewTransition
//
//  Created by Sagar R. Kothari on 09-04-28.
//  Copyright http://sugartin.info 2009. All rights reserved.
//

#import "ViewTransitionAppDelegate.h"

@implementation ViewTransitionAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	MyView *viewController = [[MyView alloc] initWithNibName:@"MyView" bundle:[NSBundle mainBundle]];
	[window addSubview:[viewController view]];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
