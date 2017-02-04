//
//  ViewController.m
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LoginView.layer.cornerRadius = 12;
    
 
   //  NSDictionary *atribDic = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:12.0]};
    //loginTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"EMAIL" attributes:atribDic];
    
  //  loginTf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"PASSWORD" attributes:atribDic];
    loginButton.layer.cornerRadius = 12;
    //[self AlertShow];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginBtnPressed:(id)sender
{
    [self performSegueWithIdentifier:@"CourthearingsVC" sender:self];
}
-(IBAction)forgetBtnPressed:(id)sender
{
    [self performSegueWithIdentifier:@"forgotVC" sender:self];
}

-(void)AlertShow
{
    JTAlertView *alertView = [[JTAlertView alloc] initWithTitle:@"You are wonderful" andImage:nil];
    alertView.size = CGSizeMake(280, 230);
    
    [alertView addButtonWithTitle:@"OK" style:JTAlertViewStyleDefault action:^(JTAlertView *alertView) {
        [alertView hide];
    }];
    
    [alertView show];
}
@end

