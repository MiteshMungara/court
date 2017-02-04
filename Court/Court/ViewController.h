//
//  ViewController.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHeader.h"

@interface ViewController : UIViewController
{
    IBOutlet UITextField *loginTf, *passTf;
    IBOutlet UIView *LoginView;
    IBOutlet UIButton *loginButton;
}

-(IBAction)forgetBtnPressed:(id)sender;
-(IBAction)loginBtnPressed:(id)sender;
@end

