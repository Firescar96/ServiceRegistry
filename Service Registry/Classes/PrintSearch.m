    //
//  PrintSearch.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "PrintSearch.h"
#import "PrintTable.h"

@implementation PrintSearch

@synthesize tvStat;
@synthesize status;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
	
- (void) searchBarTextDidBeginEditing:(UISearchBar *)sender
{
	sender.showsCancelButton=YES;
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)sender
{
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
	status = [sender text];
	
	[tvStat findCustomer:status];
}      

- (void) searchBarCancelButtonClicked:(UISearchBar *)sender
{
	sender.text=@"";
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
}


@end
