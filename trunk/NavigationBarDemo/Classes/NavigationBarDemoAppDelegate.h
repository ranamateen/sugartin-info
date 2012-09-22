//
//  NavigationBarDemoAppDelegate.h
//  NavigationBarDemo
//
//  Created by Sagar R. Kothari on 18/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationBarDemoViewController;

@interface NavigationBarDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NavigationBarDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NavigationBarDemoViewController *viewController;

@end

