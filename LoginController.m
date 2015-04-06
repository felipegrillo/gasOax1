//
//  LoginController.m
//  gasOax
//
//  Created by felipe on 01/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "LoginController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
UIAlertView *message;
UIAlertView *alertmail;
@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
//    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    [super viewDidLoad];

    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"backgroundgasnatural.png"]];
    self.view.backgroundColor = background;
    //desactiva el texlField y button
    self.recuperaPasswordtxt.hidden=TRUE;
    self.btnEnviaCorreo.hidden=TRUE;
    [PFUser logOut];

   
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Oculta el teclado cuando se toca el view principal
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

//if datos de usuario es correcto avanza al siguiente viewController
- (IBAction)btnLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:self.introUsuarioTxt.text password:self.introPassTxt.text
    block:^(PFUser *user, NSError *error) {
            if (user) {
                [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            } else {

                message.layer.backgroundColor=[UIColor blueColor].CGColor;
                message = [[UIAlertView alloc] initWithTitle:@"Usuario o contraseña incorrecta"
                                                     message:@""
                                                    delegate:nil
                                           cancelButtonTitle:@"Cancelar"
                                           otherButtonTitles:nil];
                [message show];
            }
            }];
    
}

//Activa el texlField y button
- (IBAction)forgotPass:(id)sender {

    self.recuperaPasswordtxt.hidden=FALSE;
    self.btnEnviaCorreo.hidden=FALSE;
   
}


//validacion de correo introducido para restablecer la contraseña
- (IBAction)btnEnviaMail:(id)sender {
    if([self.recuperaPasswordtxt.text isEqual:@""] || ![self validaEmail:self.recuperaPasswordtxt.text]){
        if(![self validaEmail:self.recuperaPasswordtxt.text]){
        message.layer.backgroundColor=[UIColor blueColor].CGColor;
        message = [[UIAlertView alloc] initWithTitle:@"Correo electronico invalido"
                                             message:@""
                                            delegate:nil
                                    cancelButtonTitle:@"Cancelar"
                                    otherButtonTitles:nil];
            [message show];
        }else{
        
        message.layer.backgroundColor=[UIColor blueColor].CGColor;
        message = [[UIAlertView alloc] initWithTitle:@"Introduce el correo electronico"
                                             message:@""
                                            delegate:nil
                                   cancelButtonTitle:@"Cancelar"
                                   otherButtonTitles:nil];
        [message show];
            
        }
    }else{
       
 //   [PFUser requestPasswordResetForEmailInBackground:self.recuperaPasswordtxt.text];
        alertmail=[[UIAlertView alloc] initWithTitle:@"Revisa tu correo para cambiar contraseña"
                                             message:@""
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
    [alertmail show];
    
        
        self.recuperaPasswordtxt.hidden=TRUE;
    self.btnEnviaCorreo.hidden=TRUE;
        }
    
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




@end
