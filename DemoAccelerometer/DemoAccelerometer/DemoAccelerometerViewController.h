//
//  DemoAccelerometerViewController.h
//  DemoAccelerometer
//
//  Created by Sagar R. Kothari on 11/08/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoAccelerometerViewController : UIViewController <UIAccelerometerDelegate>{
	UIImageView *imgVPendulum;
}

@property (nonatomic, strong) IBOutlet UIImageView *imgVPendulum;

@end
