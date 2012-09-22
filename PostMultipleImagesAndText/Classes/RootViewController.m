//
//  RootViewController.m
//  PostMultipleImages
//
//  Created by Sagar R. Kothari on 10/07/11.
//  Copyright http://sugartin.info. All rights reserved.
//

#import "RootViewController.h"
#import "ASIFormDataRequest.h"

@implementation RootViewController
int intButton;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Select Images";
    arrImages = [[NSMutableArray alloc]init];
}

- (IBAction)btnTakePicture_Clicked:(id)sender
{
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Image from..." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Image Gallary", nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	actionSheet.alpha=0.90;
	actionSheet.tag = 1;
	[actionSheet showInView:self.view]; 
	[actionSheet release];
	UIButton *btn = (UIButton *)sender;
	intButton = btn.tag;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (actionSheet.tag) 
	{
		case 1:
			switch (buttonIndex)
		{
			case 0:
			{				
#if TARGET_IPHONE_SIMULATOR
				
				UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Camera not available." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
				[alert release];
				
#elif TARGET_OS_IPHONE	
				
				UIImagePickerController *picker = [[UIImagePickerController alloc] init];  
				picker.sourceType = UIImagePickerControllerSourceTypeCamera;  
				picker.delegate = self;  
				//picker.allowsEditing = YES;  
				[self presentModalViewController:picker animated:YES];
				[picker release];
				
#endif	
			}
				break;
			case 1:
			{
				UIImagePickerController *picker = [[UIImagePickerController alloc] init];  
				picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;  
				picker.delegate = self;  
				[self presentModalViewController:picker animated:YES];
				[picker release];
			}
				break;
		}
			break;
			
		default:
			break;
	}	
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
	NSData *dataImage = UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"],1);
	UIImage *img = [[UIImage alloc] initWithData:dataImage];

	if (intButton == 1) {
		[btnImage1 setBackgroundImage:img forState:UIControlStateNormal];
		[btnImage1 setImage:nil forState:UIControlStateNormal];
	}
	else if (intButton == 2) {
		[btnImage2 setBackgroundImage:img forState:UIControlStateNormal];
		[btnImage2 setImage:nil forState:UIControlStateNormal];
	}
	else if (intButton == 3) {
		[btnImage3 setBackgroundImage:img forState:UIControlStateNormal];
		[btnImage3 setImage:nil forState:UIControlStateNormal];
	}
	else {
		[btnImage4 setBackgroundImage:img forState:UIControlStateNormal];
		[btnImage4 setImage:nil forState:UIControlStateNormal];
	}
	[arrImages addObject:dataImage];
	[picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	
	[self.navigationController dismissModalViewControllerAnimated:YES];	
}

- (IBAction)btnPostImages_Clicked:(id)sender {
	
	if ([arrImages count] > 0) {
		NSString *strURL = @"Write Your URL Here.";//Here Write down the multiple file uploading url
		ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
		[request setDelegate:self];
		[request setPostValue:@"This is sample text..." forKey:@"text"];//Here write down the text which will be sent.
		for (int i = 0; i < [arrImages count]; i++) {
			[request addData:[arrImages objectAtIndex:i] withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d", i + 1]];
		}	
		[request startAsynchronous];
	}
	else {
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Please select images..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	
	NSString *receivedString = [request responseString];
		NSLog(@"%@",request);	
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message" message:receivedString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
}
- (void)requestFailed:(ASIHTTPRequest *)request {
	
	NSString *receivedString = [request responseString];

	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message" message:receivedString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

