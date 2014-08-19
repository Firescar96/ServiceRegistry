//
//  ReportsTable.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "DocsTable.h"
#import "Service_RegistryAppDelegate.h"

@implementation DocsTable

@synthesize appDelegate;

@synthesize tvStatus;
@synthesize pvStatus;

@synthesize owners;
@synthesize emails;
@synthesize citys;
@synthesize dates;
@synthesize foundReps;

@synthesize date;

@synthesize owner;
@synthesize phone;
@synthesize city;
@synthesize email;
@synthesize modelNo;
@synthesize serialNo;
@synthesize spyBlas;
@synthesize malBytes;
@synthesize rootKit;
@synthesize firewall;
@synthesize antiVirus;
@synthesize antiVirus2;
@synthesize problem;

@synthesize hdLoc;
@synthesize hdTotMem;
@synthesize hdUseMem;
@synthesize hdFreeMem;
@synthesize bs;
@synthesize bsRes;
@synthesize cclean;
@synthesize defrag;
@synthesize start;
@synthesize progRem;
@synthesize softAdd;

@synthesize memTest;
@synthesize hd;
@synthesize pcDiag;
@synthesize driveUp;
@synthesize winStress;
@synthesize hdOther;
@synthesize hdOtherRes;
@synthesize startDate;
@synthesize remoteID;
@synthesize renewalDate;
@synthesize remotePass;
@synthesize remoteMonth;

@synthesize ie;
@synthesize ffox;
@synthesize chrome;
@synthesize broOther;
@synthesize broOtherRes;
@synthesize java;
@synthesize flash;
@synthesize reader;
@synthesize update;
@synthesize other;
@synthesize conclusion;
@synthesize labor;
@synthesize parts;
@synthesize tax;
@synthesize final;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	owners = [[NSMutableArray alloc] init];
	emails = [[NSMutableArray alloc] init];
	citys = [[NSMutableArray alloc] init];
	dates = [[NSMutableArray alloc] init];
	foundReps = [[NSMutableArray alloc] init];
	
	remoteMonth = [[NSMutableArray alloc] init];
	[remoteMonth addObject:@"Jan"];
	[remoteMonth addObject:@"Feb"];
	[remoteMonth addObject:@"Mar"];
	[remoteMonth addObject:@"Apr"];
	[remoteMonth addObject:@"May"];
	[remoteMonth addObject:@"Jun"];
	[remoteMonth addObject:@"July"];
	[remoteMonth addObject:@"Aug"];
	[remoteMonth addObject:@"Sept"];
	[remoteMonth addObject:@"Oct"];
	[remoteMonth addObject:@"Nov"];
	[remoteMonth addObject:@"Dec"];
}

#pragma mark -
#pragma mark Table view data source

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
  //Return the number of sections.
 return [owners count];
 }
 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return 4;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderinSection:(NSInteger)section 
{
    // Return the title of the section.
    return [NSString stringWithFormat:@"%@",[owners objectAtIndex:section]];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([indexPath row] == 0) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
		
		UIColor *backColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithWhite:1 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",[owners objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 1) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Email: %@",
		 [emails objectAtIndex:[indexPath section]]];
	}
    else if ([indexPath row] == 2) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"City: %@",
			[citys objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 3) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Date: %@", 
			[dates objectAtIndex:[indexPath section] ]];
	}
	
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	
	NSIndexPath *head = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
	[tvStatus selectRowAtIndexPath:head animated:YES scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark -
#pragma mark Memory management

-(void) findCustomer:(NSString *)query
{	
	NSString *type;
	switch ([pvStatus selectedRowInComponent:0]) 
	{
		case 0:
			type = @"owner";
			break;
		case 1:
			type = @"email";
			break;
		case 2:
			type = @"city";
			break;
		case 3:
			type = @"date";
			break;
		default:
			type = @"owner";
			break;
	}
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Report" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	if(![query isEqual:nil] && ![query isEqualToString:@""] && ![query isEqualToString:@" "] && ![query isEqualToString:@"  "])
	{
		NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(%@ CONTAINS[nc] '%@')", type, query]];
		[request setPredicate:predicate];
	}
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[NSString stringWithFormat:@"%@", type]
																   ascending:YES];
	NSArray *sortDescriptors= [[NSArray alloc] initWithObjects:sortDescriptor , nil];
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	NSManagedObject *matches = nil;
	
	//clear Table
	[owners removeAllObjects];
	[emails removeAllObjects];
	[citys removeAllObjects];
	[dates removeAllObjects];
	[tvStatus reloadData];
	
	if ([array count] == 0) 
	{
		foundReps = nil;
		
		[owners addObject:[NSString stringWithFormat:@"Try Again"]];
		[emails addObject:[NSString stringWithFormat:@"This is not the report you are looking for"]];
		[citys addObject:[NSString stringWithFormat:@"Try making the report first :)"]];
		
		NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
		[dateForm setDateStyle:NSDateFormatterShortStyle];
		[dateForm setTimeStyle:NSDateFormatterShortStyle];
		[dates addObject:[dateForm stringFromDate:[NSDate date]]];
	} else 
	{
		foundReps = [[NSMutableArray alloc] initWithArray:array];
		for (int i = 0; i < [array count]; i++) 
		{
			matches = [array objectAtIndex:i];
			[owners addObject:[matches valueForKey:@"owner"]];
			[emails addObject:[matches valueForKey:@"email"]];
			[citys addObject:[matches valueForKey:@"city"]];
			[dates addObject:[matches valueForKey:@"date"]];
		}
	}
	[tvStatus reloadData];
}

