//
//  CustomLayer.m
//  Hello World
//
//  Created by Erica Sadun on 5/19/14.
//  Copyright (c) 2014 Erica Sadun. All rights reserved.
//

#import "CustomLayer.h"
#import "CustomView.h"


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

    CustomView *v = self.delegate;
    int val = v.pointsArray.count * (self.finalValue.floatValue / 100.0);
    NSLog(@"val = %d", val);

    CGContextClearRect(context, self.frame);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 4.0);
 

    for(int i = 0; i < val-1; i++) {
        NSValue *pVal = (NSValue*)v.pointsArray[i];
        CGPoint pPoint = [pVal CGPointValue];
        NSValue *pVal1 = (NSValue*)v.pointsArray[i+1];
        CGPoint pPoint1 = [pVal1 CGPointValue];
        CGContextMoveToPoint(context, pPoint.x, pPoint.y);
        CGContextAddLineToPoint(context, pPoint1.x, pPoint1.y);
    }
    
    CGContextStrokePath(context);
    
 
    UIGraphicsPopContext();
}

+ (BOOL) needsDisplayForKey:(NSString *) key
{
    if ([key isEqualToString:@"finalValue"]) return YES;
    return [super needsDisplayForKey:key];
}
@end