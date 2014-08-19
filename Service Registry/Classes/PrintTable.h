//
//  ReportsTable.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"

@interface PrintTable : UITableViewController<UITableViewDataSource, UITableViewDelegate, UIPrintInteractionControllerDelegate> {
	
	
	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UITableView *tvStatus;
	IBOutlet UIPickerView *pvStatus;
	
	NSMutableArray *owners;
	NSMutableArray *emails;
	NSMutableArray *citys;
	NSMutableArray *dates;
	NSMutableArray *foundReps;
	
	NSString *date;
	
	//Page 1
	NSString *owner;
	NSString *phone;
	NSString *city;
	NSString *email;
	NSString *modelNo;
	NSString *serialNo;
	NSString *spyBlas;
	NSString *malBytes;
	NSString *rootKit;
	NSString *firewall;
	NSString *antiVirus;
	NSString *antiVirus2;
	NSString *problem;

	NSString *hdLoc;
	NSString *hdTotMem;
	NSString *hdUseMem;
	NSString *hdFreeMem;
	NSString *bs;
	NSString *bsRes;
	NSString *cclean;
	NSString *defrag;
	NSString *start;
	NSString *progRem;
	NSString *softAdd;
	
	//Page 2
	NSString *memTest;
	NSString *hd;
	NSString *pcDiag;
	NSString *driveUp;
	NSString *winStress;
	NSString *hdOther;
	NSString *hdOtherRes;
	NSString *startDate;
	NSString *remoteID;
	NSString *renewalDate;
	NSString *remotePass;
	NSMutableArray *remoteMonth;
	
	NSString *ie;
	NSString *ffox;
	NSString *chrome;
	NSString *broOther;
	NSString *broOtherRes;
	NSString *java;
	NSString *flash;
	NSString *reader;
	NSString *update;
	NSString *other;
	NSString *conclusion;
	NSString *labor;
	NSString *parts;
	NSString *tax;
	NSString *final;
}

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;

@property (nonatomic, retain) IBOutlet UITableView *tvStatus;
@property (nonatomic, retain) IBOutlet UIPickerView *pvStatus;

@property (nonatomic, retain) NSMutableArray *owners;
@property (nonatomic, retain) NSMutableArray *emails;
@property (nonatomic, retain) NSMutableArray *citys;
@property (nonatomic, retain) NSMutableArray *dates;
@property (nonatomic, retain) NSMutableArray *foundReps;

@property (nonatomic, retain) NSString *date;

@property (nonatomic, retain) NSString *owner;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *modelNo;
@property (nonatomic, retain) NSString *serialNo;
@property (nonatomic, retain) NSString *spyBlas;
@property (nonatomic, retain) NSString *malBytes;
@property (nonatomic, retain) NSString *rootKit;
@property (nonatomic, retain) NSString *firewall;
@property (nonatomic, retain) NSString *antiVirus;
@property (nonatomic, retain) NSString *antiVirus2;
@property (nonatomic, retain) NSString *problem;

@property (nonatomic, retain) NSString *hdLoc;
@property (nonatomic, retain) NSString *hdTotMem;
@property (nonatomic, retain) NSString *hdUseMem;
@property (nonatomic, retain) NSString *hdFreeMem;
@property (nonatomic, retain) NSString *bs;
@property (nonatomic, retain) NSString *bsRes;
@property (nonatomic, retain) NSString *cclean;
@property (nonatomic, retain) NSString *defrag;
@property (nonatomic, retain) NSString *start;
@property (nonatomic, retain) NSString *progRem;
@property (nonatomic, retain) NSString *softAdd;

@property (nonatomic, retain) NSString *memTest;
@property (nonatomic, retain) NSString *hd;
@property (nonatomic, retain) NSString *pcDiag;
@property (nonatomic, retain) NSString *driveUp;
@property (nonatomic, retain) NSString *winStress;
@property (nonatomic, retain) NSString *hdOther;
@property (nonatomic, retain) NSString *hdOtherRes;
@property (nonatomic, retain) NSString *startDate;
@property (nonatomic, retain) NSString *remoteID;
@property (nonatomic, retain) NSString *renewalDate;
@property (nonatomic, retain) NSString *remotePass;
@property (nonatomic, retain) NSMutableArray *remoteMonth;

@property (nonatomic, retain) NSString *ie;
@property (nonatomic, retain) NSString *ffox;
@property (nonatomic, retain) NSString *chrome;
@property (nonatomic, retain) NSString *broOther;
@property (nonatomic, retain) NSString *broOtherRes;
@property (nonatomic, retain) NSString *java;
@property (nonatomic, retain) NSString *flash;
@property (nonatomic, retain) NSString *reader;
@property (nonatomic, retain) NSString *update;
@property (nonatomic, retain) NSString *other;
@property (nonatomic, retain) NSString *conclusion;
@property (nonatomic, retain) NSString *labor;
@property (nonatomic, retain) NSString *parts;
@property (nonatomic, retain) NSString *tax;
@property (nonatomic, retain) NSString *final;

-(void) findCustomer:(NSString *)query;
-(void) setReport:(NSIndexPath *)curInd;

@end
