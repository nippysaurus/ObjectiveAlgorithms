#import <Foundation/Foundation.h>
#import "NIPLevenshteinDistance.h"
#import "NIPBubbleSort.h"
#import "NIPFisherYatesShuffle.h"
#import "NIPMandelbrot.h"

//
// LINKS:
//
// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html
// http://stackoverflow.com/questions/4118285/nscomparisonresult-and-nscomparator-what-are-they
//

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	printf("WHICH ALGORITHM WOULD YOU LIKE TO TEST?\n\n");
	printf(" 1. Levenshtein Distance\n");
	printf(" 2. Bubble Sort\n");
	printf(" 3. FISHER YATES SHUFFLE\n");
	printf(" 4. MANDLEBROT SET\n");

	int choice;
	
	scanf("%d", &choice);

	if (choice == 1)
	{
		[NIPLevenshteinDistance test];
		return 0;
	}

	if (choice == 2)
	{
		[NIPBubbleSort test];
		return 0;
	}

	if (choice == 3)
	{
		[NIPFisherYatesShuffle test];
		return 0;
	}

	if (choice == 4)
	{
		[NIPMandelbrot test];
		return 0;
	}
	
    [pool drain];
    return 0;
}