#import <Foundation/Foundation.h>
#import "NIPLevenshteinDistance.h"
#import "NIPBubbleSort.h"

//
// LINKS:
//
// http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html
// http://stackoverflow.com/questions/4118285/nscomparisonresult-and-nscomparator-what-are-they
//

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	
	
//	NSMutableArray* ma = [[NSMutableArray alloc] init];
	
//	[ma addObject:@"c"];
//	[ma addObject:@"b"];
//	[ma addObject:@"d"];
//	[ma addObject:@"a"];
//	
//	[ma sortUsingComparator:<#(NSComparator)cmptr#>
//	
//	for (NSString* b in ma)
//		NSLog(@"[%@]", b);
//	
//	return 0;
	
	
	
//	NSMutableArray* a = [[NSMutableArray alloc] init];
//	
//	[a insertObject:@"a" atIndex:0];
//	[a insertObject:@"b" atIndex:0];
//	[a insertObject:@"c" atIndex:0];
//	
//	for (NSObject* b in a)
//	{
//		NSLog(@"[%@]", b);
//		//
//	}
//	
//	return 0;
	
	
	
	
	
	
	
	// TODO a bit of a menu askig whcih algorithm to test
	
	printf("WHICH ALGORITHM WOULD YOU LIKE TO TEST?\n\n");
	printf(" 1. Levenshtein Distance\n");
	printf(" 2. Bubble Sort\n");
	printf(" 3. something else\n");
	printf(" 4. something else\n");
	
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
	
    [pool drain];
    return 0;
}