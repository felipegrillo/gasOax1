//
//  compraViewController.h
//  gasOax
//
//  Created by felipe on 11/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
@interface compra : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate,CLLocationManagerDelegate,GMSMapViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *viewCompras;
@property (strong, nonatomic) IBOutlet UIImageView *imgenView;
@property (strong, nonatomic) IBOutlet UIButton *btnCamera;
@property (strong, nonatomic) IBOutlet UIButton *btnGallery;

@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UITextField *txtDireccion;
@property (strong, nonatomic) IBOutlet UITextField *txtCorreo;
@property (strong, nonatomic) IBOutlet UITextField *txtTelefono;


@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property (strong, nonatomic) IBOutlet UIImagePickerController *camera;
@property (strong, nonatomic) NSString *lastChosenMediaType;
@property (strong, nonatomic) UIImage *currentImage;
@property (strong, nonatomic) NSURL *movieURL;

@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *location;

- (IBAction)btnGallery:(id)sender;
- (IBAction)btnCamara:(id)sender;
- (IBAction)btnSave:(id)sender;


@end
