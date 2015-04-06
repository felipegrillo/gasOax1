//
//  ViewController.h
//  gasOax
//
//  Created by felipe on 10/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnVenta;
@property (strong, nonatomic) IBOutlet UIButton *btnAtencion;
@property (strong, nonatomic) IBOutlet UIButton *btncentro;
@property (strong, nonatomic) IBOutlet UIView *viewPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *btnloginout;
- (IBAction)btnPressedLoginOut:(id)sender;



@end

