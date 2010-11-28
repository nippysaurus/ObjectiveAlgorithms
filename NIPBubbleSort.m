//
//  NIPBubbleSort.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 23/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPBubbleSort.h"

@implementation NIPBubbleSort

//+(NSArray*)sortItems:(NSArray*)items;
+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator
{
	if ([items count] == 1)
		return items;
	
	NSMutableArray* working = [[NSMutableArray alloc] initWithArray:items];
	
	BOOL swapped = NO;
	
	// actual algorithm
	do {
		swapped = NO;

		for (int i = 0 ; i <= ([working count] - 2) ; ++i)
		{
			id a = [working objectAtIndex:i];
			id b = [working objectAtIndex:i+1];
			
			[working removeObjectAtIndex:i];
			[working removeObjectAtIndex:i];

			NSComparisonResult diff = comparator(a, b);

			if (diff > 0)
			{
				// inserting in this order will reverse them
				[working insertObject:a atIndex:i];
				[working insertObject:b atIndex:i];
				
				swapped = YES;
			}
			else
			{
				// inserting in this order will not reverse them
				[working insertObject:b atIndex:i];
				[working insertObject:a atIndex:i];
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
	printf("BUBBLE SORT\n");
	printf("enter a couple of words to sort (on a single line with pipes between): ");
	
	char buffer[256];
	scanf("%256s", buffer);

	NSComparisonResult (^compare)(id, id) = ^NSComparisonResult(id a, id b)
	{
		// standard string comparison
		return [a caseInsensitiveCompare:b];
	};

	NSArray* words = [[NSString stringWithCString:buffer] componentsSeparatedByString:@"|"];
	
	NSArray* sorted = [NIPBubbleSort sortItems:words usingComparator:compare];

	for (NSString* word in sorted)
		printf("%s\n", [word cString]);
	
	//printf("distance (%s,%s) = %i", first, second, [distance intValue]);
}

@end