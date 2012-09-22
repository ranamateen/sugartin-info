//
//  cTabBarAppDelegate.m
//  cTabBar
//
//  Created by Sagar R. on 01/07/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import "cTabBarAppDelegate.h"

@implementation cTabBarAppDelegate

@synthesize window=_window;
@synthesize tabBarController=_tabBarController;
@synthesize imgV = _imgV;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Override point for customization after application launch.
	// Add the tab bar controller's current view as a subview of the window
	self.tabBarController.delegate=self;
	self.imgV.frame=CGRectMake(0, 425, 320, 55);
	[self.tabBarController.view addSubview:self.imgV];
	self.tabBarController.selectedIndex=0;
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
	NSUInteger index=[[tabBarController viewControllers] indexOfObject:viewController];
	
	switch (index) {
		case 0:
			self.imgV.image=[UIImage imageNamed:@"tBar1.png"];
			break;
		case 1:
			self.imgV.image=[UIImage imageNamed:@"tBar2.png"];
			break;
		case 2:
			self.imgV.image=[UIImage imageNamed:@"tBar3.png"];
			break;
		case 3:
			self.imgV.image=[UIImage imageNamed:@"tBar4.png"];
			break;
		case 4:
			self.imgV.image=[UIImage imageNamed:@"tBar5.png"];
			break;
		default:
			break;
	}
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc
{
	[_window release];
	[_tabBarController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
