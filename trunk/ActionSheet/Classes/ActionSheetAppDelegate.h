//
//  ActionSheetAppDelegate.h
//  ActionSheet
//
//  Created by Sagar R. Kothari
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActionSheetViewController;

@interface ActionSheetAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ActionSheetViewController *viewController;

	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ActionSheetViewController *viewController;

@end

