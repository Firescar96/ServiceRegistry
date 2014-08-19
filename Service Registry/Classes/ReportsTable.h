//
//  ReportsTable.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"

@interface ReportsTable : UITableViewController<UITableViewDataSource, UITableViewDelegate> {
	
	
	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UITableView *tvStatus;
	IBOutlet UIPickerView *pvStatus;
	
	IBOutlet UIViewController *rpStat;
	
	NSMutableArray *owners;
	NSMutableArray *emails;
	NSMutableArray *citys;
	NSMutableArray *dates;
	NSMutableArray *foundReps;
	
	//Page 1
	IBOutlet UITextField *owner;
	IBOutlet UITextField *phone;
	IBOutlet UITextField *city;
	IBOutlet UITextField *email;
	IBOutlet UITextField *modelNo;
	IBOutlet UITextField *serialNo;
	IBOutlet UITextField *spyBlas;
	IBOutlet UITextField *malBytes;
	IBOutlet UITextField *rootKit;
	IBOutlet UITextField *firewall;
	IBOutlet UITextField *antiVirus;
	IBOutlet UITextField *antiVirus2;
	IBOutlet UITextView *problem;

	IBOutlet UITextField *hdLoc;
	IBOutlet UITextField *hdTotMem;
	IBOutlet UITextField *hdUseMem;
	IBOutlet UITextField *hdFreeMem;
	IBOutlet UITextField *bs;
	IBOutlet UITextField *bsRes;
	IBOutlet UITextField *cclean;
	IBOutlet UITextField *defrag;
	IBOutlet UITextField *start;
	IBOutlet UITextView *progRem;
	IBOutlet UITextView *softAdd;
	
	//Page 2
	IBOutlet UISegmentedControl *memTest2;
	IBOutlet UISegmentedControl *hd2;
	IBOutlet UISegmentedControl *pcDiag2;
	IBOutlet UISegmentedControl *driveUp2;
	IBOutlet UISegmentedControl *winStress2;
	
	IBOutlet UIButton *memTest;
	IBOutlet UIButton *hd;
	IBOutlet UIButton *pcDiag;
	IBOutlet UIButton *driveUp;
	IBOutlet UIButton *winStress;
	IBOutlet UITextView *hdOther;
	IBOutlet UITextField *hdOtherRes;
	IBOutlet UITextField *startDate;
	IBOutlet UITextField *remoteID;
	IBOutlet UITextField *renewalDate;
	IBOutlet UITextField *remotePass;
	IBOutletCollection(UIButton) NSMutableArray *remoteMonth;
	NSMutableArray *remoteMonth2;
	NSMutableArray *passFail;
	
	IBOutlet UITextField *ie;
	IBOutlet UITextField *ffox;
	IBOutlet UITextField *chrome;
	IBOutlet UITextField *broOther;
	IBOutlet UITextField *broOtherRes;
	IBOutlet UITextField *java;
	IBOutlet UITextField *flash;
	IBOutlet UITextField *reader;
	IBOutlet UITextField *update;
	IBOutlet UITextView *other;
	IBOutlet UITextView *conclusion;
	IBOutlet UITextField *labor;
	IBOutlet UITextField *parts;
	IBOutlet UITextField *tax;
	IBOutlet UITextField *final;
	
	IBOutlet UISwitch *edit;
	IBOutlet UIView *search;
	IBOutlet UIView *results1, *results2;
	
	IBOutlet UIBarButtonItem *delete1;
	IBOutlet UIBarButtonItem *delete2;
}
@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;

@property (nonatomic, retain) IBOutlet UITableView *tvStatus;
@property (nonatomic, retain) IBOutlet UIPickerView *pvStatus;

@property (nonatomic, retain) IBOutlet UIViewController *rpStat;

@property (nonatomic, retain) NSMutableArray *owners;
@property (nonatomic, retain) NSMutableArray *emails;
@property (nonatomic, retain) NSMutableArray *citys;
@property (nonatomic, retain) NSMutableArray *dates;
@property (nonatomic, retain) NSMutableArray *foundReps;

