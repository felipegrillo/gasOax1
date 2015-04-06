//
//  ListaViewController.h
//  gasOax
//
//  Created by felipe on 03/04/15.
//  Copyright (c) 2015 felipe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ListaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>{
    NSArray *obj;
}
@property (weak, nonatomic) IBOutlet UITableView *tblView;
- (IBAction)funcBtnDelete:(id)sender;


@end
