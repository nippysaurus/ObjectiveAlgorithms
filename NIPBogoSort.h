//
//  NIPBogoSort.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 4/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NIPFisherYatesShuffle.h"

@interface NIPBogoSort : NSObject {

}

+(NSArray*)sortItems:(NSArray*)items usingComparator:(NSComparator)comparator;

+(void)test;

@end