//
//  STViewController.h
//  AddToCart
//
//  Created by Sagar R. Kothari on 24/09/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
// a tableview to display list
@property (nonatomic,strong) IBOutlet UITableView *tableView;
// an array to have data objects
@property (nonatomic,strong) NSArray *arOfWatches;
// an array to have cart data objects
@property (nonatomic,strong) NSMutableArray *arOfWatchesOfCart;
// a tabBarItem to update badge value
@property (weak, nonatomic) IBOutlet UITabBarItem *tabItemCart;

@end
