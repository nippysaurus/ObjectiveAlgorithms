//
//  NIPLevinshteinDistance.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 22/11/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NIPLevenshteinDistance : NSObject {

}

+(NSNumber*)calculateDistanceBetween:(NSString*)a and:(NSString*)b;

+(void)test;

@end