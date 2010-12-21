//
//  Helpers.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 17/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers

+(NSString*)getString
{
	return [Helpers getStringWithPrompt:nil];
}

+(NSString*)getStringWithPrompt:(NSString*)prompt
{
	if (prompt != nil)
		printf("%s: ", [prompt cStringUsingEncoding:NSUTF8StringEncoding]);

	char buffer[256];
	scanf("%256s", buffer);
	
	return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

+(NSNumber*)getNumber
{
	return [Helpers getNumberWithPrompt:nil];
}

+(NSNumber*)getNumberWithPrompt:(NSString*)prompt
{
	return [NSNumber numberWithInt:[Helpers getIntWithPrompt:prompt]];
}

+(int)getInt
{
	return [Helpers getIntWithPrompt:nil];
}

+(int)getIntWithPrompt:(NSString*)prompt
{
	if (prompt != nil)
		printf("%s: ", [prompt cStringUsingEncoding:NSUTF8StringEncoding]);
	
	int input;
	scanf("%d", &input);
	return input;
}

@end