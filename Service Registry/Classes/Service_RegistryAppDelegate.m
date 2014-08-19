//
//  Service_RegistryAppDelegate.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "Service_RegistryAppDelegate.h"


@implementation Service_RegistryAppDelegate

@synthesize Login;
@synthesize Menu;
@synthesize Reports;
@synthesize NewRep;
@synthesize BlueSync;
@synthesize DocSync;
@synthesize Tools;
@synthesize Print;

@synthesize username;
@synthesize type;

-(IBAction)gotoLogin
{
	[Login makeKeyAndVisible];
    [Login setHidden:NO];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[NewRep setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoMenu
{
    [Menu makeKeyAndVisible];
	[Login setHidden:YES];
	[Menu setHidden:NO];
	[Reports setHidden:YES];
	[NewRep setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoReports
{
	[Reports makeKeyAndVisible];
    [Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:NO];
	[NewRep setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoNewRep
{
	[NewRep makeKeyAndVisible];
    [Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[NewRep setHidden:NO];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoBlueSync
{
	[BlueSync makeKeyAndVisible];
    [NewRep setHidden:YES];
	[Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[BlueSync setHidden:NO];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoDocSync
{
	[DocSync makeKeyAndVisible];
    [NewRep setHidden:YES];
	[Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:NO];
	[Tools setHidden:YES];
	[Print setHidden:YES];
}

-(IBAction)gotoTools
{
	[Tools makeKeyAndVisible];
    [NewRep setHidden:YES];
	[Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:NO];
	[Print setHidden:YES];
}

-(IBAction)gotoPrint
{
	[Print makeKeyAndVisible];
    [NewRep setHidden:YES];
	[Login setHidden:YES];
	[Menu setHidden:YES];
	[Reports setHidden:YES];
	[BlueSync setHidden:YES];
	[DocSync setHidden:YES];
	[Tools setHidden:YES];
	[Print setHidden:NO];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
    //[Login makeKeyAndVisible];
	
    return YES;
}

/*- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor redColor];
    [Login makeKeyAndVisible];
    return YES;
}*/


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSError *error = nil;
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
			 */
        } 
    }
}


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Service_Registry" withExtension:@"momd"];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
	
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Service_Registry.sqlite"];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
		
		/*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
		
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory {
	
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark -
#pragma mark Memory management


@end
