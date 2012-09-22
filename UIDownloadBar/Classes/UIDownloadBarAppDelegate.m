//
//  UIDownloadBarAppDelegate.m
//  UIDownloadBar
//
//  Created by Nimit Parekh on 12/9/12.
//  Copyright http://sugartin.info 2012. All rights reserved.
//

#import "UIDownloadBarAppDelegate.h"
#import "UIDownloadBar.h"

@implementation UIDownloadBarAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window

//	bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:@"https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"]
//							progressBarFrame:CGRectMake(40, 25, 200, 20)
//									 timeout:15
//									delegate:self];
//http://www.conchrepublicarts.com/Images/Arts.jpg
	
    bar = [[UIDownloadBar alloc] initWithURL:[NSURL URLWithString:@"http://www.conchrepublicarts.com/Images/Arts.jpg"]
							progressBarFrame:CGRectMake(40, 25, 200, 20)
									 timeout:15
									delegate:self];

	alert =[[UIAlertView alloc]init];
    lblForDisplay=[[UILabel alloc]initWithFrame:CGRectMake(90, 40, 200, 20)];
    lblForDisplay.backgroundColor=[UIColor clearColor];
    lblForDisplay.text=@"Downloading...";
    lblForDisplay.textColor=[UIColor whiteColor];
    
    [alert addSubview:lblForDisplay];
    [alert addSubview:bar];
    [alert show];

	[bar release];
}

- (void)applicationWillTerminate:(UIApplication *)application{
}

#pragma mark - UIDownloadBar Delegate Methods

- (void)downloadBar:(UIDownloadBar *)downloadBar didFinishWithData:(NSData *)fileData suggestedFilename:(NSString *)filename {
//	NSLog(@"%@", filename);
//    NSLog(@"%@",fileData);
    
    UIImage *img=[UIImage imageWithData:fileData];
    UIImageView *imgVctr=[[UIImageView alloc]initWithFrame:CGRectMake(40, 25, 200, 100)];
    imgVctr.image=img;
    
    //store locally data into the resource folder. 
    [window addSubview:imgVctr];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)downloadBar:(UIDownloadBar *)downloadBar didFailWithError:(NSError *)error {
	NSLog(@"%@", error);
}

- (void)downloadBarUpdated:(UIDownloadBar *)downloadBar {
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [window release];
    [super dealloc];
}

@end

