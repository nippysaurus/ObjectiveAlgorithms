//
//  NIPBubbleSort.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 23/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NIPBubbleSort : NSObject {

}

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator;

+(void)test;

@end