    //
//  DocsSync.m
//  Service Registry
//
//  Created by Nchinda Nchinda on 11/4/12.
//  Copyright 2012 The8Bits. All rights reserved.
//

#import "DocsSync.h"

static NSString *const kKeychainItemName = @"Service Registry PDF";
static NSString *const kClientID = @"716774369179.apps.googleusercontent.com";
static NSString *const kClientSecret = @"D5XYW6aUpbRjzD485xhSmojB";

@implementation DocsSync
@synthesize authPage;
@synthesize appDelegate;
@synthesize Docs;
@synthesize tvStat;
@synthesize SampPDF;
@synthesize sample;

@synthesize driveService;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Initialize the drive service & load existing credentials from the keychain if available
    self.driveService = [[GTLServiceDrive alloc] init];
    self.driveService.authorizer = [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName
                                                                                        clientID:kClientID
                                                                                     clientSecret:kClientSecret];
}


- (void)generatePdf
{
	pageSize = CGSizeMake(612, 792);
    
	NSString *fileName = [[[@"Report" stringByAppendingString:[tvStat owner]] stringByAppendingString:[tvStat date]] stringByAppendingString:@".pdf"];
	fileName = [fileName stringByReplacingOccurrencesOfString:@":" withString:@""];
	fileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	while (documentsDirectory == nil) {}
	
	pdfFileName = [documentsDirectory stringByAppendingPathComponent:fileName];
	repURLPath = [NSURL URLWithString:pdfFileName];
	[self generatePdfWithFilePath:pdfFileName];
}

- (void) generatePdfWithFilePath: (NSString *)thefilePath
{
    UIGraphicsBeginPDFContextToFile(thefilePath, CGRectZero, nil);
	
    BOOL done = NO;
    do
    {
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, pageSize.width, pageSize.height), nil);
		
        //Draw a border for each page.
        [self drawBorder];
		
        //Draw Main Program
        [self drawMP];
		
		//Draw Basic Information
        [self drawBI];
		
		//Draw Protection
        [self drawProt];
		
		//Draw Programs Removed
        [self drawPR];
		
		//Draw Hard Drive
        [self drawHD];
		
		//Draw Backup Software
        [self drawBS];
		
		//Draw Software Added
        [self drawSA];
		
		//Draw Backup Utilities
        [self drawBU];
		
		//Draw Remote Information
        [self drawRI];
		
		//Draw Web Browser
        [self drawWB];
		
		//Draw Hardware Diagnostics
        [self drawHG];
		
		//Draw Other
        [self drawOR];
		
		//Draw Other Program Updates/Other
        [self drawOO];
		
		//Draw Service Receipt
        [self drawSR];
		
        //Draw an image
        [self drawImage];
        done = YES;
    }
    while (!done);
	
    // Close the PDF context and write the contents out.
	UIGraphicsEndPDFContext();

	NSURL *theUrl = [NSURL fileURLWithPath:thefilePath];
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:theUrl];

	sample.autoresizesSubviews = YES;
	[sample setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	SampPDF.autoresizesSubviews = YES;
	[SampPDF setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[sample loadRequest:theRequest];
	[SampPDF setHidden:NO];
	[SampPDF makeKeyWindow];
	[Docs setHidden:YES];
}

- (void) drawBorder
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    UIColor *borderColor = [UIColor blackColor];
    CGRect rectFrame = CGRectMake(kBorderInset, kBorderInset, pageSize.width-kBorderInset*2, pageSize.height-kBorderInset*2);
    CGContextSetStrokeColorWithColor(currentContext, borderColor.CGColor);
    CGContextSetLineWidth(currentContext, kBorderWidth);
    CGContextStrokeRect(currentContext, rectFrame);
}

- (void) drawMP
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset +kSectionWidth*2 + kBorderWidth/2, kBorderInset + kBorderWidth/2, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);

	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, kSectionWidth*2+80, kBorderInset + kMarginInset + kBorderWidth, "Main Problem", strlen("Main Problem"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kSectionWidth*2 + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight, kSectionWidth, kCellHeight*7);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
    [[tvStat problem] drawInRect:rectFrame
                  withFont:font
                   lineBreakMode:NSLineBreakByWordWrapping
                 alignment:NSTextAlignmentLeft];
	
}

