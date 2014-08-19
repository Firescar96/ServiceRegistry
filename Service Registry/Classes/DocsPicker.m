//
//  DocsPicker.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "DocsPicker.h"


@implementation DocsPicker

@synthesize pvStatus;

- (void)viewDidLoad
{
    [super viewDidLoad];
    status = [[NSArray alloc] initWithObjects:@"owner", @"email", @"city", @"date", nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	//One column
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	//set number of rows
	return status.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	//set item per row
	return [status objectAtIndex:row];
}

@end
