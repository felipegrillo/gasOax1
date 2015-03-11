//
//  ubicacionViewController.h
//  gasOax
//
//  Created by felipe on 10/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
@interface ubicacion : UIViewController <CLLocationManagerDelegate,GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btnAtrasMenu;
@property (copy,nonatomic) NSSet *markers;
@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *location;
@property (strong, nonatomic) IBOutlet UIView *viewMap;
@property (strong, nonatomic) IBOutlet UIButton *btnCargarMapa;

- (IBAction)btnMapa:(id)sender;

@end
