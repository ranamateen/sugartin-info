//
//  halfCurveAnimationViewController.h
//  halfCurveAnimation
//
//  Created by Sagar R. Kothari on 21/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
 #import <CoreLocation/CoreLocation.h>
@interface halfCurveAnimationViewController : UIViewController <CLLocationManagerDelegate,MKReverseGeocoderDelegate>{

	IBOutlet MKMapView *mapView;
	IBOutlet UIImageView *img2; // front
	CLLocationManager *locationManager;
	BOOL curled;

}
@property(nonatomic,retain)IBOutlet MKMapView *mapView;
-(IBAction)btnTappedForCurl:(id)sender;
-(IBAction)btnPressed1:(id)sender;
-(IBAction)btnPressed:(id)sender;
-(void)performCurl;
@end

