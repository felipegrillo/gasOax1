//
//  atencionViewController.m
//  gasOax
//
//  Created by felipe on 11/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "atencion.h"
NSString *phoneNumber;
UIAlertView *alerta;
@interface atencion ()

@end

@implementation atencion

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"atencion.png"]];
    self.viewAtencion.backgroundColor = background;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)callPhone
 {
     //Recibo cadena de telefono
      NSMutableString *myStringPhone = [NSMutableString stringWithString:_btnPhoneAtencion.titleLabel.text];
     [myStringPhone  deleteCharactersInRange: [myStringPhone rangeOfString: @"Tel: "]];
     //Realiza recorte de cadena
     phoneNumber=[NSString stringWithString:myStringPhone];

     NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phoneNumber]];


     if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
         [[UIApplication sharedApplication] openURL:phoneUrl];
     } else
     {
         alerta = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Servicio de llamada no esta dispoblie!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
         [alerta show];
     }
 }


- (IBAction)btnCallPhone:(id)sender {
    [self callPhone];
    NSLog(@"Llamando.....");
}
@end
