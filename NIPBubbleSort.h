//
//  NIPBubbleSort.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 23/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SampleSortableData.h"

// the items to be sorted must implement this
// protocol so that they can be compared
//@protocol Comparable
//-(int)compareTo:(NSObject*)to;
//@end

@interface NIPBubbleSort : NSObject {

}

//+(NSArray*)sortItems:(NSArray*)items;

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator;

+(void)test;

@end