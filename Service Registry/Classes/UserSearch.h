//
//  UserSearch.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserTable.h"

@interface UserSearch : UISearchDisplayController<UISearchDisplayDelegate> {	
	UserTable *tvStat;
	
	NSString *status;
}

@property (nonatomic, retain) IBOutlet UITableViewController *tvStat;
@property (nonatomic, retain) IBOutlet NSString *status;

@end
