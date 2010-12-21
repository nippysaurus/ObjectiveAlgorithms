//
//  NIPLevinshteinDistance.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 22/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPLevenshteinDistance.h"

@implementation NIPLevenshteinDistance

// This is just a helper function to calculate the smaller of three intergers.
// If there is a library function which I can use instead then I will use it.
+(int)minBetween:(int)this That:(int)that Other:(int)other
{
	int min = this;
	
	if (that < min)
		min = that;
	
	if (other < min)
		min = other;
	
	return min;
}

// This is the actual algorithm function that 
// calculates the distance between two words.
+(NSNumber*)calculateDistanceBetween:(NSString*)a and:(NSString*)b
{
	int aLength = [a length];
	int bLength = [b length];
	
	int d[aLength + 1][bLength + 1];
	
	for (int i = 0 ; i < aLength + 1 ; ++i)
		d[i][0] = i;
	
	for (int j = 0 ; j < bLength + 1 ; ++j)
		d[0][j] = j;
	
	for (int j = 0 ; j < bLength ; ++j)
		for (int i = 0 ; i < aLength ; ++i)
		{
			//NSLog(@"[%i,%i]", i,j);
			
			// assist with mapping string location to relevant array location
			int i2 = i + 1;
			int j2 = j + 1;
			
			char charA = [a characterAtIndex:i];
			char charB = [b characterAtIndex:j];
			
			if (charA == charB)
			{
				d[i2][j2] = d[i2 - 1][j2 - 1];
				//NSLog(@"d[%i][%i] = %i", i2, j2, d[i2][j2]);
				continue;
			}
			
			int deletion = d[i2 - 1][j2] + 1;
			int insertion = d[i2][j2 - 1] + 1;
			int substitution = d[i2 - 1][j2 - 1] + 1;
			
			int min = [self minBetween:deletion
								  That:insertion
								 Other:substitution];
			
			d[i2][j2] = min;
			
			//NSLog(@"d[%i][%i] = %i", i2, j2, min);
		}
	
	int result = d[aLength][bLength];
	
	return [NSNumber numberWithInt:result];
}

+(void)test
{
	printf("LEVENSHTEIN DISTANCE (algorithm)\n");
	
	
	NSString *a = [Helpers getStringWithPrompt:@"enter first word"];
	NSString *b = [Helpers getStringWithPrompt:@"enter second word"];

	NSNumber* distance = [self calculateDistanceBetween:a and:b];
	
	char* c_a = (char*)[a cStringUsingEncoding:NSUTF8StringEncoding];
	char* c_b = (char*)[b cStringUsingEncoding:NSUTF8StringEncoding];
	
	printf("distance (%s,%s) = %i", c_a, c_b, [distance intValue]);
}

@end