//
//  Sorting.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 17/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "Sorting.h"

@implementation Sorting

+(void)bla
{
	printf("SORTING (helper)\n\n");
	printf("This helper will assist with deciding which sorting algorithm will work best for a given data list. Enter the data you would like to sort, which will then be sorted using all the sorting algorithms implemented in this project. The result will be a list of times showing up quickly each algorithm took to sort your data. Many factors can contribute to the length of time an algorithm takes to sort data. One factor is the amount of data, and the other is how sorted the data is already.\n\n");
	
	NSString *data = [Helpers getStringWithPrompt:@"enter your data"];
	
	NSArray *items = [data componentsSeparatedByString:@"|"];

	NSComparisonResult (^compare)(id, id) = ^NSComparisonResult(id a, id b)
	{
		// standard Cocoa string comparison
		// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html%23//apple_ref/occ/instm/NSString/caseInsensitiveCompare:
		return [a caseInsensitiveCompare:b];
	};
	
	CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
	
	[NIPBogoSort sortItems:items usingComparator:compare];
	
	CFAbsoluteTime bogo_sort_split = CFAbsoluteTimeGetCurrent();
	
	[NIPInsertionSort sortItems:items usingComparator:compare];
	
	CFAbsoluteTime insertion_sort_split = CFAbsoluteTimeGetCurrent();
	
	[NIPBubbleSort sortItems:items usingComparator:compare];
	
	CFAbsoluteTime bubble_sort_split = CFAbsoluteTimeGetCurrent();
	
	CFAbsoluteTime bogo_sort_wall = bogo_sort_split - start;
	CFAbsoluteTime insertion_sort_wall = insertion_sort_split - bogo_sort_split;
	CFAbsoluteTime bubble_sort_wall = bubble_sort_split - insertion_sort_split;
	
	printf("BogoSort: %fs\n", bogo_sort_wall);
	printf("InsertionSort: %fs\n", insertion_sort_wall);
	printf("BubbleSort: %fs\n", bubble_sort_wall);
}

@end