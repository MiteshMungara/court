//
//  ForgetPasswordVC.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHeader.h"
@interface ForgetPasswordVC : UIViewController
{
    IBOutlet UIButton *submitButton;
}
@property(strong,nonatomic) IBOutlet UITextField *emailTf;

-(IBAction)sendForgotPasswordBtnPressed:(id)sender;
-(IBAction)backBtnPressed:(id)sender;
@end
