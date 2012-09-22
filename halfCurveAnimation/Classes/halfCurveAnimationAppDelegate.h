//
//  halfCurveAnimationAppDelegate.h
//  halfCurveAnimation
//
//  Created by Sagar R. Kothari on 21/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class halfCurveAnimationViewController;

@interface halfCurveAnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    halfCurveAnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet halfCurveAnimationViewController *viewController;

@end

