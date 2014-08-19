//
//  ReportsTable.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "ReportsTable.h"
#import "Service_RegistryAppDelegate.h"

@implementation ReportsTable

@synthesize appDelegate;

@synthesize tvStatus;
@synthesize pvStatus;
@synthesize rpStat;

@synthesize owners;
@synthesize emails;
@synthesize citys;
@synthesize dates;
@synthesize foundReps;

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

@synthesize memTest2;
@synthesize hd2;
@synthesize pcDiag2;
@synthesize driveUp2;
@synthesize winStress2;

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
@synthesize remoteMonth2;

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

@synthesize edit;
@synthesize search;
@synthesize results1, results2;

@synthesize delete1, delete2;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	owners = [[NSMutableArray alloc] init];
	emails = [[NSMutableArray alloc] init];
	citys = [[NSMutableArray alloc] init];
	dates = [[NSMutableArray alloc] init];
	foundReps = [[NSMutableArray alloc] init];
	
	remoteMonth2 = [[NSMutableArray alloc] init];
	
	passFail = [[NSMutableArray alloc] init];
	[passFail addObject:@"Neutral"];
	[passFail addObject:@"Pass"];
	[passFail addObject:@"Fail"];
	[passFail addObject:@"Neutral"];
	
	[edit setOn:NO];
	[self setEditable:NO];
	
	[memTest2 setHidden:YES];
	[hd2 setHidden:YES];
	[pcDiag2 setHidden:YES];
	[driveUp2 setHidden:YES];
	[winStress2 setHidden:YES];
}


-(IBAction)backgroundTouched:(id)sender
{
	[owner resignFirstResponder];
	[phone resignFirstResponder];
	[city resignFirstResponder];
	[email resignFirstResponder];
	[spyBlas resignFirstResponder];
	[antiVirus resignFirstResponder];
	[antiVirus2 resignFirstResponder];
	[modelNo resignFirstResponder];
	[serialNo resignFirstResponder];
	[malBytes resignFirstResponder];
	[rootKit resignFirstResponder];
	[firewall resignFirstResponder];
	[problem resignFirstResponder];
	
	[hdLoc resignFirstResponder];
	[hdTotMem resignFirstResponder];
	[hdUseMem resignFirstResponder];
	[hdFreeMem resignFirstResponder];
	[bs resignFirstResponder];
	[bsRes resignFirstResponder];
	[cclean resignFirstResponder];
	[defrag resignFirstResponder];
	[start resignFirstResponder];
	[progRem resignFirstResponder];
	[softAdd resignFirstResponder];
	
	[hdOther resignFirstResponder];
	[hdOtherRes resignFirstResponder];
	[startDate resignFirstResponder];
	[remoteID resignFirstResponder];
	[renewalDate resignFirstResponder];
	[remotePass resignFirstResponder];
	
	[ie resignFirstResponder];
	[ffox resignFirstResponder];
	[chrome resignFirstResponder];
	[broOther resignFirstResponder];
	[broOtherRes resignFirstResponder];
	[java resignFirstResponder];
	[flash resignFirstResponder];
	[reader resignFirstResponder];
	[update resignFirstResponder];
	[other resignFirstResponder];
	[conclusion resignFirstResponder];
	[labor resignFirstResponder];
	[parts resignFirstResponder];
	[tax resignFirstResponder];
	[final resignFirstResponder];
	
}

