//
//  Helpers.h
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 17/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Helpers : NSObject {

}

+(NSString*)getString;
+(NSString*)getStringWithPrompt:(NSString*)prompt;

+(NSNumber*)getNumber;
+(NSNumber*)getNumberWithPrompt:(NSString*)prompt;

+(int)getInt;
+(int)getIntWithPrompt:(NSString*)prompt;

@end