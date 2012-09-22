//
//  ViewController.h
//  starDemo
//
//  Created by Spark on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "setStarz.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *listOfItems;
@property (strong, nonatomic) IBOutlet setStarz *nxtSetStarz;

@end
