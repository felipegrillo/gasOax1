//
//  ruta.h
//  gasOax
//
//  Created by felipe on 04/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
@interface ruta : UIViewController <CLLocationManagerDelegate,GMSMapViewDelegate>


@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *location;
@property (weak, nonatomic) IBOutlet UIView *viewMap;
@property (weak, nonatomic) IBOutlet UIButton *btnAtras;
@property (weak, nonatomic) IBOutlet UIButton *btnMap;

@end
