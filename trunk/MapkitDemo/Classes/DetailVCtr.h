//
//  DetailVCtr.h
//  MapkitDemo
//
//  Created by Sagar R. Kothari on 04/08/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVCtr : UIViewController {
	UILabel *lblDetail;
}

- (IBAction)btnBackTapped:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *lblDetail;

@end
