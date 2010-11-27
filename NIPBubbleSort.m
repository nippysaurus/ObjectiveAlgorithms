//
//  NIPBubbleSort.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 23/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPBubbleSort.h"

@implementation NIPBubbleSort

+(NSArray*)sortItems:(NSArray*)items;
{
	NSMutableArray* working = [[NSMutableArray alloc] initWithArray:items];
	
	// check that all items confirm to comparable protocol
	for (NSObject* object in items)
		if ([object conformsToProtocol:@protocol(Comparable)] == NO)
			[NSException raise:@"Bubble Sort Error" format:@"item does not confirm to comparable protocol"];

	BOOL swapped = NO;
	
	// actual algorithm
	do {
		swapped = NO;

		for (int i = 0 ; i <= ([working count] - 2) ; ++i)
		{
			id<Comparable> a = [working objectAtIndex:i];
			id<Comparable> b = [working objectAtIndex:i];

			[working objectAtIndex:i];
			[working objectAtIndex:i];
			
			int diff = [a compareTo:b];
			
			if (diff > 0)
			{
				[working insertObject:a atIndex:i];
				[working insertObject:b atIndex:i];
				
				swapped = YES;
			}
		}
		
	} while (swapped == YES);
	
	// do it this way to allow working data to be released
	NSArray* result = [[NSArray alloc] initWithArray:working];
	[working release];
	return result;
}

+(void)test
{
	return;
}

@end