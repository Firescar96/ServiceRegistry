//
//  Service_RegistryAppDelegate.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface Service_RegistryAppDelegate : UIResponder <UIApplicationDelegate> {

	IBOutlet UIWindow *Login;
	IBOutlet UIWindow *Menu; 
	IBOutlet UIWindow *Reports;
	IBOutlet UIWindow *NewRep;
	IBOutlet UIWindow *BlueSync;
	IBOutlet UIWindow *DocSync;
	IBOutlet UIWindow *Tools;
	IBOutlet UIWindow *Print;
	
	NSMutableString *username;
	NSString *type;
	
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet UIWindow *Login;
@property (nonatomic, retain) IBOutlet UIWindow *Menu;
@property (nonatomic, retain) IBOutlet UIWindow *Reports;
@property (nonatomic, retain) IBOutlet UIWindow *NewRep;
@property (nonatomic, retain) IBOutlet UIWindow *BlueSync;
@property (nonatomic, retain) IBOutlet UIWindow *DocSync;
@property (nonatomic, retain) IBOutlet UIWindow *Tools;
@property (nonatomic, retain) IBOutlet UIWindow *Print;

@property (retain) IBOutlet NSString *username;
@property (retain) IBOutlet NSString *type;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

-(IBAction)gotoLogin;
-(IBAction)gotoMenu;
-(IBAction)gotoReports;
-(IBAction)gotoNewRep;
-(IBAction)gotoBlueSync;
-(IBAction)gotoDocSync;
-(IBAction)gotoTools;
-(IBAction)gotoPrint;

@end

