//
//  UIAlertViewDemoAppDelegate.h
//  UIAlertViewDemo
//
//  Created by Sagar R. Kothari on 24/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIAlertViewDemoViewController;

@interface UIAlertViewDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIAlertViewDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIAlertViewDemoViewController *viewController;

@end

