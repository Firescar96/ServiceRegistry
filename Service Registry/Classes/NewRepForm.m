//
//  NewRepForm.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "NewRepForm.h"


@implementation NewRepForm

@synthesize appDelegate;

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

@synthesize page1, page2, page3, page4;

- (void) saveData
{
	if ( !([[owner text] length] > 0)) 
	{
		UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"Save Canceled" 
                                                    message:@"A name of suitable length wasn't given for the owner so save was cancelled" 
												   delegate:self 
										  cancelButtonTitle:@"Ok" 
										  otherButtonTitles: nil];
		
		[alert show];
		
		[self gotoPage1];
		[appDelegate gotoMenu];
		return;
	}
	
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSManagedObject *newCustomer=nil;
	newCustomer = [NSEntityDescription 
		insertNewObjectForEntityForName:@"Report"
		inManagedObjectContext:context];
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
	
	[newCustomer setValue:[passFail objectAtIndex:[memTest selectedSegmentIndex] + 1] forKey:@"memTest"];
	[newCustomer setValue:[passFail objectAtIndex:[hd selectedSegmentIndex] + 1] forKey:@"hd"];
	[newCustomer setValue:[passFail objectAtIndex:[pcDiag selectedSegmentIndex] + 1] forKey:@"pcDiag"];
	[newCustomer setValue:[passFail objectAtIndex:[driveUp selectedSegmentIndex] + 1] forKey:@"driveUp"];
	[newCustomer setValue:[passFail objectAtIndex:[winStress selectedSegmentIndex] + 1] forKey:@"winStress"];
	[newCustomer setValue:[hdOther text] forKey:@"hdOther"];
	[newCustomer setValue:[hdOtherRes text] forKey:@"hdOtherRes"];
	[newCustomer setValue:[startDate text] forKey:@"startDate"];
	[newCustomer setValue:[remoteID text] forKey:@"remoteID"];
	[newCustomer setValue:[renewalDate text] forKey:@"renewalDate"];
	[newCustomer setValue:[remotePass text] forKey:@"remotePass"];
	[newCustomer setValue:[start text] forKey:@"start"];
	
	for (int i = 0; i < [remoteMonth count]; i++) 
	{
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
	[newCustomer setValue:[broOther text] forKey:@"broOtherRes"];
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
	
	NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
	[dateForm setDateStyle:NSDateFormatterShortStyle];
	[dateForm setTimeStyle:NSDateFormatterShortStyle];
	
	[newCustomer setValue:[dateForm stringFromDate:[NSDate date]] forKey:@"date"];
	
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
	
	[memTest setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[hd setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[pcDiag setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[driveUp setSelectedSegmentIndex:UISegmentedControlNoSegment];
	[winStress setSelectedSegmentIndex:UISegmentedControlNoSegment];
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
	
	[self gotoPage1];
	[appDelegate gotoMenu];
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

-(IBAction)textFieldReturn:(id)sender
{
	[sender resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)sender
{
	[sender resignFirstResponder];
} 

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
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

-(void) gotoPage1 
{
	[page1 setHidden:NO];
	[page2 setHidden:YES];
	[page3 setHidden:YES];
	[page4 setHidden:YES];
}

-(void) gotoPage2 
{
	[page1 setHidden:YES];
	[page2 setHidden:NO];
	[page3 setHidden:YES];
	[page4 setHidden:YES];
}

-(void) gotoPage3 
{
	[page1 setHidden:YES];
	[page2 setHidden:YES];
	[page3 setHidden:NO];
	[page4 setHidden:YES];
}

-(void) gotoPage4 
{
	[page1 setHidden:YES];
	[page2 setHidden:YES];
	[page3 setHidden:YES];
	[page4 setHidden:NO];
}


- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	remoteMonth2 = [[NSMutableArray alloc] init];
	passFail = [[NSMutableArray alloc] init];
	[passFail addObject:@"Neutral"];
	[passFail addObject:@"Pass"];
	[passFail addObject:@"Fail"];
	[passFail addObject:@"Neutral"];
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

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
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
	remoteMonth2 = nil;
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
}

@end
