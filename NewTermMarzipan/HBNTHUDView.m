#import "HBNTHUDView.h"

@implementation HBNTHUDView {
	UIImageView *_imageView;
	UIVisualEffectView *_backdropView;
}

- (instancetype)initWithImage:(UIImage *)image {
	self = [super initWithFrame:(CGRect){ CGPointZero, self.intrinsicContentSize }];

	if (self) {
		self.alpha = 0;
		self.clipsToBounds = YES;
		self.layer.cornerRadius = 16;

		_backdropView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
		_backdropView.frame = self.bounds;
		_backdropView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self addSubview:_backdropView];

		_imageView = [[UIImageView alloc] initWithImage:image];
		_imageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
		_imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
		[self addSubview:_imageView];
	}

	return self;
}

- (CGSize)intrinsicContentSize {
	return CGSizeMake(54.f, 54.f);
}

- (void)animate {
	// if our alpha is non-zero, we’re already visible. maybe we should extend the visible duration
	// but eh. just do nothing
	if (self.alpha != 0) {
		return;
	}

	// display for 1.5 secs, fade out in 0.3 secs, then remove from superview
	self.alpha = 1;
	
	[UIView animateWithDuration:0.3f delay:0.75f options:kNilOptions animations:^{
		self.alpha = 0;
	} completion:nil];
}

@end
