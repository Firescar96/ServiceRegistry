//
//  UserTable.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "UserTable.h"
#import "Service_RegistryAppDelegate.h"

@implementation UserTable

@synthesize appDelegate;

@synthesize tvStatus;

@synthesize users;
@synthesize types;

@synthesize user;
@synthesize pass;

@synthesize delete1;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	foundUsers = [[NSMutableArray alloc] init];
	
	users = [[NSMutableArray alloc] init];
	types = [[NSMutableArray alloc] init];
}


-(IBAction)backgroundTouched:(id)sender
{
	[user resignFirstResponder];
	[pass resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)sender
{
	[sender resignFirstResponder];
} 

#pragma mark -
#pragma mark Table view data source

 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
  //Return the number of sections.
 return [users count];
 }
 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderinSection:(NSInteger)section 
{
    // Return the title of the section.
    return [NSString stringWithFormat:@"%@",[users objectAtIndex:section]];
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
		
		cell.textLabel.text = [NSString stringWithFormat:@"%@",[users objectAtIndex:[indexPath section]]];
	}
	else if ([indexPath row] == 1) 
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIColor *backColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.backgroundColor = backColor;
		UIColor *foreColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		cell.textLabel.textColor = foreColor;
		
		cell.textLabel.text = [NSString stringWithFormat:@"Type: %@",
		 [types objectAtIndex:[indexPath section]]];
	}
    return cell;
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
	
	[self changeEdit];
}

-(void) changeEdit
{
	if ([[appDelegate type] isEqualToString:@"admin"])//implement service registry variable for system user is admin 
		[self setEditable:YES];

	else
		[self setEditable:NO];
}

-(void) setEditable:(BOOL) able
{
	[user setEnabled:able];
	[type setEnabled:able];
	[pass setEnabled:able];
	
	[delete1 setEnabled:able];
}

- (IBAction) saveData
{
	if ([user text] == nil) 
		return;
	
	if (![appDelegate.type isEqualToString:@"admin"]) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Unauthorized Access"
													   message: @"You do not have sufficient account priviliges for to create an account."
													  delegate: self
											 cancelButtonTitle:@"Cancel"
											 otherButtonTitles:nil];
		
		
		[alert show];
		return;
	}
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"User" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(type CONTAINS[nc] 'admin')"]];
	[request setPredicate:predicate];
	
	NSError *error;
	NSArray *array = [context executeFetchRequest:request error:&error];
	
	for (int i = 0; i<[array count]; i++) 
	{
		if ([[[array objectAtIndex:i] valueForKey:@"user"] isEqualToString:[user text]]) 
		{
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Duplicate User"
														   message: @"An account with the specified username already exists"
														  delegate: self
												 cancelButtonTitle:@"Cancel"
												 otherButtonTitles:nil];
			
			
			[alert show];
			return;
		}
	}
	
	NSManagedObject *newUser = [NSEntityDescription 
				   insertNewObjectForEntityForName:@"User"
				   inManagedObjectContext:context];

	[newUser setValue:[user text] forKey:@"user"];
	[newUser setValue:[pass text] forKey:@"pass"];
	
	if ([type selectedSegmentIndex] == 0)
		[newUser setValue:@"admin" forKey:@"type"];
	else
		[newUser setValue:@"standard" forKey:@"type"];
	
	user.text = @"";
	pass.text = @"";
	[type setSelectedSegmentIndex:1];
	
	[self backgroundTouched:nil];
	
	[context save:&error];
}

- (IBAction) deleteData
{	
	if (![appDelegate.type isEqualToString:@"admin"]) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Unauthorized Access"
													   message: @"You do not have sufficient account priviliges for to delete an account."
													  delegate: self
											 cancelButtonTitle:@"Cancel"
											 otherButtonTitles:nil];
		
		
		[alert show];
		return;
	}
	
	if ([[[foundUsers objectAtIndex:[[tvStatus indexPathForSelectedRow] section]] valueForKey:@"user"] isEqualToString:appDelegate.username]) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Paradoxical Deletion"
													   message: @"You cannot delte your own account."
													  delegate: self
											 cancelButtonTitle:@"Cancel"
											 otherButtonTitles:nil];
		
		
		[alert show];
		return;
	}
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"User" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(type CONTAINS[nc] 'admin')"]];
	[request setPredicate:predicate];
	
	NSError *error;
	NSArray *array = [context executeFetchRequest:request error:&error];
	
	if ([array count] == 1 && [[[foundUsers objectAtIndex:[[tvStatus indexPathForSelectedRow] section]] valueForKey:@"type"] isEqualToString:@"admin"]) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Last Admin"
													   message: @"You can't delete the only admin account"
													  delegate: self
											 cancelButtonTitle:@"Cancel"
											 otherButtonTitles:nil];
		
		
		[alert show];
		return;
	}
	
	if ([tvStatus indexPathForSelectedRow] == nil) {
		return;
	}
	
	NSManagedObject *deleteCustomer=[foundUsers objectAtIndex:[[tvStatus indexPathForSelectedRow] section]];
		
	[context deleteObject:deleteCustomer];
	[foundUsers removeObjectAtIndex:[[tvStatus indexPathForSelectedRow] section]];
	[users removeObjectAtIndex:[[tvStatus indexPathForSelectedRow] section]];
	[types removeObjectAtIndex:[[tvStatus indexPathForSelectedRow] section]];
	[tvStatus reloadData];
}

#pragma mark -
#pragma mark Memory management

-(void) findUser:(NSString *)query
{
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
		entityForName:@"User" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	if(![query isEqual:nil] && ![query isEqualToString:@""] && ![query isEqualToString:@" "] && ![query isEqualToString:@"  "])
	{	
		NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(user CONTAINS[nc] '%@')",query]];
		[request setPredicate:predicate];
	}
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[NSString stringWithFormat:@"user"]
																   ascending:YES];
	NSArray *sortDescriptors= [[NSArray alloc] initWithObjects:sortDescriptor , nil];
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	NSManagedObject *matches = nil;
	
	//clear Table
	[users removeAllObjects];
	[types removeAllObjects];
	[tvStatus reloadData];
	
	if ([array count] == 0) 
	{
		foundUsers = nil;
		
		[users addObject:[NSString stringWithFormat:@"Try Again"]];
		[types addObject:[NSString stringWithFormat:@"No Users Found"]];
	} else 
	{
		foundUsers = [[NSMutableArray alloc] initWithArray:array];
		for (int i = 0; i < [array count]; i++) 
		{
			matches = [array objectAtIndex:i];
			[users addObject:[matches valueForKey:@"user"]];
			[types addObject:[matches valueForKey:@"type"]];
		}
	}
	[tvStatus reloadData];
}

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload 
{
    self.users = nil;
	self.types = nil;
	
	self.user = nil;
	self.pass = nil;
}



@end

