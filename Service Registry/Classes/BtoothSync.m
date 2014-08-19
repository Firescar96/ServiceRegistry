    //
//  BtoothSync.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "BtoothSync.h"


@implementation BtoothSync

@synthesize currentSession;
@synthesize appDelegate;
@synthesize connect;
@synthesize send;

-(IBAction) btnConnect:(id) sender {
    picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;      
	
    [connect setHidden:YES];
    [send setHidden:NO];    
    [picker show];    
}


- (void)viewDidLoad {    
    [super viewDidLoad];
	[connect setHidden:NO];
    [send setHidden:YES];
}

- (void)peerPickerController:(GKPeerPickerController *)curpicker 
              didConnectPeer:(NSString *)peerID 
                   toSession:(GKSession *) session 
{
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler:self withContext:nil];
	picker.delegate = nil;
	
    [picker dismiss];
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)curPicker
{
    picker.delegate = nil;
    
    [connect setHidden:NO];
    [send setHidden:YES];
}

- (void)session:(GKSession *)session 
           peer:(NSString *)peerID 
 didChangeState:(GKPeerConnectionState)state 
{
    switch (state)
    {
        case GKPeerStateConnected:
            NSLog(@"connected");
            break;
        case GKPeerStateDisconnected:
            NSLog(@"disconnected");
            currentSession = nil;
            
            [connect setHidden:NO];
            [send setHidden:YES];
            break;
        default:
            break;
    }
}

- (void) sendData
{
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Report" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSError *error;
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	if ([array count] == 0) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"No Data Found"
													   message: @"There were no reports found"
													  delegate: self
											 cancelButtonTitle:@"Continue"
											 otherButtonTitles:nil];
		
		
		[alert show];
	} else 
	{
		NSString *error;
		NSData *data = [NSPropertyListSerialization dataFromPropertyList:array format:NSPropertyListBinaryFormat_v1_0 errorDescription:&error];
		
		if (currentSession) 
			[self.currentSession sendDataToAllPeers:data 
									   withDataMode:GKSendDataReliable 
											  error:nil]; 
	}
}

