//
//  ViewController.h
//  AirPrintSample
//
//  Created by Neon Spark on 2/1/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPrintInteractionControllerDelegate> {
    UIPrintInteractionController *printController;
}

@property (nonatomic, strong) IBOutlet UIImageView *imgV;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *item;

-(IBAction)btnPrintTapped:(id)sender;
-(void)printItem :(NSData*)data ;

@end
