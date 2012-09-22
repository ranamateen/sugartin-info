//
//  MapkitDemoViewController.m
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "MapkitDemoViewController.h"

@implementation MapkitDemoViewController
@synthesize reports;
@synthesize nxtDetailsVCtr;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	// some static data for Google Pins
	
	NSDictionary *d1,*d2,*d3,*d4,*d5;
	
	// comments = title of pin
	
	// latitude & latitude are added
	
	// id is to access uniquely
	
	d1=[NSDictionary dictionaryWithObjectsAndKeys:@"Sagar",@"comments",@"1",@"id",@"23.02941395",@"latitude",@"72.54620655",@"longitude",nil];
	d2=[NSDictionary dictionaryWithObjectsAndKeys:@"Nimit",@"comments",@"2",@"id",@"23.028359049999995",@"latitude",@"72.54537318333334",@"longitude",nil];
	d3=[NSDictionary dictionaryWithObjectsAndKeys:@"Jaimin",@"comments",@"3",@"id",@"23.029545",@"latitude",@"72.546036",@"longitude",nil];
	d4=[NSDictionary dictionaryWithObjectsAndKeys:@"Samurai Jack",@"comments",@"4",@"id",@"23.030050",@"latitude",@"72.546226",@"longitude",nil];
	d5=[NSDictionary dictionaryWithObjectsAndKeys:@"XYZ",@"comments",@"5",@"id",@"23.030050",@"latitude",@"72.546022",@"longitude",nil];
	
	
	// adding data into array 
	
	self.reports=[NSArray arrayWithObjects:d1,d2,d3,d4,d5,nil];

	// code to add pins on map
	
	for (NSDictionary *d in self.reports) {
		float latitude=[[d valueForKey:@"latitude"] floatValue];
		float longitude=[[d valueForKey:@"longitude"] floatValue];
		
		Place* home = [[[Place alloc] init] autorelease];
		home.name = [d valueForKey:@"comments"];
		home.latitude = latitude;
		home.longitude = longitude;
		
		PlaceMark *from = [[[PlaceMark alloc] initWithPlace:home] autorelease];				
		[mapView addAnnotation:from];

	}
	
	// this method will zoom the map in such a way that all pins will display.
	
	[self centerMap];
}

-(void) centerMap 

{
	MKCoordinateRegion region;
	CLLocationDegrees maxLat = -90;
	CLLocationDegrees maxLon = -180;
	CLLocationDegrees minLat = 120;
	CLLocationDegrees minLon = 150;
	NSMutableArray *temp=[NSArray arrayWithArray:self.reports];
	NSLog(@"%@",temp);
	for (int i=0; i<[temp count];i++) {
		Place* home = [[[Place alloc] init] autorelease];
		home.latitude = [[[temp objectAtIndex:i] valueForKey:@"latitude"]floatValue];
		home.longitude =[[[temp objectAtIndex:i] valueForKey:@"longitude"]floatValue];
		
		PlaceMark* from = [[[PlaceMark alloc] initWithPlace:home] autorelease];		
		
		CLLocation* currentLocation = (CLLocation*)from ;
		if(currentLocation.coordinate.latitude > maxLat)
			maxLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.latitude < minLat)
			minLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.longitude > maxLon)
			maxLon = currentLocation.coordinate.longitude;
		if(currentLocation.coordinate.longitude < minLon)
			minLon = currentLocation.coordinate.longitude;
		
		region.center.latitude     = (maxLat + minLat) / 2;
		region.center.longitude    = (maxLon + minLon) / 2;
		region.span.latitudeDelta  =  maxLat - minLat;
		region.span.longitudeDelta = maxLon - minLon;
	}
	[mapView setRegion:region animated:YES];
	
}
- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSLog(@"Controll comes here");
	
	if (annotation == mapView.userLocation) 
		return nil;
	
	MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"asdf"];
	
	if (pin == nil)
		pin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: @"asdf"] autorelease];
	else
		pin.annotation = annotation;
	pin.userInteractionEnabled = YES;
	UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure]; 
	[disclosureButton setFrame:CGRectMake(0, 0, 30, 30)];
	
	pin.rightCalloutAccessoryView = disclosureButton;
	pin.pinColor = MKPinAnnotationColorRed;
	//pin.animatesDrop = YES;
	[pin setEnabled:YES];
	[pin setCanShowCallout:YES];
	return pin;
	
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	NSString *strTitle = [NSString stringWithFormat:@"%@",[view.annotation title]];
	NSMutableDictionary *d;
	NSMutableArray *temp=[NSArray arrayWithArray:self.reports];

//	NSArray *temp=[NSArray arrayWithArray:[NSArray arrayWithArray:[reports objectAtIndex:0]]];
	for (int i = 0; i<[temp count]; i++)
	{
		d = (NSMutableDictionary*)[temp objectAtIndex:i];
		NSString *strAddress = [NSString stringWithFormat:@"%@",[d valueForKey:@"comments"]];
		
		if([strAddress isEqualToString:strTitle]) {
			[self presentModalViewController:self.nxtDetailsVCtr animated:YES];
			[self.nxtDetailsVCtr.lblDetail setText:strAddress];		
			break;
		}
		
		
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[self setNxtDetailsVCtr:nil];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[nxtDetailsVCtr release];
    [super dealloc];
}

@end
