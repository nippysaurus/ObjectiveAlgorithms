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
	
	for (int i = 0; i < height; ++i)
	{
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
			
			double progress_b = ((double)1 / (double)max_iteration) * (double)iteration;
			
   		    NSColor *color = [NSColor colorWithDeviceRed:progress_b
												   green:1.0
													blue:progress_b
												   alpha:1.0];
			
			[image setColor:color
						atX:j
						  y:i];
			
			
		}
		
	}
	
	NSData* TIFFData = [image TIFFRepresentation];
	[TIFFData writeToFile:@"/Users/michael/Code/ObjectiveAlgorithms/temp.tiff" atomically:YES];
}

//+(void)createSetWithWidth:(int)width Height:(int)height Thing:(void(int, int, int, int))thing
//{
//	//
//}

+(void)test
{
	[NIPMandlebrot createSetWithWidth:500 Height:500];
	
//	// This function (block?) will get called each time a point of the mandlebrot is calculated.
//	void (^mandlebrot_point_calculated)(int, int, int, int) = ^void(int x, int y, int iterations, int max_iterations)
//	{
//		//
//		return;
//	};
//	
//	[NIPMandlebrot createSetWithWidth:60 Height:40 Thing:mandlebrot_point_calculated];
}

@end