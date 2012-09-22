//
//  setStarz.h
//  starDemo
//
//  Created by Spark on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface setStarz : UIViewController

@property (nonatomic, assign) IBOutlet ViewController *preViewController;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnGroup;
@property (strong, nonatomic) NSMutableDictionary *dToAccess;
- (IBAction)btnBackTapped:(id)sender;
- (IBAction)btnRatingTapped:(id)sender;

@end
