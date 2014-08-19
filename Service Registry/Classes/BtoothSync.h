//
//  BtoothSync.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "Service_RegistryAppDelegate.h"

@interface BtoothSync : UIViewController<GKPeerPickerControllerDelegate, GKSessionDelegate> {

	GKSession *currentSession;
    GKPeerPickerController *picker;
	
	Service_RegistryAppDelegate *appDelegate;
	
    IBOutlet UIButton *connect;
    IBOutlet UIButton *send;
}

@property (nonatomic, retain) GKSession *currentSession;

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;

@property (nonatomic, retain) UIButton *connect;
@property (nonatomic, retain) UIButton *send;

-(IBAction) sendData;
-(IBAction) btnConnect:(id) sender;

@end
