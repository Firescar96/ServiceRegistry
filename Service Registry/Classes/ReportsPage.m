    //
//  ReportsPage.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "ReportsPage.h"


@implementation ReportsPage

@synthesize search;
@synthesize results1, results2;
@synthesize edit;
@synthesize rtStat;
@synthesize rsStat;

@synthesize delete1, delete2;

-(IBAction)gotoSearch
{	
	[search setHidden:NO];
	[results1 setHidden:YES];
	[results2 setHidden:YES];
}

-(IBAction)gotoResults1
{
	[search setHidden:YES];
	[results1 setHidden:NO];
	[results2 setHidden:YES];
}

-(IBAction)gotoResults2
{
	[search setHidden:YES];
	[results1 setHidden:YES];
	[results2 setHidden:NO];
}

-(IBAction)checkSave
{
	if ([edit isOn]) 
	{
		[rtStat saveData];
	}
	[self gotoSearch];
}

- (IBAction) deleteData
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Delete Service Report"
												   message: @"Are you absolutely sure you want to delete this consumer report?"
												  delegate: self
										 cancelButtonTitle:@"Cancel"
										 otherButtonTitles:@"Delete",nil];
	
	
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex   
{
	if (buttonIndex == 1)
	{
		NSManagedObjectContext *context = rtStat.appDelegate.managedObjectContext;
		
		NSManagedObject *deleteCustomer=[rtStat.foundReps objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		
		rtStat.owner.text = @"";
		rtStat.phone.text = @"";
		rtStat.city.text = @"";
		rtStat.email.text = @"";
		rtStat.modelNo.text = @"";
		rtStat.serialNo.text = @"";
		rtStat.modelNo.text = @"";
		rtStat.problem.text = @"";
		rtStat.spyBlas.text = @"";
		rtStat.malBytes.text = @"";
		rtStat.rootKit.text = @"";
		rtStat.antiVirus.text = @"";
		rtStat.antiVirus2.text = @"";
		rtStat.firewall.text = @"";
		rtStat.problem.text = @"";
		
		rtStat.hdLoc.text = @"";
		rtStat.hdTotMem.text = @"";
		rtStat.hdUseMem.text = @"";
		rtStat.hdFreeMem.text = @"";
		rtStat.bs.text = @"";
		rtStat.bsRes.text = @"";
		rtStat.cclean.text = @"";
		rtStat.defrag.text = @"";
		rtStat.start.text = @"";
		rtStat.progRem.text = @"";
		rtStat.softAdd.text = @"";
		rtStat.firewall.text = @"";
		
		[rtStat.memTest2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
		[rtStat.hd2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
		[rtStat.pcDiag2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
		[rtStat.driveUp2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
		[rtStat.winStress2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
		rtStat.startDate.text = @"";
		rtStat.remoteID.text = @"";
		rtStat.remotePass.text = @"";
		
		for (int i = 0; i < [rtStat.remoteMonth count]; i++) 
		{
			[[rtStat.remoteMonth objectAtIndex:i] setBackgroundColor:[UIColor blueColor]];
		}
		[rtStat.remoteMonth2 removeAllObjects];
		
		rtStat.ie.text = @"";
		rtStat.ffox.text = @"";
		rtStat.chrome.text = @"";
		rtStat.java.text = @"";
		rtStat.flash.text = @"";
		rtStat.reader.text = @"";
		rtStat.update.text = @"";
		rtStat.other.text = @"";
		rtStat.conclusion.text = @"";
		rtStat.labor.text = @"";
		rtStat.parts.text = @"";
		rtStat.tax.text = @"";
		rtStat.final.text = @"";
		
		[context deleteObject:deleteCustomer];
		[rtStat.foundReps objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		[rtStat.owners objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		[rtStat.emails objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		[rtStat.citys objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		[rtStat.dates objectAtIndex:[[rtStat.tvStatus indexPathForSelectedRow] section]];
		
		[rtStat findCustomer:[rsStat status]];
		[self gotoSearch];
	}
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
