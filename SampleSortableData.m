//
//  SampleSortableData.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 25/11/10.
//  Copyright 2010 Nuance. All rights reserved.
//

#import "SampleSortableData.h"

@implementation SampleSortableData

-(id)initWithText:(NSString*)text
{
	//
}

-(int)compareTo:(NSObject*)to
{
	if ([to isKindOfClass:[SampleSortableData class]] == YES)
		[NSException raise:@"wrong type" format:@"wrong type to compare to"];
	
	SampleSortableData* compareTo = (SampleSortableData*)to;
	
	[text compareTo:compareTo.Text];
}

@end