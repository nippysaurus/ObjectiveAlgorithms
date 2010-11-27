#import <Foundation/Foundation.h>
#import "NIPLevenshteinDistance.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	
	
	
	
	
	
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
	printf(" 2. something else\n");
	printf(" 3. something else\n");
	printf(" 4. something else\n");
	
	int choice;
	
	scanf("%d", &choice);

	//printf("you chose %d", choice);
	[NIPLevenshteinDistance test];
	
    [pool drain];
    return 0;
}