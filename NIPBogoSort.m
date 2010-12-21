//
//  NIPBogoSort.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 4/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPBogoSort.h"

@implementation NIPBogoSort

+(bool)areSorted:(NSArray*)items usingComparator:(NSComparator)comparator
{
	id item_prev = nil;
	for (id item in items)
	{
		// kick start logic
		if (item_prev == nil)
		{
			item_prev = item;
			continue;
		}
		
		NSComparisonResult diff = comparator(item_prev, item);
				
		if (diff == NSOrderedDescending)
			return false;
		
		item_prev = item;
	}
	
	return true;
}

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator
{
	while (YES)
	{
		bool sorted = [NIPBogoSort areSorted:items usingComparator:comparator];
		
		if (sorted == YES)
			return items;
		
		items = [NIPFisherYatesShuffle shuffleData:items];
	}
}

+(void)test
{
	printf("BOGO SORT (algorithm)\n");
	printf("please note that this is not a real algorithm but is included for comparison and educational purposes.\n");

	NSString *input = [Helpers getStringWithPrompt:@"enter a couple of words to sort (on a single line with pipes between)"];
	
	NSComparisonResult (^compare)(id, id) = ^NSComparisonResult(id a, id b)
	{
		// standard Cocoa string comparison
		// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html%23//apple_ref/occ/instm/NSString/caseInsensitiveCompare:
		return [a caseInsensitiveCompare:b];
	};
	
	NSArray* words = [input componentsSeparatedByString:@"|"];
	
	NSArray* sorted = [NIPBogoSort sortItems:words usingComparator:compare];
	
	for (NSString* word in sorted)
		printf("%s\n", [word UTF8String]);
}

@end
