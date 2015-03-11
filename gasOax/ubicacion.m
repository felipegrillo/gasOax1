//
//  ubicacionViewController.m
//  gasOax
//
//  Created by felipe on 10/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "ubicacion.h"
NSString    *strUserLocation;
float       mlatitude;
float       mlongitude;
GMSMapView *mapView;


@interface ubicacion ()

@end

@implementation ubicacion

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager                    = [[CLLocationManager alloc] init];
    self.locationManager.delegate           = self;
    self.location                           = [[CLLocation alloc] init];
    self.locationManager.desiredAccuracy    = kCLLocationAccuracyKilometer;
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager  requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.location = locations.lastObject;
    NSLog( @"didUpdateLocation!");
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         for (CLPlacemark *placemark in placemarks)
         {
   
             NSString *administrativeArea = [placemark administrativeArea];

             NSString *countryCode = [placemark ISOcountryCode];
            // NSLog(@"name is %@ and locality is %@ and administrative area is %@ and country is %@ and country code %@", addressName, city, administrativeArea, country, countryCode);
             strUserLocation = [[administrativeArea stringByAppendingString:@","] stringByAppendingString:countryCode];
             NSLog(@"gstrUserLocation = %@", strUserLocation);
         }
         //posicion
         mlatitude = self.locationManager.location.coordinate.latitude;
         mlongitude = self.locationManager.location.coordinate.longitude;

     }];
}


- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    // coordinate contains your coordinate :)
    NSLog(@"did tap at coordinate: (%f, %f)", coordinate.latitude, coordinate.longitude);
}




- (void)paintMap
{
    //-------------------------------------------------------------------------------
    //Google Maps
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:mlatitude
                                                            longitude:mlongitude
                                                                 zoom:12];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    mapView.frame = CGRectMake(0, 0, self.viewMap.frame.size.width, self.viewMap.frame.size.height);
    mapView.delegate=self;
    mapView.mapType=kGMSTypeNormal;
    mapView.myLocationEnabled = YES;
    mapView.settings.compassButton = YES;
    mapView.settings.myLocationButton = YES;

   ;

    [self imprimeMarker];
   // [self.viewMap addSubview:mapView];
    
}

- (void) imprimeMarker{
   // GMSMarker *marker = [[GMSMarker alloc] init];
    CLLocationCoordinate2D position=CLLocationCoordinate2DMake(mlatitude, mlongitude);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    //marker.position = CLLocationCoordinate2DMake(mlatitude, mlongitude);
    
    marker.title = @"Mi posicion Actual";
    marker.snippet = @"Mi casita!";
    marker.map = mapView;
    [self.viewMap addSubview:mapView];
    
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(17.051863, -96.647405);
    marker2.title = @"Planta Matriz Oaxaca";
    marker2.snippet = @"Carr. Cristóbal Colón km 12.3, Tlalixtac de Cabrera, Oaxaca! \nTel: 01-951-5016600 \nTel: 01-951-5016611";
    marker2.map = mapView;

    [self.viewMap addSubview:mapView];
    
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.position = CLLocationCoordinate2DMake(17.184255,-96.778661);
    marker3.title = @"Planta Santo Domingo";
    marker3.snippet = @"Cam. a San Agustín km 1.2, Carr. Federal No. 190 Santo Domingo Barrio Alto, Etla, OaxacaX! \nTel: 01-951-5215332 \nTel: 01-951-5215335 \nTel: 01-951-5215571";
    marker3.map = mapView;
    [self.viewMap addSubview:mapView];
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    marker4.position = CLLocationCoordinate2DMake(18.112123,-97.075701);
    marker4.title = @"Planta San Martin Toxpalan";
    marker4.snippet = @"Carr. Federal paraje Chinacango km. 2.3, San Martin Toxpalan, Oaxaca! \nTel: 01-800-5009554";
    marker4.map = mapView;
    [self.viewMap addSubview:mapView];
}
- (IBAction)btnMapa:(id)sender {
    [self paintMap];
}
@end
