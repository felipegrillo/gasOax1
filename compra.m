//
//  compraViewController.m
//  gasOax
//
//  Created by felipe on 11/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "compra.h"
#import <Parse/Parse.h>

#import "ubicacion.h"

UIImage *chosenImage;
UIAlertView *message;
float       mlatitude;
float       mlongitude;
NSString    *strUserLocation;

@interface compra ()

@end

@implementation compra

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager                    = [[CLLocationManager alloc] init];
    self.locationManager.delegate           = self;
    self.location                           = [[CLLocation alloc] init];
    self.locationManager.desiredAccuracy    = kCLLocationAccuracyKilometer;
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager  requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"backgroundgasnatural.png"]];
    
    // then we set the backgroundColor property to the color created above
    self.viewCompras.backgroundColor = background;    // Do any additional setup after loading the view.
    PFUser *users=[PFUser currentUser];
    NSLog(@"%@",users.objectId);
    
    PFQuery *query = [PFQuery queryWithClassName:@"cliente"];
    [query whereKey:@"idusers" equalTo:users];
    [query orderByDescending:@"createdAt"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
       // NSString *name=@"";
       // [name setValue:object forKey:@"Nombre"];
        [self.txtNombre.text setValue:object forKey:@"Nombre"];
        
        NSLog(@"Id cliente%@",object.objectId);
        //NSLog(@"Name: %@",name);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Llama la funcion getMediaFromSource para seleccionar fotos en la galeria
- (IBAction)btnGallery:(id)sender {
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

//Llama la funcion getMediaFromSource para tomar foto y seleccionar, agregarlo en imgenView

- (IBAction)btnCamara:(id)sender {
     [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

//Guarda informacion en parse
- (IBAction)btnSave:(id)sender {
    //Muestra Alerta cuando guardo los datos Exito o fallado

   

    // Make a new post
    PFUser *users=[PFUser currentUser];
    NSLog(@"%@",users.objectId);
    
   

    
    //Insertar datos en Bae de datos
    PFObject *insertCliente = [PFObject objectWithClassName:@"cliente"];
    PFQuery *query = [PFQuery queryWithClassName:@"cliente"];
    [query whereKey:@"idusers" equalTo:users];
    // Retrieve the object by id
 /*   [query findObjectsInBackgroundWithBlock:^(NSArray *clientes, NSError *error) {
        NSLog(@"Successfully retrieved %d scores.",clientes.count);
        // Do something with the found objects
        for (PFObject *object in clientes) {
            NSLog(@"%@", object.objectId);
                 }
        // Now let's update it with some new data. In this case, only cheatMode and score
        // will get sent to the cloud. playerName hasn't changed.
        if(!error){
        
        }
        
    }];*/
    
    
    //cargar imagen picker
    NSData *imageData = UIImageJPEGRepresentation(self.imgenView.image, 0.8);
    NSString *filename = [NSString stringWithFormat:@"%@.png", self.txtNombre.text];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    

    //Cargar los textos
    [insertCliente setObject:users forKey:@"idusers"];
    insertCliente[@"Nombre"] = self.txtNombre.text;
    insertCliente[@"Domicilio"] =self.txtDireccion.text;
    insertCliente[@"Telefono"]=self.txtTelefono.text;
    insertCliente[@"Correo"]=self.txtCorreo.text;
    insertCliente[@"Picture"] = imageFile;

 
    mlatitude = self.locationManager.location.coordinate.latitude;
    mlongitude = self.locationManager.location.coordinate.longitude;
    NSNumber *numbermlatitude= [NSNumber numberWithDouble:mlatitude];
    NSNumber *numbermlongitude= [NSNumber numberWithDouble:mlongitude];
 
   /// insertCliente[@"Latitude"];
    insertCliente[@"Latitude"]=numbermlatitude;
    insertCliente[@"Longitude"]=numbermlongitude;
    if([self.txtNombre.text isEqual:@""] || [self.txtDireccion.text isEqual:@""] || [self.txtTelefono.text isEqual:@""] || [self.txtCorreo.text isEqual:@""]){
    [self errorMessage];
        
    }else{
    [insertCliente saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
             [self validoMessage];

        }else{
            [self errorMessage];
        }
    }];
    }
    
    
 
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

- (void) validoMessage{
    message.layer.backgroundColor=[UIColor blueColor].CGColor;
    message = [[UIAlertView alloc] initWithTitle:@"Datos Guardado"
                                         message:@"Exito!"
                                        delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
    [message show];
}

- (void)errorMessage{
    message.layer.backgroundColor=[UIColor blueColor].CGColor;
    message = [[UIAlertView alloc] initWithTitle:@"No se pudo guardar informacion"
                                         message:@"Error!"
                                        delegate:nil
                               cancelButtonTitle:@"Cancelar"
                               otherButtonTitles:nil];
    [message show];
}



- (void)getMediaFromSource: (UIImagePickerControllerSourceType)sourceType
{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.mediaTypes = mediaTypes;
    picker.delegate = self;
    picker.allowsEditing =  YES;
    picker.sourceType = sourceType;
    [self presentViewController: picker animated:YES completion:nil];
}



- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.lastChosenMediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([self.lastChosenMediaType isEqual:(NSString *) kUTTypeImage])
    {
        self.imgenView.image = [info objectForKey:UIImagePickerControllerEditedImage];
        chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    
    else if ([self.lastChosenMediaType isEqual:(NSString *) kUTTypeMovie])
    {
        self.movieURL = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)updateDisplay
{
    if ([self.lastChosenMediaType isEqual:(NSString *) kUTTypeImage])
    {
        //self.imageView.image = chosenImage;
        self.imgenView.hidden = NO;
        self.moviePlayerController.view.hidden = YES;
    }
    else if ([self.lastChosenMediaType isEqual:(NSString *) kUTTypeMovie])
    {
        [self.moviePlayerController.view removeFromSuperview];
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
        self.moviePlayerController.view.frame = self.imgenView.frame;
        self.moviePlayerController.view.clipsToBounds = YES;
        self.imgenView.hidden = YES;
        
    }
    
}


//Oculta el teclado cuando se toca el view principal
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}



@end
