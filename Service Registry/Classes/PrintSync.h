//
//  PrintSync.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import "Service_RegistryAppDelegate.h"
#import "PrintTable.h"

#define kBorderInset            20.0
#define kBorderWidth            2.0
#define kMarginInset            10.0
#define kCellHeight				(792.0 - kBorderInset-kMarginInset*2-kBorderWidth*2)/48.0
#define kSectionWidth			(612.0 - kBorderInset-kMarginInset*2-kBorderWidth)/3.0

//Line drawing
#define kLineWidth              1.0

@interface PrintSync : UIViewController<UIPrintInteractionControllerDelegate> {

	Service_RegistryAppDelegate *appDelegate;
	
	IBOutlet UIWindow *authPage;
	
	IBOutlet UIView *Docs;
	PrintTable *tvStat;
	
	IBOutlet UIWindow *SampPDF;
	IBOutlet UIWebView *sample;
	
	NSString *pdfFileName;
	NSURL *repURLPath;
	
	CGSize pageSize;
}
@property (nonatomic, retain) IBOutlet UIWindow *authPage;

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet UIView *Docs;
@property (nonatomic, retain) IBOutlet PrintTable *tvStat;
@property (nonatomic, retain) IBOutlet UIWindow *SampPDF;
@property (nonatomic, retain) IBOutlet UIWebView *sample;

- (void)generatePdf;
- (void) generatePdfWithFilePath: (NSString *)thefilePath;
-(void) drawBorder;
-(void) drawMP;
-(void) drawBI;
-(void) drawProt;
-(void) drawPR;
-(void) drawHD;
-(void) drawBS;
-(void) drawSA;
-(void) drawBU;
-(void) drawRI;
-(void) drawWB;
-(void) drawHG;
-(void) drawOR;
-(void) drawOO;
-(void) drawSR;
-(void) drawImage;

- (void)printPDF;
-(IBAction) saveCancel;
-(IBAction) saveContinue;
- (void)showAlert:(NSString *)title message:(NSString *)message;

@end
