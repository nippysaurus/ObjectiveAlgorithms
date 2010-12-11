//
//  NIPMandlebrot.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 7/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface NIPMandelbrot : NSObject {

}

+(void)createSetWithWidth:(int)width Height:(int)height Thing:(void(^)(int, int, int, int))thing;

+(void)test;

@end