//
//  ViewController.m
//  layertest
//
//  Created by spacehomunculus on 2/10/15.
//  Copyright (c) 2015 electricbaconstudios. All rights reserved.
//

#import "ViewController.h"
#import "CustomLayer.h"
#import "CustomView.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *points;
@property (strong, nonatomic) CustomView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.points = [[NSMutableArray alloc] init];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    [self.points addObject:[NSValue valueWithCGPoint:touchLocation]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    [self.view addSubview:self.customView];
    
    // Retrieve the layer
    CustomLayer *customLayer = (CustomLayer *) self.customView.layer;
    customLayer.animationDuration = 5.0;
    customLayer.initialValue = @0;
    self.customView.pointsArray = self.points;
    
    
    customLayer.finalValue = @100;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        customLayer.initialValue = @100;
        customLayer.finalValue = @0;
    });
    
    

    
}


@end
