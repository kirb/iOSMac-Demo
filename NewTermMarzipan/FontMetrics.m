// FontMetrics.m
// MobileTerminal

#import "FontMetrics.h"

@implementation FontMetrics

- (instancetype)initWithFont:(UIFont *)uiFont boldFont:(UIFont *)boldUIFont {
	self = [super init];
	
	if (self) {
		_regularFont = uiFont;
		_boldFont = boldUIFont;
		
		CTFontRef ctFont = (__bridge CTFontRef)_regularFont;
		NSAssert(ctFont != NULL, @"Error in CTFontCreateWithName");
		
		// This creates a CoreText line that isn't drawn, but used to get the
		// size of a single character. This will probably fail miserably if used
		// with a non-monospaced font.
		CFStringRef string = CFSTR("A");
		CFMutableAttributedStringRef attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
		CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), string);	 
		CFAttributedStringSetAttribute(attrString, CFRangeMake(0, CFStringGetLength(string)), kCTFontAttributeName, ctFont);
		CTLineRef line = CTLineCreateWithAttributedString(attrString);
		
		CGFloat width = CTLineGetTypographicBounds(line, &_ascent, &_descent, &_leading);
		
		CFRelease(line);
		CFRelease(attrString);
		CFRelease(ctFont);
		
		_boundingBox = CGSizeMake(width, _ascent + _descent + _leading);
	}
	
	return self;
}

@end
