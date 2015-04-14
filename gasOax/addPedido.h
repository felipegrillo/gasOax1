//
//  addPedido.h
//  gasOax
//
//  Created by felipe on 06/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addPedido : UIViewController{
    NSNumber *numpicker;
    NSArray  *nombreCliente;
    NSArray *nombrePedido;
}
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UILabel *lblNombre;
@property (strong, nonatomic) IBOutlet UISwitch *notOffFactura;
@property (strong, nonatomic) IBOutlet UITextField *txtRfc;
@property (strong, nonatomic) IBOutlet UITextField *razonSocial;
@property (strong, nonatomic) IBOutlet UITextField *txtPoblacion;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateFecha;
@property (strong, nonatomic) IBOutlet UIButton *btnRealizarPedido;
- (IBAction)btnPressedPedido:(id)sender;
- (IBAction)pressedSwitch:(id)sender;



@end
