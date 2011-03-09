//
//  FinalDisplayViewController.h
//  MumbaiRailways
//
//  Created by Aneesha Mathew on 3/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalDisplayViewController : UIViewController {
	NSArray *finalTrainSpeeds;
	NSArray *finalTrainDestination;
	NSArray *finalTrainTime;
}
@property(nonatomic,retain) NSArray *finalTrainSpeeds;
@property(nonatomic,retain) NSArray *finalTrainDestination;
@property(nonatomic,retain) NSArray *finalTrainTime;

-(id)initWithTrainSpeed:(NSMutableArray*)TrainSpeed TrainDestination:(NSMutableArray*)TrainDestination TrainTime:(NSMutableArray*)TrainTime  ;

@end
