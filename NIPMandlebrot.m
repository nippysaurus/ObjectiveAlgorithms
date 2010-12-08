//
//  NIPMandlebrot.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 7/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPMandlebrot.h"

@implementation NIPMandlebrot

+(void)createSetWithWidth:(int)width Height:(int)height
{
	NSBitmapImageRep* image = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
																	  pixelsWide:width 
																	  pixelsHigh:height
																   bitsPerSample:8
																 samplesPerPixel:4
																		hasAlpha:YES
																		isPlanar:NO
																  colorSpaceName:NSDeviceRGBColorSpace
																	 bytesPerRow:0
																	bitsPerPixel:0];
	
	[NSGraphicsContext saveGraphicsState];
	[NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:image]];
	
	for (int i = 0; i < height; ++i)
	{
		NSMutableArray *line = [[NSMutableArray alloc] init];
		for (int j = 0; j < width; ++j)
		{
			double x0 = ((4.0f * (i - (height / 2))) / (height)) - 1.0f;
			double y0 = ((4.0f * (j - (width / 2))) / (width)) + 0.0f;
			double x = 0.0f;
			double y = 0.0f;
			
			int iteration = 0;
			int max_iteration = 1000;
			
			while ((((x * x) + (y * y)) <= 4.0f) && (iteration < max_iteration))
			{
				double xtemp = ((x * x) - (y * y)) + x0;
				y = ((2.0f * x) * y) + y0;
				x = xtemp;
				iteration += 1;
			}
			
			// 0 .. 9
			double progress = ((double)9 / (double)max_iteration) * (double)iteration;
			int progress_floor = floor(progress);
			NSString *pixel = [NSString stringWithFormat:@"%i", progress_floor];
			[line addObject:pixel];
			
   		    NSColor *color = [NSColor colorWithDeviceRed:1.0
												   green:1.0
													blue:1.0
												   alpha:1.0];
			
//			[color set];
			
			[image setColor:color
						atX:x
						  y:y];
			
			
		}
		
		for (NSString* s in line)
			printf("%s", [s UTF8String]);
		printf("\n");
	}
	
	//[[NSColor colorWithCalibratedRed:1 green:0 blue:0 alpha:1] set];
	//[[NSBezierPath bezierPathWithRect:NSMakeRect(0, 0, 396, 396)] fill];
	
	[NSGraphicsContext restoreGraphicsState];
	
	NSData* TIFFData = [image TIFFRepresentation];
	[TIFFData writeToFile:@"/Users/michael/Code/ObjectiveAlgorithms/temp.tiff" atomically:YES];
}

+(void)test
{
	[NIPMandlebrot createSetWithWidth:60 Height:40];
}

@end