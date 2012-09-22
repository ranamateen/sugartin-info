//
//  cTabBarAppDelegate.h
//  cTabBar
//
//  Created by Sagar R. on 01/07/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cTabBarAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) IBOutlet UIImageView *imgV;

@end
