//
//  detalleLogin.h
//  gasOax
//
//  Created by felipe on 02/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface detalleLogin : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *setUsuarioTxt;
@property (weak, nonatomic) IBOutlet UITextField *setPassTxt;
@property (weak, nonatomic) IBOutlet UITextField *setCorreoTxt;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveUser;
- (IBAction)btnSaveData:(id)sender;

@end
