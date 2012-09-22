//
//  ViewController.h
//  PopOverDemo
//
//  Created by Spark on 19/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popVCtr.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIBarButtonItem) NSArray *anyBarButtonTapped;


- (IBAction)anyButtonTapped:(id)sender;

@property (strong, nonatomic) UIPopoverController *popVCtr;
@property (strong, nonatomic) popVCtr *nxtpopVCtr;

@end
