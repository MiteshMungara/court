//
//  CaseFileVC.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaseFileCell.h"

@interface CaseFileVC : UIViewController
{
    IBOutlet UITableView *tbl_CaseFiles;
    NSMutableArray *CaseFilesArr;
    IBOutlet UIView *headerViewBG;
}
-(IBAction)backBtnPressed:(id)sender;
-(IBAction)OpenDocumentBtnPressed:(id)sender;
-(IBAction)ViewDocumentBtnPressed:(id)sender;



@end
