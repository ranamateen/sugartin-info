//
//  ActionSheetViewController.m
//  ActionSheet
//
//  Created by Sagar R. Kothari
//  Copyright http://sugartin.info 2011. All rights reserved.
//

#import "ActionSheetViewController.h"

@implementation ActionSheetViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	ar=[[NSArray alloc] initWithObjects:@"Sagar Kothari",@"Nimit parekh",@"Sagar Joshi",@"Yash Patel",nil];
	//[act addSubview:pkrMain];
	act=[[UIActionSheet alloc] initWithTitle:@"Hello" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:@"Cancel" otherButtonTitles:@"sagar",@"Video",nil];
}
-(IBAction)btnTapped:(id)sender{
	[act showInView:self.view];
}
-(IBAction)btnBack:(id)sender{
	[act dismissWithClickedButtonIndex:0 animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

	// e.g. self.myOutlet = nil;
}

//================================================================================================
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return [ar count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [ar objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	lblSelect.text=[ar objectAtIndex:row];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//	NSLog(@"%i tapped",buttonIndex);
//	NSLog(@"button tapped index is %i",buttonIndex);
	NSString *str=[NSString stringWithFormat:@"You select index is ::>>%i",buttonIndex];
	NSLog(@"%@",str);
}
//==================================================================================================

- (void)dealloc {
    [super dealloc];
}

@end
