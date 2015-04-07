//
//  pedidos.m
//  gasOax
//
//  Created by felipe on 06/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "pedidos.h"
#import  <Parse/Parse.h>
#import "cellPedido.h"
@interface pedidos ()

@end

@implementation pedidos

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self performSelector:@selector(imprimeData)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return obj.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellPedido";
    cellPedido *cell=(cellPedido *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[cellPedido  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    PFObject *tempObject=[obj objectAtIndex:indexPath.row];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"yyyy-MM-dd"];
    cell.lblRfc.text=[tempObject objectForKey:@"Rfc"];
    cell.lblFecha.text=[formatDate stringFromDate:[tempObject objectForKey:@"Fecha"]];    
    cell.lblCosto.text=[NSString stringWithFormat:@"%@",[tempObject objectForKey:@"Costo"]];


    return cell;
}

- (void) imprimeData{
 
        
        PFQuery *query = [PFQuery queryWithClassName:@"pedido"];
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                obj=[[NSArray alloc] initWithArray:objects];
             
                
            }
            [_tblView reloadData];
        }];
    
        
  
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