@property (nonatomic, retain) IBOutlet UITextField *owner;
@property (nonatomic, retain) IBOutlet UITextField *phone;
@property (nonatomic, retain) IBOutlet UITextField *city;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *modelNo;
@property (nonatomic, retain) IBOutlet UITextField *serialNo;
@property (nonatomic, retain) IBOutlet UITextField *spyBlas;
@property (nonatomic, retain) IBOutlet UITextField *malBytes;
@property (nonatomic, retain) IBOutlet UITextField *rootKit;
@property (nonatomic, retain) IBOutlet UITextField *firewall;
@property (nonatomic, retain) IBOutlet UITextField *antiVirus;
@property (nonatomic, retain) IBOutlet UITextField *antiVirus2;
@property (nonatomic, retain) IBOutlet UITextView *problem;

@property (nonatomic, retain) IBOutlet UITextField *hdLoc;
@property (nonatomic, retain) IBOutlet UITextField *hdTotMem;
@property (nonatomic, retain) IBOutlet UITextField *hdUseMem;
@property (nonatomic, retain) IBOutlet UITextField *hdFreeMem;
@property (nonatomic, retain) IBOutlet UITextField *bs;
@property (nonatomic, retain) IBOutlet UITextField *bsRes;
@property (nonatomic, retain) IBOutlet UITextField *cclean;
@property (nonatomic, retain) IBOutlet UITextField *defrag;
@property (nonatomic, retain) IBOutlet UITextField *start;
@property (nonatomic, retain) IBOutlet UITextView *progRem;
@property (nonatomic, retain) IBOutlet UITextView *softAdd;

@property (nonatomic, retain) IBOutlet UISegmentedControl *memTest2;
@property (nonatomic, retain) IBOutlet UISegmentedControl *hd2;
@property (nonatomic, retain) IBOutlet UISegmentedControl *pcDiag2;
@property (nonatomic, retain) IBOutlet UISegmentedControl *driveUp2;
@property (nonatomic, retain) IBOutlet UISegmentedControl *winStress2;

@property (nonatomic, retain) IBOutlet UIButton *memTest;
@property (nonatomic, retain) IBOutlet UIButton *hd;
@property (nonatomic, retain) IBOutlet UIButton *pcDiag;
@property (nonatomic, retain) IBOutlet UIButton *driveUp;
@property (nonatomic, retain) IBOutlet UIButton *winStress;
@property (nonatomic, retain) IBOutlet UITextView *hdOther;
@property (nonatomic, retain) IBOutlet UITextField *hdOtherRes;
@property (nonatomic, retain) IBOutlet UITextField *startDate;
@property (nonatomic, retain) IBOutlet UITextField *remoteID;
@property (nonatomic, retain) IBOutlet UITextField *renewalDate;
@property (nonatomic, retain) IBOutlet UITextField *remotePass;
@property (nonatomic, retain) IBOutletCollection(UIButton) NSMutableArray *remoteMonth;
@property (nonatomic, retain)  NSMutableArray *remoteMonth2;

@property (nonatomic, retain) IBOutlet UITextField *ie;
@property (nonatomic, retain) IBOutlet UITextField *ffox;
@property (nonatomic, retain) IBOutlet UITextField *chrome;
@property (nonatomic, retain) IBOutlet UITextField *broOther;
@property (nonatomic, retain) IBOutlet UITextField *broOtherRes;
@property (nonatomic, retain) IBOutlet UITextField *java;
@property (nonatomic, retain) IBOutlet UITextField *flash;
@property (nonatomic, retain) IBOutlet UITextField *reader;
@property (nonatomic, retain) IBOutlet UITextField *update;
@property (nonatomic, retain) IBOutlet UITextView *other;
@property (nonatomic, retain) IBOutlet UITextView *conclusion;
@property (nonatomic, retain) IBOutlet UITextField *labor;
@property (nonatomic, retain) IBOutlet UITextField *parts;
@property (nonatomic, retain) IBOutlet UITextField *tax;
@property (nonatomic, retain) IBOutlet UITextField *final;

@property (nonatomic, retain) IBOutlet UISwitch *edit;
@property (nonatomic, retain) IBOutlet UIView *search;
@property (nonatomic, retain) IBOutlet UIView *results1;
@property (nonatomic, retain) IBOutlet UIView *results2;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete1;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete2;

-(IBAction)backgroundTouched:(id)sender;
- (IBAction)buttonClicked:(id)sender;

-(IBAction)calcFinal;

-(void) findCustomer:(NSString *)query;
-(void)saveData;
-(void) displayReport:(NSIndexPath *)curInd;
-(IBAction) changeEdit;
-(void) setEditable: (BOOL) able;
-(void)gotoRes;

@end
