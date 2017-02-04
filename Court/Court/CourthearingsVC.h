//
//  CourthearingsVC.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourthearingCell.h"
@interface CourthearingsVC : UIViewController
{
    IBOutlet UITableView *tbl_courthearing;
    NSMutableArray *courtDetailArr;
    IBOutlet UIView *headerViewLabel;
}


-(IBAction)backBtnPressed:(id)sender;
@end
