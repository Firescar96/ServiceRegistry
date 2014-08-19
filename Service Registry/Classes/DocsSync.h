//
//  DocsSync.h
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import "Service_RegistryAppDelegate.h"
#import "DocsTable.h"

#import "GTLDrive.h"
#import "GTMOAuth2ViewControllerTouch.h"

#define kBorderInset            20.0
#define kBorderWidth            2.0
#define kMarginInset            10.
#define kCellHeight				(792.0 - kBorderInset-kMarginInset*2-kBorderWidth*2)/48.0
#define kSectionWidth			(612.0 - kBorderInset-kMarginInset*2-kBorderWidth)/3.0

//Line drawing
#define kLineWidth              1.0

@interface DocsSync : UIViewController <UINavigationControllerDelegate> {
	Service_RegistryAppDelegate *appDelegate;

	IBOutlet UIWindow *authPage;
	
	IBOutlet UIView *Docs;
	DocsTable *tvStat;
	
	IBOutlet UIWindow *SampPDF;
	IBOutlet UIWebView *sample;
	
	NSString *pdfFileName;
	NSURL *repURLPath;
	
	CGSize pageSize;
}
@property (nonatomic, retain) IBOutlet UIWindow *authPage;

@property (nonatomic, retain) IBOutlet Service_RegistryAppDelegate *appDelegate;
@property (nonatomic, retain) IBOutlet UIView *Docs;
@property (nonatomic, retain) IBOutlet DocsTable *tvStat;
@property (nonatomic, retain) IBOutlet UIWindow *SampPDF;
@property (nonatomic, retain) IBOutlet UIWebView *sample;

@property (nonatomic, retain) IBOutlet UIToolbar *authBar;

@property (nonatomic, retain) GTLServiceDrive *driveService;


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


-(IBAction) saveCancel;
-(IBAction) saveContinue;

- (BOOL)isAuthorized;
- (GTMOAuth2ViewControllerTouch *)createAuthController;
- (void)uploadPDF;
- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)authResult
                 error:(NSError *)error;
- (void)showAlert:(NSString *)title message:(NSString *)message;
- (UIAlertView*)showWaitIndicator:(NSString *)title;

@end
