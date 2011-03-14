//
//  FinalDisplayViewController.h
//  MumbaiRailways
//
//  Created by Aneesha Mathew on 3/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalDisplayViewController : UIViewController <UITableViewDelegate, UITableViewDelegate>{
	NSArray *trainInfos;
	IBOutlet UITableView *timeTable;
}
@property(nonatomic,retain)NSArray *trainInfos;



@end
