//
//  Menu.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "Menu.h"

static NSString *const kDocsClientID = @"716774369179.apps.googleusercontent.com";
static NSString *const kDocsClientSecret = @"D5XYW6aUpbRjzD485xhSmojB";

@implementation Menu

@synthesize appDelegate;
@synthesize kDocsKeychainItemName;
@synthesize compLogo;
@synthesize compName;

- (void)viewDidLoad {
    
	[super viewDidLoad];
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Company" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSError *error;
	NSArray *array = [context executeFetchRequest:request error:&error];
	
	if ([array count] == 0) 
	{
		NSManagedObject *newUser = [NSEntityDescription 
									insertNewObjectForEntityForName:@"Company"
									inManagedObjectContext:context];
		
		[newUser setValue:@"The Computer Guy-Joe" forKey:@"name"];
		[compName setText:@"The Computer Guy-Joe"];
		
		NSData *imageVal = UIImagePNGRepresentation([UIImage imageNamed:@"thecomputerguylogo.png"]);
		[newUser setValue:imageVal forKey:@"image"];
		[compLogo setImage:[UIImage imageNamed:@"thecomputerguylogo.png"]];
	}
	else 
	{
		NSManagedObject *match =[array objectAtIndex:0];
		
		[compName setText:[match valueForKey:@"name"]];
		[compLogo setImage:[UIImage imageWithData:[match valueForKey:@"image"]]];
	}

	kDocsKeychainItemName = [NSString stringWithFormat:@"Service Registry %@",[appDelegate username]];
	
	[context save:&error];
}

-(IBAction)Logout
{	
	appDelegate.username = nil;
	appDelegate.type = nil;
	
	[appDelegate gotoLogin];
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
