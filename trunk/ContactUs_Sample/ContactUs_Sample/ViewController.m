//
//  ViewController.m
//  ContactUs_Sample
//
//  Created by Neon Spark on 2/2/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize lblName;
@synthesize lblAddress;
@synthesize lblPhone;
@synthesize lblEmail;
@synthesize tblView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tblView.layer.cornerRadius=5;
    self.tblView.clipsToBounds=YES;
    self.tblView.layer.borderColor=[[UIColor blackColor]CGColor];
    self.tblView.layer.borderWidth=1;
}

- (void)viewDidUnload
{
    [self setLblName:nil];
    [self setLblAddress:nil];
    [self setLblPhone:nil];
    [self setLblEmail:nil];
    [self setTblView:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return ( (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) || (interfaceOrientation == UIInterfaceOrientationPortrait) );
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Open Webpage";
            break;
        case 1:
            cell.textLabel.text=@"Open Map";
            break;
        case 2:
            cell.textLabel.text=@"Make a Phone call";
            break;
        case 3:
            cell.textLabel.text=@"Email";
            break;
        case 4:
            cell.textLabel.text=@"Add to contacts";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self btnWebTapped];
            break;
        case 1:
            [self btnMapTapped];
            break;
        case 2:
            [self btnPhoneTapped];
            break;
        case 3:
            [self btnEmailTapped];
            break;
        case 4:
            break;
        default:
            break;
    }
}

#define callMsg @"Do you want to make call to "

-(void) btnPhoneTapped {
    NSString *str=lblPhone.text;
    str=[str stringByReplacingOccurrencesOfString:@"Tele : " withString:@""];
    if([str length]>0) {
        UIAlertView *av=[[UIAlertView alloc] initWithTitle:@"Message" message:[NSString stringWithFormat:@"%@%@",callMsg,str] delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [av show];   
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex==0 && [[alertView message] hasPrefix:callMsg]) {
        NSString *str=[alertView message];
        str=[str stringByReplacingOccurrencesOfString:callMsg withString:@""];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",str]]];
    }
}

-(void)btnEmailTapped {
    NSString *str=self.lblEmail.text;
    str=[str stringByReplacingOccurrencesOfString:@"Email : " withString:@""];
    if([str length]>0) {
        Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
        if (mailClass != nil) {
            if ([mailClass canSendMail]){
                MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
                picker.mailComposeDelegate = self;
                [picker setSubject:@"An email from SugarTin.info - Sample App"];
                [picker setToRecipients:[NSArray arrayWithObject:str]];
                NSString *emailBody = @"An email using SugarTin.info - Sample app.";
                [picker setMessageBody:emailBody isHTML:NO];
                [self presentModalViewController:picker animated:YES];  
            } else {
                [self launchMailAppOnDevice];
            }
        } else {
            [self launchMailAppOnDevice];   
        }   
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error  {
    [controller dismissModalViewControllerAnimated:YES];
}


-(void)launchMailAppOnDevice {
    UIAlertView *avx=[[UIAlertView alloc] initWithTitle:@"Message" message:@"Mail composer not available." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [avx show];
}

-(void)btnWebTapped {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.apple.com"]];
}

-(void)btnMapTapped {
    NSString *str=[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",self.lblAddress];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

@end