- (void) drawBI
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*8, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 80, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*8, "Basic Information", strlen("Basic Information"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth/3, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Owner:" drawInRect:rectFrame
                  withFont:font
             lineBreakMode:NSLineBreakByClipping
                 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat owner] drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*10, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Phone:" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*10, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat phone] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*11, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Email:" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*11, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat email] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*12, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"City:" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*12, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat city] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*13, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Model No.:" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*13, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat modelNo] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*14, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Serial No.:" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*14, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat serialNo] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
}

- (void) drawProt
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*8, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 90 + kSectionWidth, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*8, "Protection", strlen("Protection"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth*2/5, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"SpywareBlaster" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat spyBlas] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*10, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"MalwareBytes" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*10, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat malBytes] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*11, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Antivirus" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*11, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat antiVirus] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*12, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat antiVirus2] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*13, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Rootkit Check" drawInRect:rectFrame
					 withFont:font
				lineBreakMode:NSLineBreakByClipping
					alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*13, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat rootKit] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*14, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Firewall Check" drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2/5 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*14, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat firewall] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
}

- (void) drawPR
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*8, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 65 + kSectionWidth*2, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*8, "Programs Removed", strlen("Programs Remmoved"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*9, kSectionWidth, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
    [[tvStat progRem] drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByWordWrapping
					   alignment:NSTextAlignmentLeft];
	
}

- (void) drawHD
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*15, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 85, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*15, "Hard Drive", strlen("Hard Drive"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth/3, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"HD Location" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat hdLoc] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*17, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Total" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];

	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*17, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat hdTotMem] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Used" drawInRect:rectFrame
				 withFont:font
			lineBreakMode:NSLineBreakByClipping
				alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat hdUseMem] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*19, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Free" drawInRect:rectFrame
				withFont:font
		   lineBreakMode:NSLineBreakByClipping
			   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*19, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat hdFreeMem] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByClipping
					 alignment:NSTextAlignmentLeft];
	
}

- (void) drawBS
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*15, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 70 + kSectionWidth, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*15, "Backup Software", strlen("Backup Software"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth, kCellHeight);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth*2/5, kCellHeight);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat bs] drawInRect:rectFrame
						 withFont:font
					lineBreakMode:NSLineBreakByClipping
						alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat bsRes] drawInRect:rectFrame
		   withFont:font
	  lineBreakMode:NSLineBreakByClipping
		  alignment:NSTextAlignmentLeft];
	
}

- (void) drawSA
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*15, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 75 + kSectionWidth*2, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*15, "Software Added", strlen("Software Added"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*16, kSectionWidth, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
    [[tvStat softAdd] drawInRect:rectFrame
                  withFont:font
             lineBreakMode:NSLineBreakByWordWrapping
                 alignment:NSTextAlignmentLeft];
	
}

- (void) drawBU
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*17, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 75 + kSectionWidth, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*17, "Backup Utilities", strlen("Backup Utilities"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth*2/5, kCellHeight*3);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"CCleaner" drawInRect:rectFrame
		   withFont:font
	  lineBreakMode:NSLineBreakByClipping
		  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*18, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat cclean] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*19, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Defraggler" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*19, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat defrag] drawInRect:rectFrame
					   withFont:font
				  lineBreakMode:NSLineBreakByClipping
					  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*20, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Startup Items" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*20, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat start] drawInRect:rectFrame
					   withFont:font
				  lineBreakMode:NSLineBreakByClipping
					  alignment:NSTextAlignmentLeft];
	
}

