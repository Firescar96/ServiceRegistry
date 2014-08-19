    //
//  UserSearch.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "UserSearch.h"

@implementation UserSearch

@synthesize tvStat;
@synthesize status;
	
- (void) searchBarTextDidBeginEditing:(UISearchBar *)sender
{
	sender.showsCancelButton=YES;
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)sender
{
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
	status = [sender text];
	
	[tvStat findUser:status];
}      

- (void) searchBarCancelButtonClicked:(UISearchBar *)sender
{
	sender.text=@"";
	[sender resignFirstResponder];
	sender.showsCancelButton=NO;
}

@end
