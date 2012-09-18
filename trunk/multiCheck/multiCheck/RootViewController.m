//
//  RootViewController.m
//  multiCheck
//
//  Created by Sagar Kothari on 08/07/11.
//  Copyright 2011 Magic Soft. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize arForTable = _arForTable;
@synthesize arForIPs = _arForIPs;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.arForTable=[NSArray arrayWithObjects:@"Object-One",@"Object-Two",@"Object-Three",@"Object-Four",@"Object-Five", nil];
	self.arForIPs=[NSMutableArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.arForTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	if([self.arForIPs containsObject:indexPath]){
		[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	} else {
		[cell setAccessoryType:UITableViewCellAccessoryNone];
	}
	cell.textLabel.text=[self.arForTable objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if([self.arForIPs containsObject:indexPath]){
		[self.arForIPs removeObject:indexPath];
	} else {
		[self.arForIPs addObject:indexPath];
	}
	[tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}

@end
