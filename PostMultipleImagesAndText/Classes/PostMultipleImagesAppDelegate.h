//
//  PostMultipleImagesAppDelegate.h
//  PostMultipleImages
//
//  Created by Sagar R. Kothari on 02/05/11.
//  Copyright http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostMultipleImagesAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

