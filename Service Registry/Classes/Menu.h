//
//  Menu.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"
//#import "GTMOAuth2ViewControllerTouch.h"
//#import "GData.h"

@interface Menu : UIViewController {

	Service_RegistryAppDelegate *appDelegate;
	
	NSString *kDocsKeychainItemName;
	
	IBOutlet UIImageView *compLogo;
	IBOutlet UILabel *compName;
}

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet NSString *kDocsKeychainItemName;
@property (nonatomic, retain) IBOutlet IBOutlet UIImageView *compLogo;
@property (nonatomic, retain) IBOutlet IBOutlet UILabel *compName;

-(IBAction)Logout;

@end
