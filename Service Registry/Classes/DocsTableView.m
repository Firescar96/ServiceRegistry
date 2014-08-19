//
//  DocsTableView.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "DocsTableView.h"


@implementation DocsTableView

@synthesize boss;
@synthesize controller;

-(BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = [touch tapCount];
	
	if (tapCount == 2)
	{
		NSIndexPath *curInd = [self indexPathForSelectedRow];
		if ([self numberOfSections] > 0 && [controller foundReps] > 0) 
		{	
			[controller setReport:curInd];
			[boss generatePdf];
			
		}
	}
	return YES;
}

@end
