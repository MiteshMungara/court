//
//  CaseFileShowVC.m
//  Court
//
//  Created by iSquare infoTech on 1/31/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "CaseFileShowVC.h"
#import "PSProfileStepper.h"

@interface CaseFileShowVC ()
{
    int index;
}
@property (nonatomic, strong) IBOutlet PSProfileStepper *stepperView;
@property (nonatomic, strong) IBOutlet UILabel *progressLabelIndex;
@end

@implementation CaseFileShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(  0,80 , -1.5f, 80);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(headerViewBG.bounds, shadowInsets)];
    headerViewBG.layer.shadowColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1].CGColor;
    headerViewBG.layer.shadowOffset = CGSizeMake(0, 3);
    headerViewBG.layer.shadowOpacity = 0.8;
    headerViewBG.layer.shadowRadius = 0.8;
    headerViewBG.layer.shadowPath    = shadowPath.CGPath;
    headerViewBG.layer.masksToBounds = NO;
    
    
    index = 4;
    // Do any additional setup after loading the view, typically from a nib.
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.stepperView.index]];
    [self.stepperView setIndex:75 animated:YES];
    
   // hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [SVProgressHUD show];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Report) userInfo:Nil repeats:NO];

}


-(void)Report
{
//    if ([[Reachability sharedReachability]internetConnectionStatus]==NotReachable)
//    {
//        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Check Internet Connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alrt show];
//    }
//    else
//    {
        NSString *webUrlstr = [NSString stringWithFormat:@"https://www.google.com"];
        NSURL *nsweburl = [NSURL URLWithString:webUrlstr];
//        NSData *urlData = [NSData dataWithContentsOfURL:nsweburl];
//        if ( urlData )
//        {
//            NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            NSString  *documentsDirectory = [paths objectAtIndex:0];
//            
//            NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"report.pdf"];
//            [urlData writeToFile:filePath atomically:YES];
//        }
        // Do any additional setup after loading the view.
        //NSLog(@"");
        //nameLabel.text = [[dataArray valueForKey:@"DoctorName"]objectAtIndex:0];
        
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:nsweburl];
        [webViewReport loadRequest:requestObj];
        webViewReport.scalesPageToFit=YES;
        
        [self.view addSubview:webViewReport];
    [SVProgressHUD dismiss];
       // [MBProgressHUD hideHUDForView:self.view animated:YES];
   // }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
}


-(IBAction)MapViewBtnPressed:(id)sender
{
    [self performSegueWithIdentifier:@"MapLocationVC" sender:self];
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
