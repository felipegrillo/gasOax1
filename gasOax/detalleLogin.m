//
//  detalleLogin.m
//  gasOax
//
//  Created by felipe on 02/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "detalleLogin.h"
UIAlertView *message;
@interface detalleLogin ()

@end

@implementation detalleLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)saveUser{
    PFUser *user = [PFUser user];
    user.username =self.setUsuarioTxt.text;
    user.password =self.setPassTxt.text;
    user.email = self.setCorreoTxt.text;
    if([self.self.setUsuarioTxt.text isEqual:@""] || [self.setPassTxt.text isEqual:@""] || [self.setCorreoTxt.text isEqual:@""]){
        

        [self errorMessage];

    }else{
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                [self validoMessage];
                
            } else {
                NSString *errorString = [error userInfo][@"error"];
                message.layer.backgroundColor=[UIColor blueColor].CGColor;
                message = [[UIAlertView alloc] initWithTitle:@"No se pudo guardar informacion"
                                                     message:errorString
                                                    delegate:nil
                                           cancelButtonTitle:@"Cancelar"
                                           otherButtonTitles:nil];
                [message show];
            }
        }];
    }


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
                                         message:@""
                                        delegate:nil
                               cancelButtonTitle:@"Cancelar"
                               otherButtonTitles:nil];
    [message show];
}

//Guarda informacion de usuario
- (IBAction)btnSaveData:(id)sender {
    [self saveUser];
}
//Oculta el teclado cuando se toca el view principal
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


//Valida mail
- (BOOL) validaEmail:(NSString*) emailString {
    
    if([emailString length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */@end
