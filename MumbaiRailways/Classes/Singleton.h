//
//  Singleton.h
//  MumbaiRailways
//
//  Created by Vidhya on 3/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface Singleton : UIViewController {
	
		sqlite3 *database;
}
+(Singleton *)sharedInstance;
-(NSArray *)trainStops;
-(NSArray *)dataFromDatabase:(NSString *)stationName;
@end
