//
//  ListaViewController.m
//  gasOax
//
//  Created by felipe on 03/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "ListaViewController.h"
#import  <Parse/Parse.h>
#import "cellTableServicio.h"
NSArray *myObjects;
@interface ListaViewController ()

@end

@implementation ListaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(imprimeData)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return obj.count;
}



//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellLista");
    static NSString *CellIdentifier = @"cellLista";
    
    cellTableServicio *cell=(cellTableServicio *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[cellTableServicio  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    PFObject *tempObject=[obj objectAtIndex:indexPath.row];
    [[tempObject objectForKey:@"Picture"] getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            UIImage *imge = [UIImage imageWithData:data];

            // image can now be set on a UIImageView
           // cell.iconImageView.image=imge;

            
        }else{
            NSLog(@"No tiene imagen");
        }
    }];
    

 //   NSDate *date = [NSDate date];

    cell.lblServicio.text=[tempObject objectForKey:@"Nombre"];
    cell.lblFecha.text=[tempObject objectForKey:@"updatedAt"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        PFObject *object = [obj objectAtIndex:indexPath.row];
        [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

            
            [_tblView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
    }
    [_tblView reloadData];
    
}


//-- Imprimiendo campos
- (void) imprimeData{
    PFUser *users=[PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"cliente"];
    [query whereKey:@"idusers" equalTo:users];
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

- (IBAction)funcBtnDelete:(id)sender {
    [self.tblView setEditing:YES animated:YES];

    
}


@end
