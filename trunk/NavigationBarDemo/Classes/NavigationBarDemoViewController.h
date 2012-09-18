//
//  NavigationBarDemoViewController.h
//  NavigationBarDemo
//
//  Created by Sagar R. Kothari on 18/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationBarDemoViewController : UIViewController {
	UIView *v;
	UIActivityIndicatorView *activityIndicator;
	UINavigationItem *nvItem;
}

@property (nonatomic, retain) IBOutlet UIView *v;
@property (nonatomic, retain) IBOutlet UINavigationItem *nvItem;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

-(IBAction)startActivity;
-(IBAction)stopActivity;
@end

