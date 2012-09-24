//
//  STViewController.m
//  AddToCart
//
//  Created by Sagar R. Kothari on 24/09/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import "STViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface STViewController ()
- (void)addToCartTapped:(NSIndexPath*)indexPath;
- (void)reloadBadgeNumber ;
@end

@implementation STViewController

@synthesize tableView = _tableView;
@synthesize arOfWatches = _arOfWatches;
@synthesize arOfWatchesOfCart = _arOfWatchesOfCart;
@synthesize tabItemCart = _tabItemCart;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSDictionary *dWatch1 = [NSDictionary dictionaryWithObjectsAndKeys:@"Sonata XYZ Model",@"name",@"125.5$",@"price",@"image1.jpg",@"image",nil];
	NSDictionary *dWatch2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Titan PQR Model",@"name",@"225.5$",@"price",@"image2.jpg",@"image",nil];
	NSDictionary *dWatch3 = [NSDictionary dictionaryWithObjectsAndKeys:@"Tag Huer ABC Model",@"name",@"100.5$",@"price",@"image3.jpg",@"image",nil];
	NSDictionary *dWatch4 = [NSDictionary dictionaryWithObjectsAndKeys:@"Omega LMN Model",@"name",@"705.5$",@"price",@"image4.jpg",@"image",nil];
	NSDictionary *dWatch5 = [NSDictionary dictionaryWithObjectsAndKeys:@"Gucci AAA Model",@"name",@"99.5$",@"price",@"image5.jpg",@"image",nil];
	NSDictionary *dWatch6 = [NSDictionary dictionaryWithObjectsAndKeys:@"Rolex ZZZ Model",@"name",@"705.5$",@"price",@"image6.jpg",@"image",nil];
	self.arOfWatches = [NSArray arrayWithObjects:dWatch1,dWatch2,dWatch3,dWatch4,dWatch5,dWatch6, nil];
	self.arOfWatchesOfCart = [NSMutableArray array];
}

- (void)viewDidUnload
{
	[self setTabItemCart:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark - UITableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.arOfWatches.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

#define kCCell_Img			1
#define kCCell_Title		2
#define kCCell_Price		3
#define kCCell_Button		4

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(!cell) {
		cell = [[[NSBundle mainBundle] loadNibNamed:@"CCell" owner:self options:nil] objectAtIndex:0];
		UIButton *btn = (UIButton*)[cell viewWithTag:kCCell_Button];
		[btn addTarget:self action:@selector(CartTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	// access data object.
	NSDictionary *dOfObj = [self.arOfWatches objectAtIndex:indexPath.row];
	
	// set up display objects
	UILabel *lblTitle = (UILabel*)[cell viewWithTag:kCCell_Title];
	lblTitle.text=[dOfObj valueForKey:@"name"];
	
	UILabel *lblPrice = (UILabel*)[cell viewWithTag:kCCell_Price];
	lblPrice.text = [dOfObj valueForKey:@"price"];
	UIImageView *imgV = (UIImageView*)[cell viewWithTag:kCCell_Img];
	imgV.image=[UIImage imageNamed:[dOfObj valueForKey:@"image"]];
	imgV.layer.cornerRadius=5;
	imgV.layer.borderColor=[[UIColor blackColor]CGColor];
	imgV.layer.borderWidth=1;
	
	// add to cart or remove from cart condition based button image setting code.
	UIButton *btn = (UIButton*)[cell viewWithTag:kCCell_Button];
	btn.selected=[self.arOfWatchesOfCart containsObject:dOfObj];
	
	// set the index of row into disabled property of button - as a trick. so we can access row-number on button tap.
	[btn setTitle:[NSString stringWithFormat:@"%i",indexPath.row] forState:UIControlStateDisabled];
	return cell;
}

- (void)CartTapped:(UIButton*)sender {
	// access the row number using the used trick
	NSUInteger index = [[sender titleForState:UIControlStateDisabled] integerValue];
	// obtain the object to be removed/added into cart array
	NSDictionary *obj = [self.arOfWatches objectAtIndex:index];
	// create indexpath
	NSIndexPath *ip = [NSIndexPath indexPathForRow:index inSection:0];
	
	// perform action
	if(sender.selected) {
		// remove selected array
		[self.arOfWatchesOfCart removeObject:obj];
		// update badge number
		[self reloadBadgeNumber];
	} else {
		// add into selected array
		[self.arOfWatchesOfCart addObject:obj];
		// perform add to cart animation
		[self addToCartTapped:ip];
	}
	// reload specific row with animation
	[self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (void)addToCartTapped:(NSIndexPath*)indexPath {
	// grab the cell using indexpath
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
	// grab the imageview using cell
	UIImageView *imgV = (UIImageView*)[cell viewWithTag:kCCell_Img];

	// get the exact location of image
	CGRect rect = [imgV.superview convertRect:imgV.frame fromView:nil];
	rect = CGRectMake(5, (rect.origin.y*-1)-10, imgV.frame.size.width, imgV.frame.size.height);
	NSLog(@"rect is %f,%f,%f,%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
	
	// create new duplicate image
	UIImageView *starView = [[UIImageView alloc] initWithImage:imgV.image];
    [starView setFrame:rect];
	starView.layer.cornerRadius=5;
	starView.layer.borderColor=[[UIColor blackColor]CGColor];
	starView.layer.borderWidth=1;
    [self.view addSubview:starView];
	
	// begin ---- apply position animation
	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration=0.65;
	pathAnimation.delegate=self;
	
	// tab-bar right side item frame-point = end point
	CGPoint endPoint = CGPointMake(210+rect.size.width/2, 390+rect.size.height/2);
	
	CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, starView.frame.origin.x, starView.frame.origin.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, starView.frame.origin.y, endPoint.x, starView.frame.origin.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
	// end ---- apply position animation
	
	// apply transform animation
	CABasicAnimation *basic=[CABasicAnimation animationWithKeyPath:@"transform"];
	[basic setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.25, 0.25, 0.25)]];
	[basic setAutoreverses:NO];
	[basic setDuration:0.65];
	
	[starView.layer addAnimation:pathAnimation forKey:@"curveAnimation"];
	[starView.layer addAnimation:basic forKey:@"transform"];
	
	[starView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.65];
	[self performSelector:@selector(reloadBadgeNumber) withObject:nil afterDelay:0.65];
}

// update the Badge number
- (void)reloadBadgeNumber {
	if(self.arOfWatchesOfCart.count) {
		self.tabItemCart.badgeValue=[NSString stringWithFormat:@"%i",self.arOfWatchesOfCart.count];
	} else {
		self.tabItemCart.badgeValue=nil;
	}
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
