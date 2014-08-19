//
//  ReportsPicker.h
//  Order Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReportsPicker : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {

	IBOutlet UIPickerView *pvStatus;
	
	NSArray* status;
}

@property (nonatomic, retain) IBOutlet UIPickerView *pvStatus;

@end
