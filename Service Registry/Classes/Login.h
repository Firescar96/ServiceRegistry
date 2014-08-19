//
//  Login.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"
#import "UserTable.h"

@interface Login : UIViewController {

	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UITextField *user;
	IBOutlet UITextField *pass;
	
	UserTable *utable;
}

@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet UserTable *utable;

-(IBAction)LoginApp;
-(NSArray *)findUser:(NSString *)query;

@end
