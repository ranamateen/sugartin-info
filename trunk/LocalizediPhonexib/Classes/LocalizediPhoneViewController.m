//
//  LocalizediPhoneViewController.m
//  LocalizediPhone
//
//  Created by Sagar R. Kothari  on 09/05/09.
//  Copyright http://sugartin.info 2009. All rights reserved.
//

#import "LocalizediPhoneViewController.h"

@implementation LocalizediPhoneViewController

- (void)viewDidLoad {
	NSLocale *locale = [NSLocale currentLocale];
    NSString *titleOFApplication = [locale displayNameForKey:NSLocaleIdentifier value:[locale localeIdentifier]];
    self.title = titleOFApplication;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    [super dealloc];
}

@end
