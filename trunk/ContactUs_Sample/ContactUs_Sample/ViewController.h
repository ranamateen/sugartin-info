//
//  ViewController.h
//  ContactUs_Sample
//
//  Created by Neon Spark on 2/2/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
 
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

-(void)launchMailAppOnDevice ;

-(void)btnPhoneTapped ;
-(void)btnEmailTapped;
-(void)btnWebTapped ;
-(void)btnMapTapped ;

@end
