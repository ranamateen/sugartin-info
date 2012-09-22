//
//  ActionSheetViewController.h
//  ActionSheet
//
//  Created by Sagar R. Kothari
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetViewController : UIViewController<UIActionSheetDelegate> {
	IBOutlet UIToolbar *tBar;
	IBOutlet UILabel *lblSelect;
	IBOutlet UIPickerView *pkrMain;
	UIActionSheet *act;
	NSArray *ar;
}
-(IBAction)btnTapped:(id)sender;
-(IBAction)btnBack:(id)sender;
@end

