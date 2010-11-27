//
//  SampleSortableData.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 25/11/10.
//  Copyright 2010 Nuance. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NIPBubbleSort.h"

@interface SampleSortableData : NSObject <Comparable> {

	NSString* text;
	
}

-(id)initWithText:(NSString*)text;

@end