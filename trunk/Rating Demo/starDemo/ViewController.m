//
//  ViewController.m
//  starDemo
//
//  Created by Spark on 13/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize tableView = _tableView;
@synthesize listOfItems = _listOfItems;
@synthesize nxtSetStarz = _nxtSetStarz;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.listOfItems = [NSMutableArray array];
    [self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Vad tycker du?",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
    [self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Picnicvänlig",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
	[self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Barnvänlig",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
	[self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Brännbollsvänlig",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
	[self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Badvänlig",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
    [self.listOfItems addObject:
     [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Handikappvänlig",@"title",[NSNumber numberWithInt:0],@"rating", nil]
     ];
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setNxtSetStarz:nil];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.listOfItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCell" owner:self options:nil] objectAtIndex:0];
	}
    NSDictionary *dToAccess = [self.listOfItems objectAtIndex:indexPath.row];
    [(UILabel*)[cell viewWithTag:1] setText:[dToAccess valueForKey:@"title"]];
    NSUInteger intVal = [[dToAccess valueForKey:@"rating"] integerValue];
    switch (intVal) {
        case 0:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"0star.png"]];
            break;
        case 1:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"1star.png"]];
            break;
        case 2:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"2star.png"]];
            break;
        case 3:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"3star.png"]];
            break;
        case 4:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"4star.png"]];
            break;
        case 5:
            [(UIImageView*)[cell viewWithTag:2] setImage:[UIImage imageNamed:@"5star.png"]];
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.nxtSetStarz.dToAccess = [self.listOfItems objectAtIndex:indexPath.row];
    [self presentModalViewController:self.nxtSetStarz animated:YES];
}
    

@end

