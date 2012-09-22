//
//  faceBookDemoAppDelegate.h
//  faceBookDemo
//
//  Created by Sagar R. Kothari on 18/07/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface faceBookDemoAppDelegate : NSObject <UIApplicationDelegate,FBRequestDelegate,FBDialogDelegate,FBSessionDelegate> {
	Facebook* _facebook;
	NSArray* _permissions;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@end
