    //
//  SecondViewController.m
//  MumbaiRailways
//
//  Created by Vidhya on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#import "StationsViewController.h"
@implementation SecondViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/
-(IBAction)moveToStationsView:(id)sender
{
	StationsViewController *stationView=[[StationsViewController alloc]initWithNibName:@"StationsView" bundle:nil];
	[self.navigationController pushViewController:stationView animated:YES];
	[stationView release];
 }

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
