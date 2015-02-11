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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    [self.view addSubview:customView];
        
    // Retrieve the layer
    CustomLayer *customLayer = (CustomLayer *) customView.layer;

    [customLayer setNeedsDisplay];

    customLayer.logoLevel = @300;


//    [UIView animateWithDuration:4.0f animations:^{
//        customLayer.logoLevel = @300.0;
//        self.view.alpha = 1.0;
//    } completion:^(BOOL finished) {
//       
//    }];
 
    
}


@end
