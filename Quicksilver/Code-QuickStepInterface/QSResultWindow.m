

#import "QSResultWindow.h"
@implementation QSResultWindow
- (id)initWithContentRect:(NSRect)contentRect styleMask:(unsigned int)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
	NSWindow* result = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:YES];
	[self setOpaque:![[NSUserDefaults standardUserDefaults] boolForKey:@"QSResultsUseAlpha"]];

	[self setShowEffect:[NSDictionary dictionaryWithObjectsAndKeys:@"QSSlightGrowEffect", @"transformFn", @"show", @"type", [NSNumber numberWithFloat:0.05] , @"duration", nil]];
	[self setHideEffect:[NSDictionary dictionaryWithObjectsAndKeys:@"QSSlightShrinkEffect", @"transformFn", @"hide", @"type", [NSNumber numberWithFloat:0.05] , @"duration", nil]];

    if([self setFrameUsingName:@"results"])
        [[self class] removeFrameUsingName:@"results"];
    
    [self setFrameAutosaveName:@"QSResultWindow"];
    
	[self setBackgroundColor:[NSColor whiteColor]];
	[self setMovableByWindowBackground:NO];
	[self setHasShadow:YES];
	[self setLevel:NSFloatingWindowLevel];
    return result;
}

- (NSTimeInterval)animationResizeTime:(NSRect)newFrame {
	return .1;
}

- (BOOL)acceptsFirstResponder {return NO;}
- (BOOL)canBecomeKeyWindow {return NO;}
- (BOOL)canBecomeMainWindow {return NO;}

@end
