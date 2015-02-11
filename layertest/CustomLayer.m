//
//  CustomLayer.m
//  Hello World
//
//  Created by Erica Sadun on 5/19/14.
//  Copyright (c) 2014 Erica Sadun. All rights reserved.
//

#import "CustomLayer.h"


@implementation CustomLayer
@dynamic finalValue;


// Initialize custom values
- (instancetype) init
{
    self = [super init];
    if(self) {
        
    }
    return self;
}


// Add dynamic response
- (CABasicAnimation *) customAnimationForKey: (NSString *) key
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
	animation.fromValue = self.initialValue;
    animation.duration = self.animationDuration;
    return animation;
}

// Animate
-(id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"finalValue"]) {
        return [self customAnimationForKey:key];
    }
    return [super actionForKey:key]; 
}

- (void) drawInContext:(CGContextRef) context
{
    
    UIGraphicsPushContext(context);

    NSLog(@"alpha = %f", self.finalValue.floatValue);
    CGContextClearRect(context, self.frame);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillRect(context, CGRectMake(0,0, self.finalValue.floatValue, self.finalValue.floatValue));

    
    
    UIGraphicsPopContext();
}

+ (BOOL) needsDisplayForKey:(NSString *) key
{
    if ([key isEqualToString:@"finalValue"]) return YES;
    return [super needsDisplayForKey:key];
}
@end