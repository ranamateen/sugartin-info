//
//  CheckBoxViewController.m
//  CheckBox
//
//  Created by Sagar R. Kothari on 07/07/11.
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "CheckBoxViewController.h"

@implementation CheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)btnTapped:(id)sender
{
	[(UIButton*)sender setSelected:![(UIButton*)sender isSelected]];
}

@end
