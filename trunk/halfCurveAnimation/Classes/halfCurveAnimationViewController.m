//
//  halfCurveAnimationViewController.m
//  halfCurveAnimation
//
//  Created by Sagar R. Kothari on 21/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "halfCurveAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation halfCurveAnimationViewController
@synthesize mapView;

- (void)viewDidLoad {
	locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [locationManager startUpdatingLocation];
	
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    MKReverseGeocoder *geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
    geoCoder.delegate = self;
    [geoCoder start];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
	NSLog(@"locationManager:%@ didFailWithError:%@", manager, error);
}
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    MKPlacemark * myPlacemark = placemark;
    // with the placemark you can now retrieve the city name
	NSLog(@"%@",myPlacemark);

   //NSString *city = [myPlacemark.addressDictionary objectForKey:(NSString*) kABPersonAddressCityKey];
}


- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"reverseGeocoder:%@ didFailWithError:%@", geocoder, error);
}
-(void)viewWillAppear:(BOOL)animated{
	self.title=@"Half Curl Sample";
}
-(IBAction)btnTappedForCurl:(id)sender{
	[self performCurl];
}
-(void)performCurl{
	
	CATransition *animation = [CATransition animation];
	[animation setDelegate:self]; [animation setDuration:1.00];
	[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
	
	if (!curled){
		animation.type = @"pageCurl"; 
		animation.fillMode = kCAFillModeForwards;
		animation.endProgress = 0.50; 
    }
	
	[animation setRemovedOnCompletion:NO];
	
	[[self view] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[[[self view] layer] addAnimation:animation forKey:@"pageCurlAnimation"];
	
	curled = !curled;
}

-(IBAction)btnPressed:(id)sender{

	NSLog(@"Button is pressed..");
	CATransition *animation = [CATransition animation];
	[animation setDelegate:self]; [animation setDuration:1.00];
	[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
	self.mapView.mapType = MKMapTypeSatellite;
	animation.type = @"pageUnCurl"; 
	animation.fillMode = kCAFillModeBackwards;
	animation.startProgress = 0.55; 
	[animation setRemovedOnCompletion:NO];
	[[self view] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[[[self view] layer] addAnimation:animation forKey:@"pageCurlAnimation"];
	
	curled = !curled;

}
-(IBAction)btnPressed1:(id)sender{
	
	CATransition *animation = [CATransition animation];
	[animation setDelegate:self]; [animation setDuration:1.00];
	[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
	self.mapView.mapType = MKMapTypeStandard;
	animation.type = @"pageUnCurl"; 
	animation.fillMode = kCAFillModeBackwards;
	animation.startProgress = 0.55; 
	[animation setRemovedOnCompletion:NO];
	[[self view] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[[[self view] layer] addAnimation:animation forKey:@"pageCurlAnimation"];
	
	curled = !curled;
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[locationManager release];
    [super dealloc];
}

@end
