//
//  MapkitDemoAppDelegate.h
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapkitDemoViewController;

@interface MapkitDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapkitDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapkitDemoViewController *viewController;

@end

