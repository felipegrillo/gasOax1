//
//  LoginController.h
//  gasOax
//
//  Created by felipe on 01/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface LoginController : UIViewController <FBLoginViewDelegate,UIApplicationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnEntrarLogin;
@property (weak, nonatomic) IBOutlet UITextField *introUsuarioTxt;
@property (weak, nonatomic) IBOutlet UITextField *introPassTxt;
@property (weak, nonatomic) IBOutlet UITextField *recuperaPasswordtxt;
@property (weak, nonatomic) IBOutlet UIButton *btnEnviaCorreo;


- (IBAction)btnLogin:(id)sender;
- (IBAction)forgotPass:(id)sender;
- (IBAction)btnEnviaMail:(id)sender;

@end
