//
//  CaseFileShowVC.h
//  Court
//
//  Created by iSquare infoTech on 1/31/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHeader.h"
@interface CaseFileShowVC : UIViewController
{
    IBOutlet UIWebView *webViewReport;
    IBOutlet UIView *headerViewBG;
}

-(IBAction)MapViewBtnPressed:(id)sender;


@end
