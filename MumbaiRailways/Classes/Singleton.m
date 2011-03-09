    //
//  Singleton.m
//  MumbaiRailways
//
//  Created by Vidhya on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"
#import "StationsViewController.h"

@implementation Singleton

static Singleton *dataManager;

+(Singleton *)sharedInstance;{
	@synchronized(self){	
		if(dataManager==nil)
			
			dataManager=[[Singleton alloc]init];
	}
	return dataManager;
}
- (id)init {
    if ((self = [super init])) {
		NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"MumbaiRail" ofType:@"sqlite"];
        NSLog(@"got database");
        if (sqlite3_open([sqLiteDb UTF8String], &database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}
- (void)dealloc {
    sqlite3_close(database);
    [super dealloc];
}

-(NSArray *)trainStops
{
	NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];	
	NSString *query= @"SELECT StopName,StopNo FROM Stop";
	sqlite3_stmt *compiledStatement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compiledStatement, nil) == SQLITE_OK) {
		
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			char *stop=(char *)sqlite3_column_text(compiledStatement, 0);	
			NSString *stopName=[[NSString alloc] initWithUTF8String:stop];
			NSLog(@"%@",stopName);	
			int stopNo=sqlite3_column_int(compiledStatement, 1);
			NSLog(@"Stopnos are %d",stopNo);
			
		[retval addObject:stopName];
		}
        sqlite3_finalize(compiledStatement);
    }
    return retval;
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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



@end
