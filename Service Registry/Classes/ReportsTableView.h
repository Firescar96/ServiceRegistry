//
//  ReportsTableView.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportsTable.h"
#import "ReportsPage.h"

@interface ReportsTableView : UITableView
{
	IBOutlet ReportsTable *controller;
}

@property (nonatomic, retain) IBOutlet ReportsTable *controller;

@end
