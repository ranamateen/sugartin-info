//
//  UIDownloadBarAppDelegate.h
//  UIDownloadBar
//
//  Created by Nimit Parekh on 12/9/12.
//  Copyright http://sugartin.info 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDownloadBar.h"

@interface UIDownloadBarAppDelegate : NSObject <UIApplicationDelegate, UIDownloadBarDelegate,UIAlertViewDelegate> {
    UIWindow *window;
	UIDownloadBar *bar;
    UILabel *lblForDisplay;
    UIAlertView *alert;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
