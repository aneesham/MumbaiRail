//
//  TrainInfo.h
//  DatabaseEg
//
//  Created by Aneesha Mathew on 3/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TrainInfo : NSObject {
	NSString *trainSpeed;
	NSString *trainDestination;
	float trainTime;
}
@property(nonatomic,copy) NSString *trainSpeed;
@property(nonatomic,copy) NSString *trainDestination;
@property(nonatomic,assign) float trainTime;

-(id)initWithTime:(float)trainT andTrainDestination:(NSString*)trainD andtrainSpeed:(NSString*)trainS;
@end
