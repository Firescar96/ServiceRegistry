//
//  PrintTableView.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrintSync.h"

@interface PrintTableView : UITableView
{
	IBOutlet PrintSync *boss;
	IBOutlet PrintTable *controller;
}

@property (nonatomic, retain) IBOutlet PrintSync *boss;
@property (nonatomic, retain) IBOutlet PrintTable *controller;

@end
