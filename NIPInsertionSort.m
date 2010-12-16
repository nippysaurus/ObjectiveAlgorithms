//
//  NIPInsertionSort.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 4/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPInsertionSort.h"

@implementation NIPInsertionSort

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator
{
	if ([items count] == 1)
		return items;
	
	NSMutableArray *data = [NSMutableArray arrayWithArray:items];;
	for (int i = 1 ; i < [data count] ; ++i)
	{
		id value = [data objectAtIndex: i];
		int j = i - 1;
		bool done = NO;
		while (done == NO)
		{
			id compareTo = [data objectAtIndex:j];
			NSComparisonResult diff = comparator(compareTo, value);
			if (diff > 0)
			{
				[data replaceObjectAtIndex:j+1 withObject:compareTo];
				j = j-1;
				if (j < 0)
					done = YES;
			}
			else
			{
				done = YES;
			}
		}
		[data replaceObjectAtIndex:j+1 withObject:value];
	}
	return [NSArray arrayWithArray:data];
}

+(void)test
{
	printf("INSERTION SORT\n");
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
	
	NSArray* sorted = [NIPInsertionSort sortItems:words usingComparator:compare];

	for (NSString* word in sorted)
		printf("%s\n", [word UTF8String]);
}

@end
