//
//  TrainInfo.m
//  DatabaseEg
//
//  Created by Aneesha Mathew on 3/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrainInfo.h"

@implementation TrainInfo

@synthesize trainSpeed, trainDestination, trainTime;

-(id)initWithTime:(float)trainT andTrainDestination:(NSString*)trainD andtrainSpeed:(NSString*)trainS
{
	if ((self = [super init]))
	{
		NSLog(@"Entered method2");
		self.trainTime = trainT;
		self.trainDestination = trainD;
		self.trainSpeed = trainS;
		NSLog(@"Entered method2");

	}
	return self;
}





@end
