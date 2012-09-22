//
//  UIAlertViewDemoViewController.m
//  UIAlertViewDemo
//
//  Created by Sagar R. Kothari on 24/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "UIAlertViewDemoViewController.h"

@implementation UIAlertViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	alert = [[[UIAlertView alloc] initWithTitle:@"Configuring Preferences\nPlease Wait..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
		[alert show];
	UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	indicator.center=CGPointMake(alert.bounds.size.width/2, alert.bounds.size.height-50);
	[indicator startAnimating];
	[alert addSubview:indicator];
	[indicator release];
	[self performSelector:@selector(DismissMessage)  withObject:nil afterDelay:2]; 
	
}
-(void)DismissMessage{
	[alert dismissWithClickedButtonIndex:0 animated:YES];
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