- (void) drawRI
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*20, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 85, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*20, "Remote Information", strlen("Remote Information"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*21, kSectionWidth, kCellHeight*10);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*21, kSectionWidth/3, kCellHeight*10);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth*1/3, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth*2/3, kCellHeight*6);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*21, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Start Date" drawInRect:rectFrame
							withFont:font
					   lineBreakMode:NSLineBreakByClipping
						   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*21, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat startDate] drawInRect:rectFrame
					 withFont:font
				lineBreakMode:NSLineBreakByClipping
					alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Renewal Date" drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByClipping
					   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat renewalDate] drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Remote ID" drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat renewalDate] drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Remote Pass" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth*2/3, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat remotePass] drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Jan" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:0] drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Feb" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:1] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Mar" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:2] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Apr" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:3] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
		
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"May" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:4] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"June" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/3, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:5] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"July" drawInRect:rectFrame
			  withFont:font
		 lineBreakMode:NSLineBreakByClipping
			 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:6] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Aug" drawInRect:rectFrame
			   withFont:font
		  lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:7] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Sept" drawInRect:rectFrame
			   withFont:font
		  lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:8] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Oct" drawInRect:rectFrame
			   withFont:font
		  lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:9] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Nov" drawInRect:rectFrame
			   withFont:font
		  lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:10] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Dec" drawInRect:rectFrame
			   withFont:font
		  lineBreakMode:NSLineBreakByClipping
			  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/6, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth/6, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[[tvStat remoteMonth] objectAtIndex:11] drawInRect:rectFrame
											  withFont:font
										 lineBreakMode:NSLineBreakByClipping
											 alignment:NSTextAlignmentLeft];
	
	[[tvStat remoteMonth] removeAllObjects];
	[[tvStat remoteMonth] addObject:@"Jan"];
	[[tvStat remoteMonth] addObject:@"Feb"];
	[[tvStat remoteMonth] addObject:@"Mar"];
	[[tvStat remoteMonth] addObject:@"Apr"];
	[[tvStat remoteMonth] addObject:@"May"];
	[[tvStat remoteMonth] addObject:@"Jun"];
	[[tvStat remoteMonth] addObject:@"July"];
	[[tvStat remoteMonth] addObject:@"Aug"];
	[[tvStat remoteMonth] addObject:@"Sept"];
	[[tvStat remoteMonth] addObject:@"Oct"];
	[[tvStat remoteMonth] addObject:@"Nov"];
	[[tvStat remoteMonth] addObject:@"Dec"];
}

- (void) drawWB
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*21, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 85 + kSectionWidth, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*21, "Web Browser", strlen("Web Browser"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth*2/5, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Internet Explorer" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat ie] drawInRect:rectFrame
							withFont:font
					   lineBreakMode:NSLineBreakByClipping
						   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Google Chrome" drawInRect:rectFrame
					 withFont:font
				lineBreakMode:NSLineBreakByClipping
					alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat chrome] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Mozilla Firefox" drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByClipping
					   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat ffox] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat broOther] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth*3/5, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat broOtherRes] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
}

- (void) drawHG
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*22, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 60 + kSectionWidth*2, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*22, "Hardware Diagnostics", strlen("Hardware Diagnostics"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth, kCellHeight*8);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth/4, kCellHeight*8);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Pass" drawInRect:rectFrame
							withFont:font
					   lineBreakMode:NSLineBreakByClipping
						   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*23, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Fail" drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByClipping
					   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Mem Test" drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	if ([[tvStat memTest] isEqualToString:@"Pass"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	else if ([[tvStat memTest] isEqualToString:@"Fail"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*24, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}

	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Hard Drive" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	if ([[tvStat hd] isEqualToString:@"Pass"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	else if ([[tvStat hd] isEqualToString:@"Fail"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*25, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"PC Diag" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	if ([[tvStat pcDiag] isEqualToString:@"Pass"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	else if ([[tvStat pcDiag] isEqualToString:@"Fail"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Win Stress" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	if ([[tvStat winStress] isEqualToString:@"Pass"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	else if ([[tvStat winStress] isEqualToString:@"Fail"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Driver Updates" drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	if ([[tvStat driveUp] isEqualToString:@"Pass"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*5/2, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	else if ([[tvStat driveUp] isEqualToString:@"Fail"]) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*11/4, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(2, 4, 2, 4));
		CGContextFillRect(currentContext, rectFrame);
	}
	
}

- (void) drawOR
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*26, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 100 + kSectionWidth, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*26, "Other", strlen("Other"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth*2/5, kCellHeight*4);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"JAVA" drawInRect:rectFrame
						   withFont:font
					  lineBreakMode:NSLineBreakByClipping
						  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*27, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat java] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Adobe Flash" drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByClipping
					   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*28, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat flash] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Adobe Reader" drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*29, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat reader] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Windows Update" drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*7/5, kBorderInset + kBorderWidth/2 + kCellHeight*30, kSectionWidth/2, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat update] drawInRect:rectFrame
				   withFont:font
			  lineBreakMode:NSLineBreakByClipping
				  alignment:NSTextAlignmentLeft];
	
}

