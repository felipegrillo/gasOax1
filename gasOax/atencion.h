//
//  atencionViewController.h
//  gasOax
//
//  Created by felipe on 11/03/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface atencion : UIViewController
@property (strong, nonatomic) IBOutlet UIView *viewUbicacion;
@property (strong, nonatomic) IBOutlet UIView *viewAtencion;
@property (strong, nonatomic) IBOutlet UIButton *btnAtrasAtencion;
@property (strong, nonatomic) IBOutlet UIButton *btnPhoneAtencion;
- (IBAction)btnCallPhone:(id)sender;



@end
