//
//  ViewController.m
//  BatteryLevel
//
//  Created by sagar kothari on 17/03/12.
//  Copyright (c) 2012 navgujarat. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize lbl1 = _lbl1;
@synthesize lbl2 = _lbl2;
@synthesize lbl3 = _lbl3;
@synthesize lbl4 = _lbl4;
@synthesize lbl5 = _lbl5;
@synthesize lbl6 = _lbl6;
@synthesize lbl7 = _lbl7;
@synthesize lbl8 = _lbl8;
@synthesize lbl9 = _lbl9;
@synthesize lbl10 = _lbl10;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // tell the device that - my application is going to monitor Device Battery levels
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    
    // schedule a timer to update the battery details
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateBatteryDetails) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setLbl1:nil];
    [self setLbl2:nil];
    [self setLbl3:nil];
    [self setLbl4:nil];
    [self setLbl5:nil];
    [self setLbl6:nil];
    [self setLbl7:nil];
    [self setLbl8:nil];
    [self setLbl9:nil];
    [self setLbl10:nil];
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
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

// scheduler
- (void)updateBatteryDetails {
    // obtain the battery details
    CGFloat value = [[UIDevice currentDevice] batteryLevel];
    
    // value is from 0.0 to 1.0 
    // if value is nagitive then its either in charge mode or its iOS Simulator
    NSLog(@"bat values is %f",value);
    
    NSInteger valueToPut = value*10;
    self.lbl1.hidden=YES;
    self.lbl2.hidden=YES;
    self.lbl3.hidden=YES;
    self.lbl4.hidden=YES;
    self.lbl5.hidden=YES;
    self.lbl6.hidden=YES;
    self.lbl7.hidden=YES;
    self.lbl8.hidden=YES;
    self.lbl9.hidden=YES;
    self.lbl10.hidden=YES;
    
    switch (valueToPut) {
        case 0:
            break;
        case 1:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=YES;
            self.lbl6.hidden=YES;
            self.lbl7.hidden=YES;
            self.lbl8.hidden=YES;
            self.lbl9.hidden=YES;
            self.lbl10.hidden=NO;
            break;
        case 2:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=YES;
            self.lbl6.hidden=YES;
            self.lbl7.hidden=YES;
            self.lbl8.hidden=YES;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 3:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=YES;
            self.lbl6.hidden=YES;
            self.lbl7.hidden=YES;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 4:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=YES;
            self.lbl6.hidden=YES;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 5:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=YES;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 6:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=YES;
            self.lbl5.hidden=NO;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 7:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=YES;
            self.lbl4.hidden=NO;
            self.lbl5.hidden=NO;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 8:
            self.lbl1.hidden=YES;
            self.lbl2.hidden=YES;
            self.lbl3.hidden=NO;
            self.lbl4.hidden=NO;
            self.lbl5.hidden=NO;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 9: 
            self.lbl1.hidden=YES;
            self.lbl2.hidden=NO;
            self.lbl3.hidden=NO;
            self.lbl4.hidden=NO;
            self.lbl5.hidden=NO;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        case 10: 
            self.lbl1.hidden=NO;
            self.lbl2.hidden=NO;
            self.lbl3.hidden=NO;
            self.lbl4.hidden=NO;
            self.lbl5.hidden=NO;
            self.lbl6.hidden=NO;
            self.lbl7.hidden=NO;
            self.lbl8.hidden=NO;
            self.lbl9.hidden=NO;
            self.lbl10.hidden=NO;
            break;
        default:
            break;
    }
}

@end
