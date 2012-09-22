//
//  STViewController.m
//  MoveAcrossPath
//
//  Created by sagar on 22/09/12.
//  Copyright (c) 2012 sugartin. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()

@end

@implementation STViewController
@synthesize imgV = _imgV;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Set up path movement
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.removedOnCompletion = NO;
	pathAnimation.duration=3;
	
	CGPoint point1 = CGPointMake(120.0f, 50.0f);
	CGPoint point2 = CGPointMake(240.0f, 150.0f);
	CGPoint point3 = CGPointMake(360.0f, 50.0f);
	CGPoint point4 = CGPointMake(480.0f+self.imgV.frame.size.width/2.0, 100.0f);
	
	CGMutablePathRef curvedPath = CGPathCreateMutable();
	CGPathMoveToPoint(curvedPath, NULL, self.imgV.frame.origin.x, self.imgV.frame.origin.y);
	CGPathAddCurveToPoint(curvedPath, NULL, point1.x, self.imgV.frame.origin.y, point1.x, self.imgV.frame.origin.y, point1.x, point1.y);
	CGPathAddCurveToPoint(curvedPath, NULL, point2.x, self.imgV.frame.origin.y, point2.x, self.imgV.frame.origin.y, point2.x, point2.y);
	CGPathAddCurveToPoint(curvedPath, NULL, point3.x, self.imgV.frame.origin.y, point3.x, self.imgV.frame.origin.y, point3.x, point3.y);
	CGPathAddCurveToPoint(curvedPath, NULL, point4.x, self.imgV.frame.origin.y, point4.x, self.imgV.frame.origin.y, point4.x, point4.y);
	pathAnimation.path = curvedPath;
	CGPathRelease(curvedPath);
	
	[self.imgV.layer addAnimation:pathAnimation forKey:@"curveAnimation"];
}

- (void)viewDidUnload
{
	[self setImgV:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return  UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
