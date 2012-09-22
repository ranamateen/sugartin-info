//
//  CheckBoxAppDelegate.h
//  CheckBox
//
//  Created by Sagar R. Kothari on 07/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CheckBoxViewController;

@interface CheckBoxAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CheckBoxViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CheckBoxViewController *viewController;

@end