- (void) drawOO
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:13];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*31, kSectionWidth*3, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 223, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*31, "Other Program Updates/ Other", strlen("Other Program Updates/ Other"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*32, kSectionWidth*3, kCellHeight*16+2);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*32, kSectionWidth*3, kCellHeight*10);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
    [[tvStat other] drawInRect:rectFrame
                  withFont:font
             lineBreakMode:NSLineBreakByWordWrapping
                 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2, kBorderInset + kBorderWidth/2 + kCellHeight*42, kSectionWidth*2, kCellHeight*6);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
    [[tvStat conclusion] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByWordWrapping
					 alignment:NSTextAlignmentLeft];
}

- (void) drawSR
{
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
	//define color/font
    CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	UIFont *font = [UIFont systemFontOfSize:9.0];
	
	//create title blackbar
	CGRect rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2 - 1, kBorderInset + kBorderWidth/2 + kCellHeight*43, kSectionWidth, kCellHeight);
	CGContextFillRect(currentContext, rectFrame);
	
	//main problem title
	CGContextSelectFont(currentContext, "Arial", 12, kCGEncodingMacRoman);
	CGContextSetRGBFillColor(currentContext, 1, 1, 1, 1);
	CGContextSetTextMatrix(currentContext, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
	CGContextShowTextAtPoint(currentContext, 80 + kSectionWidth*2, kBorderInset + kMarginInset + kBorderWidth + kCellHeight*43, "Sales Receipt", strlen("Sales Receipt"));
	
	//section border
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*44, kSectionWidth, kCellHeight*4+2);
    CGContextSetLineWidth(currentContext, kBorderWidth);
	CGContextStrokeRect(currentContext, rectFrame);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*44, kSectionWidth*3/4, kCellHeight*4+2);
    CGContextSetLineWidth(currentContext, kBorderWidth/2);
	CGContextStrokeRect(currentContext, rectFrame);
	
	//section content
	CGContextSetRGBFillColor(currentContext, 0, 0, 0, 1);
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*44, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Labor" drawInRect:rectFrame
							withFont:font
					   lineBreakMode:NSLineBreakByClipping
						   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*44, kSectionWidth*3/4, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat labor] drawInRect:rectFrame
				withFont:font
		   lineBreakMode:NSLineBreakByTruncatingTail
			   alignment:NSTextAlignmentRight];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*45, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Parts" drawInRect:rectFrame
						withFont:font
				   lineBreakMode:NSLineBreakByClipping
					   alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*45, kSectionWidth*3/4, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat parts] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByTruncatingTail
					 alignment:NSTextAlignmentRight];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*46, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Tax" drawInRect:rectFrame
						  withFont:font
					 lineBreakMode:NSLineBreakByClipping
						 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*46, kSectionWidth*3/4, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat tax] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByTruncatingTail
					 alignment:NSTextAlignmentRight];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*2, kBorderInset + kBorderWidth/2 + kCellHeight*47, kSectionWidth, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[@"Total" drawInRect:rectFrame
			  withFont:font
		 lineBreakMode:NSLineBreakByClipping
			 alignment:NSTextAlignmentLeft];
	
	rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*47, kSectionWidth*3/4, kCellHeight);
	rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
	[[tvStat final] drawInRect:rectFrame
					  withFont:font
				 lineBreakMode:NSLineBreakByTruncatingTail
					 alignment:NSTextAlignmentRight];
	
	for (int i = 0; i < 4; i++) 
	{
		rectFrame = CGRectMake(kBorderInset + kBorderWidth/2 + kSectionWidth*9/4, kBorderInset + kBorderWidth/2 + kCellHeight*(44+i), kSectionWidth*3/4, kCellHeight);
		rectFrame = UIEdgeInsetsInsetRect(rectFrame, UIEdgeInsetsMake(0, 2, 0, 1));
		[@"$" drawInRect:rectFrame
					withFont:font
			   lineBreakMode:NSLineBreakByClipping
				   alignment:NSTextAlignmentLeft];
	}
}

- (void) drawImage
{
    UIImage * demoImage = [UIImage imageNamed:@"demo.png"];
    [demoImage drawInRect:CGRectMake( (pageSize.width - demoImage.size.width/2)/2, 350, demoImage.size.width/2, demoImage.size.height/2)];
}

-(IBAction) saveCancel
{
	[SampPDF setHidden:YES];
	[appDelegate gotoDocSync];
}

