//
//  NewRepForm.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"

@interface NewRepForm : UIViewController<UITextFieldDelegate> {
	
	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UIView *page1;
	IBOutlet UIView *page2;
	IBOutlet UIView *page3;
	IBOutlet UIView *page4;
	
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

	//Page 2
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
	
	//Page 3
	IBOutlet UISegmentedControl *memTest;
	IBOutlet UISegmentedControl *hd;
	IBOutlet UISegmentedControl *pcDiag;
	IBOutlet UISegmentedControl *driveUp;
	IBOutlet UISegmentedControl *winStress;
	IBOutlet UITextView *hdOther;
	IBOutlet UITextField *hdOtherRes;
	IBOutlet UITextField *startDate;
	IBOutlet UITextField *remoteID;
	IBOutlet UITextField *renewalDate;
	IBOutlet UITextField *remotePass;
	IBOutletCollection(UIButton) NSMutableArray *remoteMonth;
	NSMutableArray *remoteMonth2;
	NSMutableArray *passFail;
	
	//Page 4
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
}
@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;

@property (nonatomic, retain) IBOutlet UIView *page1;
@property (nonatomic, retain) IBOutlet UIView *page2;
@property (nonatomic, retain) IBOutlet UIView *page3;
@property (nonatomic, retain) IBOutlet UIView *page4;

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

@property (nonatomic, retain) IBOutlet UISegmentedControl *memTest;
@property (nonatomic, retain) IBOutlet UISegmentedControl *hd;
@property (nonatomic, retain) IBOutlet UISegmentedControl *pcDiag;
@property (nonatomic, retain) IBOutlet UISegmentedControl *driveUp;
@property (nonatomic, retain) IBOutlet UISegmentedControl *winStress;
@property (nonatomic, retain) IBOutlet UITextView *hdOther;
@property (nonatomic, retain) IBOutlet UITextField *hdOtherRes;
@property (nonatomic, retain) IBOutlet UITextField *startDate;
@property (nonatomic, retain) IBOutlet UITextField *remoteID;
@property (nonatomic, retain) IBOutlet UITextField *renewalDate;
@property (nonatomic, retain) IBOutlet UITextField *remotePass;
@property (nonatomic, retain) IBOutletCollection(UIButton) NSMutableArray *remoteMonth;

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

-(IBAction)saveData;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)buttonClicked:(id)sender;
-(IBAction)backgroundTouched:(id)sender;

-(IBAction)calcFinal;

-(IBAction)gotoPage1;
-(IBAction)gotoPage2;
-(IBAction)gotoPage3;
-(IBAction)gotoPage4;
@end
