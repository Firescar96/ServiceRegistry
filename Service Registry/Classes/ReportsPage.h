//
//  ReportsPage.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportsTable.h"
#import "ReportsSearch.h"

@interface ReportsPage : UIViewController<UITableViewDelegate> {
	
	IBOutlet UIView *search;
	IBOutlet UIView *results1, *results2;

	IBOutlet UISwitch *edit;
	IBOutlet ReportsSearch *rsStat;
	IBOutlet ReportsTable *rtStat;
	
	IBOutlet UIBarButtonItem *delete1;
	IBOutlet UIBarButtonItem *delete2;
}

@property (nonatomic, retain) IBOutlet UIView *search;
@property (nonatomic, retain) IBOutlet UIView *results1;
@property (nonatomic, retain) IBOutlet UIView *results2;

@property (nonatomic, retain) IBOutlet UISwitch *edit;
@property (nonatomic, retain) IBOutlet ReportsSearch *rsStat;
@property (nonatomic, retain) IBOutlet ReportsTable *rtStat;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete1;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete2;

-(IBAction)gotoSearch;
-(IBAction)gotoResults1;
-(IBAction)gotoResults2;
-(IBAction)checkSave;

- (IBAction) deleteData;

@end
