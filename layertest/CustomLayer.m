//
//  CustomLayer.m
//  Hello World
//
//  Created by Erica Sadun on 5/19/14.
//  Copyright (c) 2014 Erica Sadun. All rights reserved.
//

#import "CustomLayer.h"


@implementation CustomLayer
@dynamic logoLevel;


// Initialize custom values
- (instancetype) init
{
    if (!(self = [super init])) return self;
    //self.logoLevel = @(0.0f);
    // _animationDuration = 2.0f; // slow everything down
    //[self setNeedsDisplay];
    return self;
}


// Add dynamic response
- (CABasicAnimation *) customAnimationForKey: (NSString *) key
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
	animation.fromValue = @0;
    animation.duration = 5.0;
    return animation;
}

// Animate
-(id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"logoLevel"]) {
        return [self customAnimationForKey:key];
    }
    return [super actionForKey:key]; 
}

- (void) drawInContext:(CGContextRef) context
{
    
    UIGraphicsPushContext(context);

    NSLog(@"alpha = %f", self.logoLevel.floatValue);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, CGRectMake(0,0, self.logoLevel.floatValue, self.logoLevel.floatValue));

    
    
    UIGraphicsPopContext();
}

+ (BOOL) needsDisplayForKey:(NSString *) key
{
    if ([key isEqualToString:@"logoLevel"]) return YES;
//    if ([key isEqualToString:@"imageLevel"]) return YES;
    return [super needsDisplayForKey:key];
}
@end