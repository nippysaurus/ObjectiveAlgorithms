//
//  NIPMandlebrot.m
//  ObjectiveAlgorithms
//
//  Created by Michael Dawson on 7/12/10.
//  Copyright 2010 Nippysaurus. All rights reserved.
//

#import "NIPMandelbrot.h"

@implementation NIPMandelbrot

+(void)createSetWithWidth:(int)width Height:(int)height Thing:(void(^)(int, int, int, int))thing
{
	double xmin = -1;
	double xmax = 0;
	double ymin = -1;
	double ymax = 0;

	for (int i = 0; i < width; ++i)
		for (int j = 0; j < height; ++j)
		{
			double x0 = (((xmax - xmin) / width) * i) + xmin;
			double y0 = (((ymax - ymin) / height) * j) + ymin;
			double x = 0.0f;
			double y = 0.0f;
			
			int iteration = 0;
			int max_iteration = 150;
			
			while ((((x * x) + (y * y)) <= 4.0f) && (iteration < max_iteration))
			{
				double xtemp = ((x * x) - (y * y)) + x0;
				y = ((2.0f * x) * y) + y0;
				x = xtemp;
				iteration += 1;
			}
			
			thing(i, j, iteration, max_iteration);
		}
}

+(void)test
{
	int imageWidth = 640;
	int imageHeight = 960;
	
	NSBitmapImageRep* image = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
																	  pixelsWide:imageWidth 
																	  pixelsHigh:imageHeight
																   bitsPerSample:8
																 samplesPerPixel:4
																		hasAlpha:YES
																		isPlanar:NO
																  colorSpaceName:NSDeviceRGBColorSpace
																	 bytesPerRow:0
																	bitsPerPixel:0];
	
	// This function (block?) will get called each time a point of the mandlebrot is calculated.
	void (^mandlebrot_point_calculated)(int, int, int, int) = ^void(int x, int y, int iteration, int max_iteration)
	{
		double progress_b = ((double)1 / (double)max_iteration) * (double)iteration;
		
		NSColor *color = [NSColor colorWithDeviceRed:progress_b
											   green:1.0
												blue:progress_b
											   alpha:1.0];
		
		[image setColor:color atX:x y:y];
	};
	
	[NIPMandelbrot createSetWithWidth:imageWidth Height:imageHeight Thing:mandlebrot_point_calculated];
	
	NSData* TIFFData = [image TIFFRepresentation];
	[TIFFData writeToFile:@"/Users/michael/Code/ObjectiveAlgorithms/temp.tiff" atomically:YES];
}

@end