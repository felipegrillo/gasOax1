//
//  ViewController.m
//  gasOax
//
//  Created by felipe on 10/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "Home.h"
#import <GoogleMaps/GoogleMaps.h>

@interface Home () {
    GMSMapView *mapView_;
}

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // First we create a new color with the image
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"backgroundgasnatural.png"]];
    
    // then we set the backgroundColor property to the color created above
    self.viewPrincipal.backgroundColor = background;
  
    
   
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
