    //
//  Tools.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "Tools.h"


@implementation Tools

@synthesize appDelegate;
@synthesize menu;

@synthesize selectedImage;
@synthesize tools;
@synthesize TView;
@synthesize comName;

@synthesize popCon;

-(IBAction)backgroundTouched:(id)sender
{
	[comName resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)sender
{
	[sender resignFirstResponder];
} 

-(void) updateComInfo 
{
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Company" inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSError *error;
	NSArray *array = [context executeFetchRequest:request error:&error];
	
	NSManagedObject *matches = nil;

	if (newName) 
	{
		if ([array count] == 0) 
		{
			NSManagedObject *newUser = [NSEntityDescription 
										insertNewObjectForEntityForName:@"Company"
										inManagedObjectContext:context];
			
			[newUser setValue:[comName text] forKey:@"name"];
		} else 
		{
			matches = [array objectAtIndex:0];
			[matches setValue:[comName text] forKey:@"name"];
		}
		[[menu compName] setText:[comName text]];
	}
	
	if(newImg)
	{
		if ([array count] == 0) 
		{
			NSManagedObject *newUser = [NSEntityDescription 
										insertNewObjectForEntityForName:@"Company"
										inManagedObjectContext:context];
			
			NSData *imageVal = UIImagePNGRepresentation([selectedImage image]);
			[newUser setValue:imageVal forKey:@"image"];
		} else 
		{
			matches = [array objectAtIndex:0];
			NSData *imageVal = UIImagePNGRepresentation([selectedImage image]);
			[matches setValue:imageVal forKey:@"image"];
		}
		[[menu compLogo] setImage:[selectedImage image]];
	}
	
	[context save:&error];
}

-(IBAction) buttonClicked {
	
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
	{
		[self startMediaBrowserFromViewController:self usingDelegate:self];
	}
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
							   usingDelegate: (id <UIImagePickerControllerDelegate,
											   UINavigationControllerDelegate>) delegate 
{
	
    if (([UIImagePickerController isSourceTypeAvailable:
		  UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
		|| (delegate == nil)
		|| (controller == nil))
        return NO;
	
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
	[UIImagePickerController availableMediaTypesForSourceType:
	 UIImagePickerControllerSourceTypeSavedPhotosAlbum];
	
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = YES;
	
    mediaUI.delegate = delegate;
	/*
	[tools setHidden:YES];
	[[mediaUI view] setFrame:[[UIScreen mainScreen] bounds]];
    [TView addSubview:[mediaUI view]];
	[TView setHidden:NO];*/
    
    popCon = [[UIPopoverController alloc] initWithContentViewController:mediaUI];
    popCon.delegate = self;
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    [self setContentSizeForViewInPopover:CGSizeMake(320, 320)];
    [popCon presentPopoverFromRect:CGRectMake(screenBound.size.width/4, screenBound.size.height/2, 1, 1)
                                       inView:self.view
                     permittedArrowDirections:UIPopoverArrowDirectionLeft
                                     animated:YES];
    //[self presentViewController:mediaUI animated:YES completion:nil];
    
    return YES;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {
	
	[tools setHidden:NO];
	[TView setHidden:YES];
	
}

- (void)imagePickerController:(UIImagePickerController *) Picker
didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	
	selectedImage.image = [info objectForKey:UIImagePickerControllerEditedImage];
	
	[tools setHidden:NO];
	[TView setHidden:YES];
	
	newImg = YES;
	
}

-(IBAction) gotoMenu
{
	if (![[comName text] isEqual:nil] && ![[comName text] isEqualToString:@""] && ![[comName text] isEqualToString:@" "] && ![[comName text] isEqualToString:@"  "]) 
		newName = YES;
	
	[self updateComInfo];
	
	comName.text = nil;
	selectedImage.image = nil;
	
	newName = NO;
	newImg = NO;
	
	[appDelegate gotoMenu];
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
