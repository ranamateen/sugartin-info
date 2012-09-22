//
//  faceBookDemoAppDelegate.m
//  faceBookDemo
//
//  Created by Sagar R. Kothari on 18/07/11.
//  Copyright 2011 http://sugartin.info. All rights reserved.
//

#import "faceBookDemoAppDelegate.h"

static NSString* kAppId = @"104051569693502";
#define KFBAccessToken		@"104051569693502"
#define KFBExpirationDate	@"KFBExpirationDate"


@implementation faceBookDemoAppDelegate
@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	_permissions =  [[NSArray arrayWithObjects:@"read_stream", @"publish_stream", @"offline_access",nil] retain];
	_facebook = [[Facebook alloc] initWithAppId:kAppId];	
	UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btn setFrame:CGRectMake(0, 0, 200, 200)];
	[btn setTitle:@"Share on facebook" forState:UIControlStateNormal];
	[btn setCenter:self.window.center];
	[btn addTarget:self action:@selector(shareTapped:) forControlEvents:UIControlEventTouchDown];
	[self.window addSubview:btn];
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	return [_facebook handleOpenURL:url];
}

- (void)login {
	[_facebook authorize:_permissions delegate:self];
}

- (void)logout {
	[_facebook logout:self];
}

- (void)fbDidLogin{
	[[NSUserDefaults standardUserDefaults] setObject:_facebook.accessToken forKey:KFBAccessToken];
	[[NSUserDefaults standardUserDefaults] setObject:_facebook.expirationDate forKey:KFBExpirationDate];
	[[NSUserDefaults standardUserDefaults] synchronize];	
}

-(void)fbDidNotLogin:(BOOL)cancelled {
	[[NSUserDefaults standardUserDefaults] setObject:nil forKey:KFBAccessToken];
	[[NSUserDefaults standardUserDefaults] setObject:nil forKey:KFBExpirationDate];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)fbDidLogout {
	
}

- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"received response");
}

- (void)request:(FBRequest *)request didLoad:(id)result {
	if ([result isKindOfClass:[NSArray class]]) {
		result = [result objectAtIndex:0];
	}
};

- (void)request:(FBRequest *)request didFailWithError:(NSError *)error {
	
};

- (void)dialogDidComplete:(FBDialog *)dialog {
	
}

- (void)dialogCompleteWithUrl:(NSURL *)url{
	NSLog(@"%@",url);
	NSLog(@"Here in Dialog complete");
	if([[url description] hasPrefix:@"fbconnect://success?error_code="]){
		
	} else {
		UIAlertView *avx=[[[UIAlertView alloc] initWithTitle:@"Share via Facebook"
													 message:@"Details successfully posted to your wall."
													delegate:self
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:nil] autorelease];
		[avx show];
	}
}

- (void)dialogDidNotCompleteWithUrl:(NSURL *)url{
	NSLog(@"Here in Dialog did not complete with URL.");
}

- (void)dialogDidNotComplete:(FBDialog *)dialog{
	NSLog(@"Here in Dialog did not complete.");
}

- (void)dialog:(FBDialog*)dialog didFailWithError:(NSError *)error{
	NSLog(@"Dilog got an error :) .");
	UIAlertView *avx=[[[UIAlertView alloc] initWithTitle:@"Oh dear! We ran into a problem."
												 message:@"Sorry, there is no network connection. Please check your network and try again."
												delegate:self
									   cancelButtonTitle:@"OK"
									   otherButtonTitles:nil] autorelease];
	[avx show];
}


-(void)sharewithFacebook:(id)sender
{
	
	SBJSON *jsonWriter = [[SBJSON new] autorelease];
	
	NSDictionary* actionLinks = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:
														   @"sugartin",@"text",@"http://www.sugartin.info/",@"href", nil], nil];
	
	NSString *actionLinksStr = [jsonWriter stringWithObject:actionLinks];
	
	NSDictionary* attachment = [NSDictionary dictionaryWithObjectsAndKeys:
								@"Sagar Kothari", @"name",
								@"Caption value to set here.", @"caption",
								@"One can add description of the post here.", @"description",
								@"http://www.sugartin.info/?post=312", @"href", nil];
	
	NSString *attachmentStr = [jsonWriter stringWithObject:attachment];
	
	NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								   @"Share on Facebook",  @"user_message_prompt",
								   actionLinksStr, @"action_links",
								   attachmentStr, @"attachment",
								   nil];
	
	[_facebook dialog:@"stream.publish"
			andParams:params
		  andDelegate:self];
}

-(void)shareTapped:(id)sender
{
	if ([_facebook isSessionValid]) {
		[self sharewithFacebook:nil];
	} else {
		[self login];
	}
}


- (void)dealloc
{
	[_window release];
    [super dealloc];
}

@end
