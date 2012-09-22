//
//  ViewTransitionAppDelegate.h
//  ViewTransition
//
//  Created by Sagar R. Kothari on 09-04-28.
//  Copyright http://sugartin.info 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@class MyView;
@interface ViewTransitionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

