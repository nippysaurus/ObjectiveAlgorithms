//
//  NIPFisherYatesShuffle.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 4/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPFisherYatesShuffle.h"

@implementation NIPFisherYatesShuffle

+(NSArray*)shuffleData:(NSArray*)data
{
	int count = [data count];

	NSMutableArray* working = [[NSMutableArray alloc] initWithArray:data];
	
	for (int i = count - 1 ; i >= 0 ; --i)
	{
		int random = arc4random() % count;
		id bla = [working objectAtIndex:i];
		[working removeObjectAtIndex:i];
		[working insertObject:bla atIndex:random];
	}
	
	return working;
}

+(void)test
{
	printf("FISHER YATES SHUFFLE (algorithm)\n");

	NSString *input = [Helpers getStringWithPrompt:@"enter some words to shuffle (separated with pipe symbol)"];
	
	NSArray* words = [input componentsSeparatedByString:@"|"];
	
	NSArray* shuffled = [NIPFisherYatesShuffle shuffleData:words];
	
	for (NSString* shuffle in shuffled)
		printf("%s\n", [shuffle UTF8String]);
}

@end