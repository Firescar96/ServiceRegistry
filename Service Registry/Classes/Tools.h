//
//  Tools.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service_RegistryAppDelegate.h"
#import "Menu.h"

@interface Tools : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPopoverControllerDelegate> {

	Service_RegistryAppDelegate *appDelegate;
	Menu *menu;
	
	IBOutlet UIWindow *tools;
	IBOutlet UIWindow *TView;
	
	IBOutlet UIImageView *selectedImage;
	BOOL newImg;
	IBOutlet UITextField *comName;
	BOOL newName;
    
    UIPopoverController *popCon;
}
@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet Menu *menu;

@property (nonatomic, retain) IBOutlet UIWindow *tools;
@property (nonatomic, retain) IBOutlet UIWindow *TView;
@property (nonatomic, retain) IBOutlet UIImageView *selectedImage;
@property (nonatomic, retain) IBOutlet IBOutlet UITextField *comName;

@property (nonatomic, retain) IBOutlet UIPopoverController *popCon;

- (IBAction)backgroundTouched:(id)sender;
- (void) updateComInfo;
- (IBAction) buttonClicked;
- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
							   usingDelegate: (id <UIImagePickerControllerDelegate,
											   UINavigationControllerDelegate>) delegate;
-(IBAction) gotoMenu;
@end
