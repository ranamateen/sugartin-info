//
//  RootViewController.m
//  PostMultipleImages
//
//  Created by Sagar R. Kothari on 10/07/11.
//  Copyright http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
	
	NSMutableArray *arrImages;
	IBOutlet UIButton *btnImage1;
	IBOutlet UIButton *btnImage2;
	IBOutlet UIButton *btnImage3;
	IBOutlet UIButton *btnImage4;
}

- (IBAction)btnTakePicture_Clicked:(id)sender;
- (IBAction)btnPostImages_Clicked:(id)sender;
@end
