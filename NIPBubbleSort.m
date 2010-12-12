//
//  NIPBubbleSort.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 23/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPBubbleSort.h"

@implementation NIPBubbleSort

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator
{
   // this algorithm will not work with one item (im not even sure if it will work with two items)
	if ([items count] == 1)
		return items;
	
   // array where items will be swapped
	NSMutableArray* working = [[NSMutableArray alloc] initWithArray:items];
	
	BOOL swapped = NO;
	
	do {
		swapped = NO;

		for (int i = 0 ; i <= ([working count] - 2) ; ++i)
		{
			id a = [working objectAtIndex:i];
			id b = [working objectAtIndex:i+1];

			NSComparisonResult diff = comparator(a, b);

			if (diff > 0)
			{
				// use this instead?
				// -[NSMutableArray replaceObjectAtIndex:withObject:]

				// reverse items
				[working removeObjectAtIndex:i+1];
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
	printf("BUBBLE SORT\n");
	printf("enter a couple of words to sort (on a single line with pipes between): ");
	
	char buffer[256];
	scanf("%256s", buffer);
	
	NSComparisonResult (^compare)(id, id) = ^NSComparisonResult(id a, id b)
	{
		// standard Cocoa string comparison
		// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html%23//apple_ref/occ/instm/NSString/caseInsensitiveCompare:
		return [a caseInsensitiveCompare:b];
	};

	NSArray* words = [[NSString stringWithUTF8String:buffer] componentsSeparatedByString:@"|"];
	
	NSArray* sorted = [NIPBubbleSort sortItems:words usingComparator:compare];

	for (NSString* word in sorted)
		printf("%s\n", [word UTF8String]);
}

@end
