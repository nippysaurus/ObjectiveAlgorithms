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
   // { This procedure sorts in ascending order. }
   //     for i := 1 to length[A]-1 do
   foreach (int i = 1 ; i < [items count] ; ++i)
   {
      id value = [items objectAtIndex: i];
   //         value := A[i];
      id j = i - 1;
   //         j := i - 1;
      bool done = NO;
   //         done := false;
      while (done == NO)
      {
   //         repeat
   //             { To sort in descending order simply reverse the operator i.e. A[j] < value }
         id compareTo = [items objectAtIndex:j];
         if (comparator(compareTo, value) == NSBigger)
         {
   //             if A[j] > value then
   //             begin
   //                 A[j + 1] := A[j];
   //                 j := j - 1;
   //                 if j < 0 then
   //                     done := true;
   //             end
         }
         else
         {
            done = YES;
         }
   //             else
   //                 done := true;
   //         until done;
      }
      [items setObject:value forIndex:j+1];
   //         A[j + 1] := value;
   }
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
