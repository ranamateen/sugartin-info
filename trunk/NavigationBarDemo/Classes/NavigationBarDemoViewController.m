//
//  NavigationBarDemoViewController.m
//  NavigationBarDemo
//
//  Created by Sagar R. Kothari on 18/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "NavigationBarDemoViewController.h"

@implementation NavigationBarDemoViewController

@synthesize v;
@synthesize nvItem;
@synthesize activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:self.v];
	[[self nvItem] setRightBarButtonItem:barButton];
	[barButton release];
}
-(IBAction)startActivity{
	[self.activityIndicator startAnimating];
}

-(IBAction)stopActivity{
	[self.activityIndicator stopAnimating];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

}


- (void)dealloc {
    [super dealloc];
}

@end
