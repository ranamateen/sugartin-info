//
//  MyView.m
//  ViewTransition
//
//  Created by Sagar R. Kothari on 09-04-28.
//  Copyright 2009 http://sugartin.info. All rights reserved.
//

#import "MyView.h"


@implementation MyView

-(void)removeView {
	if (view1OnTop) {
		view2.alpha = 1;
		[view2 removeFromSuperview];
	}
	else {
		view1.alpha = 1;
		[view1 removeFromSuperview];
	}
}
-(IBAction)transitionFade {
	if (view1OnTop) {
		[placeholder addSubview:view2];
		view2.alpha = 0;
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:1.5];
		view1.alpha = 0;
		view2.alpha = 1;
		[UIView commitAnimations];
	}
	else {
		[placeholder addSubview:view1];
		view1.alpha = 0;
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:1.5];
		view2.alpha = 0;
		view1.alpha = 1;
		[UIView commitAnimations];
	}
	[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(removeView) userInfo:nil repeats:NO];
	view1OnTop = !view1OnTop;
}


-(IBAction)transitionCurl:(id)sender {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];	
	if ([sender tag] == 1) {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:placeholder cache:YES];
	}
	else {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:placeholder cache:YES];
	}
	if (view1OnTop) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	}
	else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
}
-(IBAction)transitionFlip2 {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];	
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
	if (view1OnTop) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	}
	else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
	
}

-(IBAction)transitionFlip:(id)sender {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];	
	if ([sender tag] == 1) {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:placeholder cache:YES];
	}
	else {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
	}
	if (view1OnTop) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	}
	else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
}

- (void)viewDidLoad {
	[placeholder addSubview:view1];
	view1OnTop = YES;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
	[placeholder release];
	[view1 release];
	[view2 release];
    [super dealloc];
}


@end
