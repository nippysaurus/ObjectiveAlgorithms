#import <Foundation/Foundation.h>
#import "NIPLevenshteinDistance.h"
#import "NIPBubbleSort.h"
#import "NIPFisherYatesShuffle.h"
#import "NIPMandelbrot.h"
#import "NIPInsertionSort.h"
#import "NIPBogoSort.h"

//
// LINKS:
//
// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html
// http://stackoverflow.com/questions/4118285/nscomparisonresult-and-nscomparator-what-are-they
//

int main (int argc, const char * argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	printf("===================\n");
	printf("ObjectiveAlgorithms\n");
	printf("===================\n\n");

	printf("This is a tester application which allows you to drive each of the algorithms from the command line. I have also included some functionality which might be useful to someone who does not know which sorting algorithm to use. Please make your selection from the menu items below.\n\n");
	
	printf("HELPERS\n\n");
	printf(" [1] Sorting Algorithms\n");

	printf("\n");
	
	printf("ALGORITHMS\n\n");
	printf(" [2] Levenshtein Distance\n");
	printf(" [3] Bubble Sort\n");
	printf(" [4] Fisher Yates Shuffle\n");
	printf(" [5] Mandelbrot Set\n");
	printf(" [6] Insertion Sort\n");
	printf(" [7] Bogo Sort\n");
	
	int choice;
	scanf("%d", &choice);

	switch (choice)
	{
		case 1:
			// TODO create a function for this space. i'm not even sure where the code will be.
			break;
		case 2:
			[NIPLevenshteinDistance test];
			break;
		case 3:
			[NIPBubbleSort test];
			break;
		case 4:
			[NIPFisherYatesShuffle test];
			break;
		case 5:
			[NIPMandelbrot test];
			break;
		case 6:
			[NIPInsertionSort test];
			break;
		case 7:
			[NIPBogoSort test];
			break;
		default:
			// if the user makes an invlaid sepection, write a warning
			// message and exit the application. they can run it again
			// and make a more informed decision.
			printf("invalid choice");
			break;
	};
	
	[pool drain];
	return 0;
}
