//
//  DocsTableView.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocsSync.h"

@interface DocsTableView : UITableView
{
	IBOutlet DocsSync *boss;
	IBOutlet DocsTable *controller;
}

@property (nonatomic, retain) IBOutlet DocsSync *boss;
@property (nonatomic, retain) IBOutlet DocsTable *controller;

@end
