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
}
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UITextField *txtNombre;
@property (strong, nonatomic) IBOutlet UILabel *lblNombre;

@end
