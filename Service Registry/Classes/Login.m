    //
//  Login.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "Login.h"


@implementation Login

@synthesize appDelegate;
@synthesize user, pass;
@synthesize utable;

-(IBAction)LoginApp
{
	NSArray *curUsers = [self findUser:[user text]];
	
	if (curUsers == nil) 
	{
		user.text = nil;
		pass.text = nil;
		
		[user resignFirstResponder];
		[pass resignFirstResponder];
		
		return;
	}
	
	NSManagedObject *matches = nil;
	
	for (int i = 0; i < [curUsers count]; i++) 
	{
		matches = [curUsers objectAtIndex:i];
		if ([[matches valueForKey:@"pass"] isEqualToString:[pass text]]) 
		{
			appDelegate.username = [matches valueForKey:@"user"];
			appDelegate.type = [matches valueForKey:@"type"];
			
			if (![[user text] isEqualToString:@"admin"] && ![[pass text] isEqualToString:@"123456"]) 
			{
				user.text = nil;
				pass.text = nil;
			}
			[user resignFirstResponder];
			[pass resignFirstResponder];
			
			[utable changeEdit];
			
			[appDelegate gotoMenu];
		}
	}
}

-(NSArray*) findUser:(NSString *)query
{
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"User" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(user CONTAINS[nc] '%@')",query]];
	[request setPredicate:predicate];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[NSString stringWithFormat:@"user"]
																   ascending:YES];
	NSArray *sortDescriptors= [[NSArray alloc] initWithObjects:sortDescriptor , nil];
	[request setSortDescriptors:sortDescriptors];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	if ([array count] == 0) 
		return nil;
	else 
		return array;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	NSManagedObjectContext *moc = [appDelegate managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"User" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat:@"(type CONTAINS[nc] 'admin')"]];
	[request setPredicate:predicate];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	BOOL found = false;
	
	if ([array count] == 0) 
	{
		NSManagedObject *newUser = [NSEntityDescription 
									insertNewObjectForEntityForName:@"User"
									inManagedObjectContext:moc];
		
		[newUser setValue:@"admin" forKey:@"user"];
		[newUser setValue:@"123456" forKey:@"pass"];
		[newUser setValue:@"admin" forKey:@"type"];
		
		user.text = @"admin";
		pass.text = @"123456";
		
		NSError *error;
		[moc save:&error];
		
	}
	else if([[[array objectAtIndex:0] valueForKey:@"user"] isEqualToString:@"admin"] && [[[array objectAtIndex:0] valueForKey:@"pass"] isEqualToString:@"123456"])
	{
		for (int i = 0; i< [array count]; i++) {
			if([[[array objectAtIndex:i] valueForKey:@"user"] isEqualToString:@"admin"] && [[[array objectAtIndex:i] valueForKey:@"pass"] isEqualToString:@"123456"])
			{
				found = true;
				break;
			}
		}
	}
		if(found == true)
		{
			user.text = @"admin";
			pass.text = @"123456";
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