-(void) setReport:(NSIndexPath *)curInd
{
	NSManagedObject *matches = nil;
	
	if ([foundReps count] != 0) 
	{
		matches = [foundReps objectAtIndex:[curInd section]];
		
		date = [matches valueForKey:@"date"];
		
		owner = [matches valueForKey:@"owner"];
		phone = [matches valueForKey:@"phone"];
		city = [matches valueForKey:@"city"];
		email = [matches valueForKey:@"email"];
		spyBlas = [matches valueForKey:@"spyBlas"];
		antiVirus = [matches valueForKey:@"antiVirus"];
		antiVirus2 = [matches valueForKey:@"antiVirus2"];
		modelNo = [matches valueForKey:@"modelNo"];
		serialNo = [matches valueForKey:@"serialNo"];
		malBytes = [matches valueForKey:@"malBytes"];
		rootKit = [matches valueForKey:@"rootKit"];
		firewall = [matches valueForKey:@"firewall"];
		problem = [matches valueForKey:@"problem"];
		hdLoc = [matches valueForKey:@"hdLoc"];
		hdTotMem = [matches valueForKey:@"hdTotMem"];
		hdUseMem = [matches valueForKey:@"hdUseMem"];
		hdFreeMem = [matches valueForKey:@"hdFreeMem"];
		bs = [matches valueForKey:@"bs"];
		bsRes = [matches valueForKey:@"bsRes"];
		cclean = [matches valueForKey:@"cclean"];
		defrag = [matches valueForKey:@"defrag"];
		start = [matches valueForKey:@"start"];
		progRem = [matches valueForKey:@"progRem"];
		softAdd = [matches valueForKey:@"softAdd"];
		memTest = [matches valueForKey:@"memTest"];
		hd = [matches valueForKey:@"hd"];
		pcDiag = [matches valueForKey:@"pcDiag"];
		driveUp = [matches valueForKey:@"driveUp"];
		winStress = [matches valueForKey:@"winStress"];
		hdOther = [matches valueForKey:@"hdOther"];
		hdOtherRes = [matches valueForKey:@"hdOther"];
		startDate = [matches valueForKey:@"startDate"];
		remoteID = [matches valueForKey:@"remoteID"];
		renewalDate = [matches valueForKey:@"renewalDate"];
		remotePass = [matches valueForKey:@"remotePass"];
		
		for (int i = 0; i < [remoteMonth count]; i++) 
		{
			NSString *month = [remoteMonth objectAtIndex:i];
			if ([[matches valueForKey:[NSString stringWithFormat:@"remote%@", month]] boolValue]==YES) 
			{
				[remoteMonth replaceObjectAtIndex:i withObject:@"Yes"];
			}
			else 
			{
				[remoteMonth replaceObjectAtIndex:i withObject:@""];
			}

		}
		
		ie = [matches valueForKey:@"ie"];
		ffox = [matches valueForKey:@"ffox"];
		chrome = [matches valueForKey:@"chrome"];
		broOther = [matches valueForKey:@"broOther"];
		broOtherRes = [matches valueForKey:@"broOtherRes"];
		java = [matches valueForKey:@"java"];
		flash = [matches valueForKey:@"flash"];
		reader = [matches valueForKey:@"reader"];
		update = [matches valueForKey:@"update"];
		other = [matches valueForKey:@"other"];
		conclusion = [matches valueForKey:@"conclusion"];
		labor = [matches valueForKey:@"labor"];
		parts = [matches valueForKey:@"parts"];
		tax = [matches valueForKey:@"tax"];
		final = [matches valueForKey:@"final"];
	}
}

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload 
{
    self.owners = nil;
	self.emails = nil;
	self.citys = nil;
	self.foundReps = nil;
	
	self.owner = nil;
	self.phone = nil;
	self.city = nil;
	self.email = nil;
	self.modelNo = nil;
	self.serialNo = nil;
	self.spyBlas = nil;
	self.malBytes = nil;
	self.rootKit = nil;
	self.firewall = nil;
	self.antiVirus = nil;
	self.antiVirus2 = nil;
	self.problem = nil;
	
	self.hdLoc = nil;
	self.hdTotMem = nil;
	self.hdUseMem = nil;
	self.hdFreeMem = nil;
	self.bs = nil;
	self.bsRes = nil;
	self.cclean = nil;
	self.defrag = nil;
	self.start = nil;
	self.progRem = nil;
	self.softAdd = nil;
	
	self.memTest = nil;
	self.hd = nil;
	self.pcDiag = nil;
	self.driveUp = nil;
	self.winStress = nil;
	self.hdOther = nil;
	self.hdOtherRes = nil;
	self.startDate = nil;
	self.remoteID = nil;
	self.renewalDate = nil;
	self.remotePass = nil;
	remoteMonth = nil;
	
	self.ie = nil;
	self.ffox = nil;
	self.chrome = nil;
	self.broOther = nil;
	self.broOtherRes = nil;
	self.java = nil;
	self.flash = nil;
	self.reader = nil;
	self.update = nil;
	self.other = nil;
	self.conclusion = nil;
	self.labor = nil;
	self.parts = nil;
	self.tax = nil;
	self.final = nil;
}


@end

