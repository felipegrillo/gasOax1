//
//  pedidos.h
//  gasOax
//
//  Created by felipe on 06/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pedidos : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>{
    NSArray *obj;
    NSArray *nombreCliente;
}


@property (strong, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic) IBOutlet UIButton *btnAtras;

@end