-(IBAction) saveContinue
{
    if (![self isAuthorized])
    {
        // Not yet authorized, request authorization and push the login UI onto the navigation stack.
        UIView *authView = [[self createAuthController] view];
        authView.frame = CGRectMake(0, 0, SampPDF.frame.size.width, SampPDF.frame.size.height-self.authBar.frame.size.height);
        [authView setBounds:[[UIScreen mainScreen] bounds]];
        
        [SampPDF addSubview:authView];
    }
    else
	{
		[self uploadPDF];
	}
}

// Helper to check if user is authorized
- (BOOL)isAuthorized
{
    return [((GTMOAuth2Authentication *)self.driveService.authorizer) canAuthorize];
}

// Creates the auth controller for authorizing access to Google Drive.
- (GTMOAuth2ViewControllerTouch *)createAuthController
{
    GTMOAuth2ViewControllerTouch *authController;
    authController = [[GTMOAuth2ViewControllerTouch alloc] initWithScope:kGTLAuthScopeDriveFile
                                                                clientID:kClientID
                                                            clientSecret:kClientSecret
                                                        keychainItemName:kKeychainItemName
                                                                delegate:self
                                                        finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    return authController;
}

// Handle completion of the authorization process, and updates the Drive service
// with the new credentials.
- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)authResult
                 error:(NSError *)error
{
    if (error != nil)
    {
        [self showAlert:@"Authentication Error" message:error.localizedFailureReason];
        self.driveService.authorizer = nil;
    }
    else
    {
        self.driveService.authorizer = authResult;
        [self uploadPDF];
    }
}

// Uploads a photo to Google Drive
- (void)uploadPDF
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"'ServiceReport Uploaded File ('EEEE MMMM d, YYYY h:mm a, zzz')"];
    
    GTLDriveFile *file = [GTLDriveFile object];
    file.title = [dateFormat stringFromDate:[NSDate date]];
    file.descriptionProperty = @"Uploaded through Service Report Mobile";
    file.mimeType = @"application/pdf";
    
    NSData *data = [NSData dataWithContentsOfFile:pdfFileName];
    GTLUploadParameters *uploadParameters = [GTLUploadParameters uploadParametersWithData:data MIMEType:@"application/pdf"];
    //NSData *fileContent = [@"heyyyyy" dataUsingEncoding:NSUTF8StringEncoding];
    //GTLUploadParameters *uploadParameters = [GTLUploadParameters uploadParametersWithData:fileContent
    //                                                        MIMEType:@"text/plain"];
    
    GTLQueryDrive *query = [GTLQueryDrive queryForFilesInsertWithObject:file
                                                       uploadParameters:uploadParameters];
    
    UIAlertView *waitIndicator = [self showWaitIndicator:@"Uploading to Google Drive"];
    
    [self.driveService executeQuery:query
                  completionHandler:^(GTLServiceTicket *ticket,
                                      GTLDriveFile *insertedFile, NSError *error) {
                      [waitIndicator dismissWithClickedButtonIndex:0 animated:YES];
                      if (error == nil)
                      {
                          NSLog(@"File ID: %@", insertedFile.identifier);
                          [self showAlert:@"Google Drive" message:@"File saved!"];
                      }
                      else
                      {
                          NSLog(@"An error occurred: %@", error);
                          [self showAlert:@"Google Drive Error Occurred"
                                  message:[[error userInfo]
                              valueForKey:@"NSLocalizedDescriptionKey"]];
                      }
                  }];
}


- (UIAlertView*)showWaitIndicator:(NSString *)title
{
    UIAlertView *progressAlert;
    progressAlert = [[UIAlertView alloc] initWithTitle:title
                                               message:@"Please wait..."
                                              delegate:nil
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil];
    [progressAlert show];
    
    UIActivityIndicatorView *activityView;
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityView.center = CGPointMake(progressAlert.bounds.size.width / 2,
                                      progressAlert.bounds.size.height - 45);
    
    [progressAlert addSubview:activityView];
    [activityView startAnimating];
    return progressAlert;
}

// Helper for showing an alert
- (void)showAlert:(NSString *)title message:(NSString *)message
{
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle: title
                                       message: message
                                      delegate: nil
                             cancelButtonTitle: @"OK"
                             otherButtonTitles: nil];
    [alert show];
}

@end
