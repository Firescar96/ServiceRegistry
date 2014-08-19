//
//  ReportsSearch.h
//  Service Registry
//
//  Created by Nchinda Fam on 11/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportsTable.h"

@interface ReportsSearch : UISearchDisplayController<UISearchDisplayDelegate> {	
	ReportsTable *tvStat;
	
	NSString *status;
}

@property (nonatomic, retain) IBOutlet UITableViewController *tvStat;
@property (nonatomic, retain) IBOutlet NSString *status;

@end
