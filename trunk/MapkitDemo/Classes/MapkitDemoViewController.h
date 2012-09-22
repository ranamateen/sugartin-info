//
//  MapkitDemoViewController.h
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Place.h"
#import "PlaceMark.h"
#import "DetailVCtr.h"

@interface MapkitDemoViewController : UIViewController<MKMapViewDelegate> {
	IBOutlet MKMapView* mapView;
	NSMutableArray *reports;
	DetailVCtr *nxtDetailsVCtr;
}
@property(nonatomic,retain)NSMutableArray *reports;
@property (nonatomic, retain) IBOutlet DetailVCtr *nxtDetailsVCtr;

-(void) centerMap;
@end