- (IBAction)buttonClicked:(id)sender 
{
	UIButton *button = (UIButton *)sender;
	
	
	if([[button backgroundColor] isEqual:[UIColor magentaColor]])
	{
		[button setBackgroundColor:[UIColor blueColor]];
	}
	else 
	{
		[button setBackgroundColor:[UIColor magentaColor]];
	}
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

-(IBAction) changeEdit
{
	if ([edit isOn]) 
	{
		[self setEditable:YES];
		
		[memTest2 setHidden:NO];
		[hd2 setHidden:NO];
		[pcDiag2 setHidden:NO];
		[driveUp2 setHidden:NO];
		[winStress2 setHidden:NO];
		
		[memTest setHidden:YES];
		[hd setHidden:YES];
		[pcDiag setHidden:YES];
		[driveUp setHidden:YES];
		[winStress setHidden:YES];
	} 
	else
	{
		[self setEditable:NO];
		
		[memTest2 setHidden:YES];
		[hd2 setHidden:YES];
		[pcDiag2 setHidden:YES];
		[driveUp2 setHidden:YES];
		[winStress2 setHidden:YES];
		
		[memTest setHidden:NO];
		[hd setHidden:NO];
		[pcDiag setHidden:NO];
		[driveUp setHidden:NO];
		[winStress setHidden:NO];
	}
}

- (void) saveData
{
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSManagedObject *newCustomer=[foundReps objectAtIndex:[[tvStatus indexPathForSelectedRow] section]];

	[newCustomer setValue:[owner text] forKey:@"owner"];
	[newCustomer setValue:[phone text] forKey:@"phone"];
	[newCustomer setValue:[city text] forKey:@"city"];
	[newCustomer setValue:[email text] forKey:@"email"];
	[newCustomer setValue:[modelNo text] forKey:@"modelNo"];
	[newCustomer setValue:[serialNo text] forKey:@"serialNo"];
	[newCustomer setValue:[problem text] forKey:@"problem"];
	[newCustomer setValue:[spyBlas text] forKey:@"spyBlas"];
	[newCustomer setValue:[malBytes text] forKey:@"malBytes"];
	[newCustomer setValue:[rootKit text] forKey:@"rootKit"];
	[newCustomer setValue:[antiVirus text] forKey:@"antiVirus"];
	[newCustomer setValue:[antiVirus2 text] forKey:@"antiVirus2"];
	[newCustomer setValue:[firewall text] forKey:@"firewall"];
	
	[newCustomer setValue:[hdLoc text] forKey:@"hdLoc"];
	[newCustomer setValue:[hdTotMem text] forKey:@"hdTotMem"];
	[newCustomer setValue:[hdUseMem text] forKey:@"hdUseMem"];
	[newCustomer setValue:[hdFreeMem text] forKey:@"hdFreeMem"];
	[newCustomer setValue:[bs text] forKey:@"bs"];
	[newCustomer setValue:[bsRes text] forKey:@"bsRes"];
	[newCustomer setValue:[cclean text] forKey:@"cclean"];
	[newCustomer setValue:[defrag text] forKey:@"defrag"];
	[newCustomer setValue:[start text] forKey:@"start"];
	[newCustomer setValue:[progRem text] forKey:@"progRem"];
	[newCustomer setValue:[softAdd text] forKey:@"softAdd"];
	
	[newCustomer setValue:[passFail objectAtIndex:[memTest2 selectedSegmentIndex] + 1] forKey:@"memTest"];
	[newCustomer setValue:[passFail objectAtIndex:[hd2 selectedSegmentIndex] + 1] forKey:@"hd"];
	[newCustomer setValue:[passFail objectAtIndex:[pcDiag2 selectedSegmentIndex] + 1] forKey:@"pcDiag"];
	[newCustomer setValue:[passFail objectAtIndex:[driveUp2 selectedSegmentIndex] + 1] forKey:@"driveUp"];
	[newCustomer setValue:[passFail objectAtIndex:[winStress2 selectedSegmentIndex] + 1] forKey:@"winStress"];
	[newCustomer setValue:[hdOther text] forKey:@"hdOther"];
	[newCustomer setValue:[hdOtherRes text] forKey:@"hdOtherRes"];
	[newCustomer setValue:[startDate text] forKey:@"startDate"];
	[newCustomer setValue:[remoteID text] forKey:@"remoteID"];
	[newCustomer setValue:[renewalDate text] forKey:@"renewalDate"];
	[newCustomer setValue:[remotePass text] forKey:@"remotePass"];
	[newCustomer setValue:[start text] forKey:@"start"];
	
	
	for (int i = 0; i < [remoteMonth count]; i++) 
	{
		[newCustomer setValue:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"remote%@", [[remoteMonth objectAtIndex:i] currentTitle]]];
	
		if ([[[remoteMonth objectAtIndex:i] backgroundColor] isEqual: [UIColor magentaColor] ]) 
		{
			[remoteMonth2 addObject:[[remoteMonth objectAtIndex:i] currentTitle] ];
		}
	}
	for (int i = 0; i < [remoteMonth2 count]; i++) 
	{
		[newCustomer setValue:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"remote%@", [remoteMonth2 objectAtIndex:i]]];
	}
	
	[newCustomer setValue:[ie text] forKey:@"ie"];
	[newCustomer setValue:[ffox text] forKey:@"ffox"];
	[newCustomer setValue:[chrome text] forKey:@"chrome"];
	[newCustomer setValue:[broOther text] forKey:@"broOther"];
	[newCustomer setValue:[broOtherRes text] forKey:@"broOtherRes"];
	[newCustomer setValue:[java text] forKey:@"java"];
	[newCustomer setValue:[flash text] forKey:@"flash"];
	[newCustomer setValue:[reader text] forKey:@"reader"];
	[newCustomer setValue:[update text] forKey:@"update"];
	[newCustomer setValue:[other text] forKey:@"other"];
	[newCustomer setValue:[conclusion text] forKey:@"conclusion"];
	[newCustomer setValue:[labor text] forKey:@"labor"];
	[newCustomer setValue:[parts text] forKey:@"parts"];
	[newCustomer setValue:[tax text] forKey:@"tax"];
	[newCustomer setValue:[final text] forKey:@"final"];
	
	owner.text = @"";
	phone.text = @"";
	city.text = @"";
	email.text = @"";
	modelNo.text = @"";
	serialNo.text = @"";
	modelNo.text = @"";
	problem.text = @"";
	spyBlas.text = @"";
	malBytes.text = @"";
	rootKit.text = @"";
	antiVirus.text = @"";
	antiVirus2.text = @"";
	firewall.text = @"";
	problem.text = @"";
	
	hdLoc.text = @"";
	hdTotMem.text = @"";
	hdUseMem.text = @"";
	hdFreeMem.text = @"";
	bs.text = @"";
	bsRes.text = @"";
	cclean.text = @"";
	defrag.text = @"";
	start.text = @"";
	progRem.text = @"";
	softAdd.text = @"";
	firewall.text = @"";
	
	[memTest2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[hd2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[pcDiag2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[driveUp2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[winStress2 setSelectedSegmentIndex:UISegmentedControlNoSegment];
	hdOther.text = @"";
	hdOtherRes.text = @"";
	startDate.text = @"";
	remoteID.text = @"";
	remotePass.text = @"";
	
	for (int i = 0; i < [remoteMonth count]; i++) 
	{
		[[remoteMonth objectAtIndex:i] setBackgroundColor:[UIColor blueColor]];
	}
	[remoteMonth2 removeAllObjects];
	
	ie.text = @"";
	ffox.text = @"";
	chrome.text = @"";
	broOther.text = @"";
	broOtherRes.text = @"";
	java.text = @"";
	flash.text = @"";
	reader.text = @"";
	update.text = @"";
	other.text = @"";
	conclusion.text = @"";
	labor.text = @"";
	parts.text = @"";
	tax.text = @"";
	final.text = @"";
	
	NSError *error;
	[context save:&error];
}

-(void) displayReport:(NSIndexPath *)curInd
{
	NSManagedObject *matches = nil;
	
	if ([foundReps count] != 0) 
	{
			matches = [foundReps objectAtIndex:[curInd section]];
			
			[owner setText:[matches valueForKey:@"owner"]];
			[phone setText:[matches valueForKey:@"phone"]];
			[city setText:[matches valueForKey:@"city"]];
			[email setText:[matches valueForKey:@"email"]];
			[spyBlas setText:[matches valueForKey:@"spyBlas"]];
			[antiVirus setText:[matches valueForKey:@"antiVirus"]];
			[antiVirus2 setText:[matches valueForKey:@"antiVirus2"]];
			[modelNo setText:[matches valueForKey:@"modelNo"]];
			[serialNo setText:[matches valueForKey:@"serialNo"]];
			[malBytes setText:[matches valueForKey:@"malBytes"]];
			[rootKit setText:[matches valueForKey:@"rootKit"]];
			[firewall setText:[matches valueForKey:@"firewall"]];
			[problem setText:[matches valueForKey:@"problem"]];
			
			[hdLoc setText:[matches valueForKey:@"hdLoc"]];
			[hdTotMem setText:[matches valueForKey:@"hdTotMem"]];
			[hdUseMem setText:[matches valueForKey:@"hdUseMem"]];
			[hdFreeMem setText:[matches valueForKey:@"hdFreeMem"]];
			[bs setText:[matches valueForKey:@"bs"]];
			[bsRes setText:[matches valueForKey:@"bsRes"]];
			[cclean setText:[matches valueForKey:@"cclean"]];
			[defrag setText:[matches valueForKey:@"defrag"]];
			[start setText:[matches valueForKey:@"start"]];
			[progRem setText:[matches valueForKey:@"progRem"]];
			[softAdd setText:[matches valueForKey:@"softAdd"]];
			
			[[memTest titleLabel] setText:[matches valueForKey:@"memTest"]];
			if ([[[memTest titleLabel] text] isEqualToString:@"Pass"])
			{
				[memTest setBackgroundColor:[UIColor greenColor]];
				[memTest2 setSelectedSegmentIndex:0];
			}
			else if ([[[memTest titleLabel] text] isEqualToString:@"Fail"])
			{
				[memTest setBackgroundColor:[UIColor redColor]];
				[memTest2 setSelectedSegmentIndex:1];
			}
			else
			{
				[memTest setBackgroundColor:[UIColor lightTextColor]];
				[memTest2 setSelectedSegmentIndex:2];
			}
		
			[[hd titleLabel] setText:[matches valueForKey:@"hd"]];
			if ([[[hd titleLabel] text] isEqualToString:@"Pass"]) 
			{
				[hd setBackgroundColor:[UIColor greenColor]];
				[hd2 setSelectedSegmentIndex:0];
			}
			else if ([[[hd titleLabel] text] isEqualToString:@"Fail"]) 
			{
				[hd setBackgroundColor:[UIColor redColor]];
				[hd2 setSelectedSegmentIndex:1];
			}
			else
			{
				[hd setBackgroundColor:[UIColor lightTextColor]];
				[hd2 setSelectedSegmentIndex:2];
			}
        
			[[pcDiag titleLabel] setText:[matches valueForKey:@"pcDiag"]];
			if ([[[pcDiag titleLabel] text] isEqualToString:@"Pass"]) 
			{
				[pcDiag setBackgroundColor:[UIColor greenColor]];
				[pcDiag2 setSelectedSegmentIndex:0];
			}
			else if([[[pcDiag titleLabel] text] isEqualToString:@"Fail"]) 
			{
				[pcDiag setBackgroundColor:[UIColor redColor]];
				[pcDiag2 setSelectedSegmentIndex:1];
			}
			else
			{
				[pcDiag setBackgroundColor:[UIColor lightTextColor]];
				[pcDiag2 setSelectedSegmentIndex:2];
			}
		
			[[driveUp titleLabel] setText:[matches valueForKey:@"driveUp"]];
			if ([[[driveUp titleLabel] text] isEqualToString:@"Pass"]) 
			{
				[driveUp setBackgroundColor:[UIColor greenColor]];
				[driveUp2 setSelectedSegmentIndex:0];
			}
			else if([[[driveUp titleLabel] text] isEqualToString:@"Fail"]) 
			{
				[driveUp setBackgroundColor:[UIColor redColor]];
				[driveUp2 setSelectedSegmentIndex:1];
			}
			else
			{
				[driveUp setBackgroundColor:[UIColor lightTextColor]];
				[driveUp2 setSelectedSegmentIndex:2];
			}
		
			[[winStress titleLabel] setText:[matches valueForKey:@"winStress"]];
			if ([[[winStress titleLabel] text] isEqualToString:@"Pass"]) 
			{
				[winStress setBackgroundColor:[UIColor greenColor]];
				[winStress2 setSelectedSegmentIndex:0];
			}
			else if([[[winStress titleLabel] text] isEqualToString:@"Fail"]) 
			{
				[winStress setBackgroundColor:[UIColor redColor]];
				[winStress2 setSelectedSegmentIndex:1];
			}
			else
			{
				[winStress setBackgroundColor:[UIColor lightTextColor]];
				[winStress2 setSelectedSegmentIndex:2];
			}
		
			[hdOther setText:[matches valueForKey:@"hdOther"]];
			[hdOtherRes setText:[matches valueForKey:@"hdOtherRes"]];
			[startDate setText:[matches valueForKey:@"startDate"]];
			[remoteID setText:[matches valueForKey:@"remoteID"]];
			[renewalDate setText:[matches valueForKey:@"renewalDate"]];
			[remotePass setText:[matches valueForKey:@"remotePass"]];
			
			for (int i = 0; i < [remoteMonth count]; i++) 
			{
				NSString *month = [[[remoteMonth objectAtIndex:i] titleLabel] text];
				if ([[matches valueForKey:[NSString stringWithFormat:@"remote%@", month]] boolValue]==YES) 
				{
					[[remoteMonth objectAtIndex:i] setBackgroundColor:[UIColor magentaColor]];
				}
			}
			
			[ie setText:[matches valueForKey:@"ie"]];
			[ffox setText:[matches valueForKey:@"ffox"]];
			[chrome setText:[matches valueForKey:@"chrome"]];
			[broOther setText:[matches valueForKey:@"broOther"]];
			[broOtherRes setText:[matches valueForKey:@"broOtherRes"]];
			[java setText:[matches valueForKey:@"java"]];
			[flash setText:[matches valueForKey:@"flash"]];
			[reader setText:[matches valueForKey:@"reader"]];
			[update setText:[matches valueForKey:@"update"]];
			[other setText:[matches valueForKey:@"other"]];
			[conclusion setText:[matches valueForKey:@"conclusion"]];
			[labor setText:[matches valueForKey:@"labor"]];
			[parts setText:[matches valueForKey:@"parts"]];
			[tax setText:[matches valueForKey:@"tax"]];
			[final setText:[matches valueForKey:@"final"]];
			
		}
}

-(void) setEditable:(BOOL) able
{
	[owner setEnabled:able];
	[phone setEnabled:able];
	[city setEnabled:able];
	[email setEnabled:able];
	[spyBlas setEnabled:able];
	[antiVirus setEnabled:able];
	[antiVirus2 setEnabled:able];
	[modelNo setEnabled:able];
	[serialNo setEnabled:able];
	[malBytes setEnabled:able];
	[rootKit setEnabled:able];
	[firewall setEnabled:able];
	[problem setEditable:able];
	
	[hdLoc setEnabled:able];
	[hdTotMem setEnabled:able];
	[hdUseMem setEnabled:able];
	[hdFreeMem setEnabled:able];
	[bs setEnabled:able];
	[bsRes setEnabled:able];
	[cclean setEnabled:able];
	[defrag setEnabled:able];
	[start setEnabled:able];
	[progRem setEditable:able];
	[softAdd setEditable:able];
	
	[memTest setEnabled:able];
	[hd setEnabled:able];
	[pcDiag setEnabled:able];
	[driveUp setEnabled:able];
	[winStress setEnabled:able];
	[hdOther setEditable:able];
	[hdOtherRes setEnabled:able];
	[startDate setEnabled:able];
	[remoteID setEnabled:able];
	[renewalDate setEnabled:able];
	[remotePass setEnabled:able];
	for (int i = 0; i < [remoteMonth count]; i++) 
	{
		[[remoteMonth objectAtIndex:i] setEnabled:able];
	}
	
	[ie setEnabled:able];
	[ffox setEnabled:able];
	[chrome setEnabled:able];
	[broOther setEnabled:able];
	[broOtherRes setEnabled:able];
	[java setEnabled:able];
	[flash setEnabled:able];
	[reader setEnabled:able];
	[update setEnabled:able];
	[other setEditable:able];
	[conclusion setEditable:able];
	[labor setEnabled:able];
	[parts setEnabled:able];
	[tax setEnabled:able];
	[final setEnabled:able];
	
	[delete1 setEnabled:able];
	[delete2 setEnabled:able];
}

-(void)gotoRes
{
	[search setHidden:YES];
	[results1 setHidden:NO];
	[results2 setHidden:YES];
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

-(IBAction)calcFinal
{
	double totCost = [[labor text] doubleValue] + [[parts text] doubleValue];
	double totTax = [[tax text] doubleValue] + 1;
	totCost = totCost * totTax;
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle: NSNumberFormatterCurrencyStyle];  
	
	[final setText:[formatter stringFromNumber:[NSNumber numberWithDouble:totCost]]];
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
	
	self.memTest2 = nil;
	self.hd2 = nil;
	self.pcDiag2 = nil;
	self.driveUp2 = nil;
	self.winStress2 = nil;
	
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
	passFail = nil;
	
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
	
	self.search = nil;
	self.results1 = nil;
	self.results2 = nil;
	self.edit = nil;
}



@end