- (void) receiveData:(NSData *)data		   fromPeer:(NSString *)peer 
           inSession:(GKSession *)session	context:(void *)context 
{
	
    NSMutableArray *otherArray;
	NSError *error;
    otherArray = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListMutableContainersAndLeaves format:nil error:&error];
    
	
	NSManagedObjectContext *moc = [appDelegate
								   managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Report" inManagedObjectContext:moc];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSArray *array = [moc executeFetchRequest:request error:&error];
	
	BOOL storeChange = NO;
	for(NSManagedObject *newData in otherArray)
	{
		for(NSManagedObject __strong *oldData in array)
		{
			if ([[newData valueForKey:@"owner"] isEqualToString:[oldData valueForKey:@"owner"]] && [[newData valueForKey:@"date"] isEqualToString:[oldData valueForKey:@"date"]]) 
			{
				oldData = newData;
				storeChange = YES;
			}
			else 
			{
				NSManagedObject *newCustomer=nil;
				newCustomer = [NSEntityDescription
							   insertNewObjectForEntityForName:@"Report"
							   inManagedObjectContext:CFBridgingRelease(context)];//TODO See if the fix worked for error
				[newCustomer setValue:[oldData valueForKey:@"owner"] forKey:@"owner"];
				[newCustomer setValue:[oldData valueForKey:@"phone"] forKey:@"phone"];
				[newCustomer setValue:[oldData valueForKey:@"city"] forKey:@"city"];
				[newCustomer setValue:[oldData valueForKey:@"email"] forKey:@"email"];
				[newCustomer setValue:[oldData valueForKey:@"modelNo"] forKey:@"modelNo"];
				[newCustomer setValue:[oldData valueForKey:@"serialNo"] forKey:@"serialNo"];
				[newCustomer setValue:[oldData valueForKey:@"problem"] forKey:@"problem"];
				[newCustomer setValue:[oldData valueForKey:@"spyBlas"] forKey:@"spyBlas"];
				[newCustomer setValue:[oldData valueForKey:@"malBytes"] forKey:@"malBytes"];
				[newCustomer setValue:[oldData valueForKey:@"rootKit"] forKey:@"rootKit"];
				[newCustomer setValue:[oldData valueForKey:@"antiVirus"] forKey:@"antiVirus"];
				[newCustomer setValue:[oldData valueForKey:@"antiVirus2"] forKey:@"antiVirus2"];
				[newCustomer setValue:[oldData valueForKey:@"firewall"] forKey:@"firewall"];
				
				[newCustomer setValue:[oldData valueForKey:@"hdLoc"] forKey:@"hdLoc"];
				[newCustomer setValue:[oldData valueForKey:@"hdTotMem"] forKey:@"hdTotMem"];
				[newCustomer setValue:[oldData valueForKey:@"hdUseMem"] forKey:@"hdUseMem"];
				[newCustomer setValue:[oldData valueForKey:@"hdFreeMem"] forKey:@"hdFreeMem"];
				[newCustomer setValue:[oldData valueForKey:@"bs"] forKey:@"bs"];
				[newCustomer setValue:[oldData valueForKey:@"bsRes"] forKey:@"bsRes"];
				[newCustomer setValue:[oldData valueForKey:@"cclean"] forKey:@"cclean"];
				[newCustomer setValue:[oldData valueForKey:@"defrag"] forKey:@"defrag"];
				[newCustomer setValue:[oldData valueForKey:@"start"] forKey:@"start"];
				[newCustomer setValue:[oldData valueForKey:@"progRem"] forKey:@"progRem"];
				[newCustomer setValue:[oldData valueForKey:@"softAdd"] forKey:@"softAdd"];
				
				[newCustomer setValue:[oldData valueForKey:@"memTest"] forKey:@"memTest"];
				[newCustomer setValue:[oldData valueForKey:@"hd"] forKey:@"hd"];
				[newCustomer setValue:[oldData valueForKey:@"pcDiag"] forKey:@"pcDiag"];
				[newCustomer setValue:[oldData valueForKey:@"driveUp"] forKey:@"driveUp"];
				[newCustomer setValue:[oldData valueForKey:@"winStress"] forKey:@"winStress"];
				[newCustomer setValue:[oldData valueForKey:@"hdOther"] forKey:@"hdOther"];
				[newCustomer setValue:[oldData valueForKey:@"hdOtherRes"] forKey:@"hdOtherRes"];
				[newCustomer setValue:[oldData valueForKey:@"startDate"] forKey:@"startDate"];
				[newCustomer setValue:[oldData valueForKey:@"remoteID"] forKey:@"remoteID"];
				[newCustomer setValue:[oldData valueForKey:@"renewalDate"] forKey:@"renewalDate"];
				[newCustomer setValue:[oldData valueForKey:@"remotePass"] forKey:@"remotePass"];
				[newCustomer setValue:[oldData valueForKey:@"start"] forKey:@"start"];
				
				[newCustomer setValue:[oldData valueForKey:@"remoteJan"] forKey:@"remoteJan"];
				[newCustomer setValue:[oldData valueForKey:@"remoteFeb"] forKey:@"remoteFeb"];
				[newCustomer setValue:[oldData valueForKey:@"remoteMar"] forKey:@"remoteMar"];
				[newCustomer setValue:[oldData valueForKey:@"remoteApr"] forKey:@"remoteApr"];
				[newCustomer setValue:[oldData valueForKey:@"remoteMay"] forKey:@"remoteMay"];
				[newCustomer setValue:[oldData valueForKey:@"remoteJun"] forKey:@"remoteJun"];
				[newCustomer setValue:[oldData valueForKey:@"remoteJuly"] forKey:@"remoteJuly"];
				[newCustomer setValue:[oldData valueForKey:@"remoteAug"] forKey:@"remoteAug"];
				[newCustomer setValue:[oldData valueForKey:@"remoteSept"] forKey:@"remoteSept"];
				[newCustomer setValue:[oldData valueForKey:@"remoteOct"] forKey:@"remoteOct"];
				[newCustomer setValue:[oldData valueForKey:@"remoteNov"] forKey:@"remoteNov"];
				[newCustomer setValue:[oldData valueForKey:@"remoteDec"] forKey:@"remoteDec"];
				
				[newCustomer setValue:[oldData valueForKey:@"ie"] forKey:@"ie"];
				[newCustomer setValue:[oldData valueForKey:@"ffox"] forKey:@"ffox"];
				[newCustomer setValue:[oldData valueForKey:@"chrome"] forKey:@"chrome"];
				[newCustomer setValue:[oldData valueForKey:@"broOther"] forKey:@"broOther"];
				[newCustomer setValue:[oldData valueForKey:@"broOtherRes"] forKey:@"broOtherRes"];
				[newCustomer setValue:[oldData valueForKey:@"java"] forKey:@"java"];
				[newCustomer setValue:[oldData valueForKey:@"flash"] forKey:@"flash"];
				[newCustomer setValue:[oldData valueForKey:@"reader"] forKey:@"reader"];
				[newCustomer setValue:[oldData valueForKey:@"update"] forKey:@"update"];
				[newCustomer setValue:[oldData valueForKey:@"other"] forKey:@"other"];
				[newCustomer setValue:[oldData valueForKey:@"conclusion"] forKey:@"conclusion"];
				[newCustomer setValue:[oldData valueForKey:@"labor"] forKey:@"labor"];
				[newCustomer setValue:[oldData valueForKey:@"parts"] forKey:@"parts"];
				[newCustomer setValue:[oldData valueForKey:@"tax"] forKey:@"tax"];
				[newCustomer setValue:[oldData valueForKey:@"final"] forKey:@"final"];
				
				[newCustomer setValue:[oldData valueForKey:@"date"]forKey:@"date"];
				
				[moc save:&error];
			}

		}
	}
	
	if (storeChange)
		[moc save:&error];
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


@end
