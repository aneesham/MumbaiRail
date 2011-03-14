    //
//  Singleton.m
//  MumbaiRailways
//
//  Created by Vidhya on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"
#import "StationsViewController.h"
#include "FinalDisplayViewController.h"
#include "TrainInfo.h"

@implementation Singleton

static Singleton *dataManager;

+(Singleton *)sharedInstance{
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
	NSString *query= @"SELECT StopName FROM Stop";
	sqlite3_stmt *compiledStatement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compiledStatement, nil) == SQLITE_OK) {
		
		while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
			char *stop=(char *)sqlite3_column_text(compiledStatement, 0);	
			NSString *stopName=[[NSString alloc] initWithUTF8String:stop];
			NSLog(@"%@",stopName);
			[retval addObject:stopName];
		}
        sqlite3_finalize(compiledStatement);
    }
    return retval;
}

-(NSArray *)dataFromDatabase:(NSString *)stationName
{
	NSLog(@"method called");
	NSString *stationN = stationName;
	NSLog(@"The selected Station Name is: %@",stationN);
	NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];	
	NSString *query = [NSString stringWithFormat:@"SELECT TrainSpeed, Destination, TrainAndStop.Time FROM Train JOIN TrainAndStop ON Train.TrainNo=TrainAndStop.TrainNo AND TrainAndStop.StopNo = (SELECT Stop.StopNo FROM Stop WHERE Stop.StopName=\"%@\") ",stationName];
	sqlite3_stmt *statement;
	
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) 
		== SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
			char *speedT  = (char*) sqlite3_column_text(statement, 0);
			char *destinationT = (char *) sqlite3_column_text(statement, 1);
			float timeT = sqlite3_column_double(statement, 2);
			
            NSString *destination = [[NSString alloc] initWithUTF8String:destinationT];
            NSString *speed = [[NSString alloc] initWithUTF8String:speedT];
            TrainInfo *info = [[TrainInfo alloc]initWithTime:timeT andTrainDestination:destination andtrainSpeed:speed];
			NSLog(@"Entered method. Traininfo  line");						                        
            [retval addObject:info];
            [destination release];
            [speed release];
			[info release];
		}
		sqlite3_finalize(statement);
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
