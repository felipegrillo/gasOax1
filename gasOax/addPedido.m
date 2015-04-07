//
//  addPedido.m
//  gasOax
//
//  Created by felipe on 06/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import "addPedido.h"
#import <Parse/Parse.h>
@interface addPedido (){
    NSArray *listPicker;
}

@end

@implementation addPedido

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    listPicker = @[@"10", @"20", @"20", @"40", @"50", @"60",@"70",@"80",@"90",@"100",@"110",@"120",@"150",@"180",@"200",@"250",@"300"];
    PFUser *users=[PFUser currentUser];
    NSLog(@"%@",users.objectId);
    
    PFQuery *query = [PFQuery queryWithClassName:@"cliente"];
    [query whereKey:@"idusers" equalTo:users];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
  
        nombreCliente=[[NSArray alloc] initWithArray:objects];
    }];
 
    for (PFObject *song in nombreCliente) {
        // This does not require a network access.
        self.lblNombre.text = [song objectForKey:@"Nombre"];
        
        
    }
    self.lblNombre.text=@"Felipe";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return listPicker.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return listPicker[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
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
