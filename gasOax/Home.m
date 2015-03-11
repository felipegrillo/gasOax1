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
  /*  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;*/
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
