//
//  ViewController.m
//  AddToContacts
//
//  Created by Spark on 26/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize lblName;
@synthesize lblAddress;
@synthesize lblPhone;
@synthesize lblEmail;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setLblName:nil];
    [self setLblAddress:nil];
    [self setLblPhone:nil];
    [self setLblEmail:nil];
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
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnAddToContactsTapped:(id)sender {
    CFErrorRef error = NULL; 
    // create addressBook
    ABAddressBookRef iPhoneAddressBook = ABAddressBookCreate();
    
    
    //// Creating a person
    // create a new person --------------------
    ABRecordRef newPerson = ABPersonCreate();
    // set the first name for person
    ABRecordSetValue(newPerson, kABPersonFirstNameProperty, self.lblName.text, &error);
    // set the last name
    ABRecordSetValue(newPerson, kABPersonLastNameProperty, @"SugarTin.info", &error);
    // set the company name
    ABRecordSetValue(newPerson, kABPersonOrganizationProperty, @"Apple Inc.", &error);
    // set the job-title 
    ABRecordSetValue(newPerson, kABPersonJobTitleProperty, @"Senior Developer", &error);
    // --------------------------------------------------------------------------------
    
    
    //// Adding Phone details
    // create a new phone --------------------
    ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    // set the main phone number
    ABMultiValueAddValueAndLabel(multiPhone, @"1-555-555-5555", kABPersonPhoneMainLabel, NULL);
    // set the mobile number
    ABMultiValueAddValueAndLabel(multiPhone, @"1-123-456-7890", kABPersonPhoneMobileLabel, NULL);            
    // set the other number
    ABMultiValueAddValueAndLabel(multiPhone, @"1-987-654-3210", kABOtherLabel, NULL);        
    // add phone details to person
    ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone,nil);
    // release phone object
    CFRelease(multiPhone);
    // --------------------------------------------------------------------------------
    
    
    //// Adding email details
    // create new email-ref
    ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    // set the work mail
    ABMultiValueAddValueAndLabel(multiEmail, @"johndoe@modelmetrics.com", kABWorkLabel, NULL);
    // add the mail to person
    ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail, &error);
    // release mail object
    CFRelease(multiEmail);
    // --------------------------------------------------------------------------------
    
    
    //// adding address details
    // create address object
    ABMutableMultiValueRef multiAddress = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
    // create a new dictionary
    NSMutableDictionary *addressDictionary = [[NSMutableDictionary alloc] init];
    // set the address line to new dictionary object
    [addressDictionary setObject:@"Some Complete Address" forKey:(NSString *) kABPersonAddressStreetKey];
    // set the city to new dictionary object
    [addressDictionary setObject:@"Bengaluru" forKey:(NSString *)kABPersonAddressCityKey];
    // set the state to new dictionary object
    [addressDictionary setObject:@"Karnataka" forKey:(NSString *)kABPersonAddressStateKey];
    // set the zip/pin to new dictionary object
    [addressDictionary setObject:@"560068 " forKey:(NSString *)kABPersonAddressZIPKey];
    // retain the dictionary
    CFTypeRef ctr = CFBridgingRetain(addressDictionary);
    // copy all key-values from ctr to Address object
    ABMultiValueAddValueAndLabel(multiAddress,ctr, kABWorkLabel, NULL);
    // add address object to person
    ABRecordSetValue(newPerson, kABPersonAddressProperty, multiAddress,&error);
    // release address object
    CFRelease(multiAddress);
    // --------------------------------------------------------------------------------
    
    //// adding entry to contact-book
    // add person to addressbook
    ABAddressBookAddRecord(iPhoneAddressBook, newPerson, &error);
    // save/commit entry 
    ABAddressBookSave(iPhoneAddressBook, &error);
    
    if (error != NULL) {
        NSLog(@"Kaa boom ! couldn't save");
    }    
}

@end
