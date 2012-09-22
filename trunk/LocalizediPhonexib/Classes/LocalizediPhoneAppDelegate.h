//
//  LocalizediPhoneAppDelegate.h
//  LocalizediPhone
//
//  Created by Sagar R. Kothari  on 09/05/09.
//  Copyright http://sugartin.info 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocalizediPhoneViewController;

@interface LocalizediPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LocalizediPhoneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LocalizediPhoneViewController *viewController;

@end

