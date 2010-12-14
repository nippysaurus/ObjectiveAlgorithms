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
	//
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
