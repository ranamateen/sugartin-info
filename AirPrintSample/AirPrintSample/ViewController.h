//
//  ViewController.h
//  AirPrintSample
//
//  Created by Neon Spark on 2/1/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

// add the appropriate delegate 
@interface ViewController : UIViewController <UIPrintInteractionControllerDelegate> {
    // have an instance varialbe for accessing printInteraction
    UIPrintInteractionController *printController;
}

// an imageView from which we will obtain data of an image
@property (nonatomic, strong) IBOutlet UIImageView *imgV;

// a barButton from which - popOver will Appear
@property (nonatomic, strong) IBOutlet UIBarButtonItem *item;

// an action which will get triggerd by tapping on BarButton
-(IBAction)btnPrintTapped:(id)sender;

// a general method which will print the data supplied
-(void)printItem :(NSData*)data ;

@end
