//
//  UserTable.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"

@interface UserTable : UITableViewController<UITableViewDataSource, UITableViewDelegate> {
	
	
	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UITableView *tvStatus;
	
	NSMutableArray *foundUsers;
	
	NSMutableArray *users;
	NSMutableArray *types;
	
	IBOutlet UITextField *user;
	IBOutlet UISegmentedControl *type;
	IBOutlet UITextField *pass;

	IBOutlet UIBarButtonItem *delete1;
}
@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;

@property (nonatomic, retain) IBOutlet UITableView *tvStatus;

@property (nonatomic, retain) NSMutableArray *users;
@property (nonatomic, retain) NSMutableArray *types;

@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *delete1;

-(IBAction)backgroundTouched:(id)sender;

-(void) findUser:(NSString *)query;
-(IBAction)saveData;
-(IBAction)deleteData;
-(IBAction) changeEdit;
-(void) setEditable: (BOOL) able;

@end
