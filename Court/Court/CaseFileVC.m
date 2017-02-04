//
//  CaseFileVC.m
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "CaseFileVC.h"
#import "PSProfileStepper.h"
@interface CaseFileVC ()
{
    int index;
}
@property (nonatomic, strong) IBOutlet PSProfileStepper *stepperView;
@property (nonatomic, strong) IBOutlet UILabel *progressLabelIndex;
@end

@implementation CaseFileVC

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
    
    index = 3;
    // Do any additional setup after loading the view, typically from a nib.
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.stepperView.index]];
    [self.stepperView setIndex:45 animated:YES];
    
    NSMutableDictionary *courtDetailDic = [[NSMutableDictionary alloc]init];
    
    CaseFilesArr = [[NSMutableArray alloc]init];
    for (int i=0; i < 2; i++) {
        
        [courtDetailDic setObject:@"Mitesh" forKey:@"name"];
        [courtDetailDic setObject:@"10" forKey:@"time"];
        
        [CaseFilesArr addObject:courtDetailDic];
    }
    [tbl_CaseFiles reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
}

-(IBAction)OpenDocumentBtnPressed:(id)sender
{
     [self performSegueWithIdentifier:@"CaseFileShowVC" sender:self];
}

-(IBAction)ViewDocumentBtnPressed:(id)sender
{
     [self performSegueWithIdentifier:@"CaseFileShowVC" sender:self];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return CaseFilesArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CaseFileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CaseFileCell"];
    
    cell.lblname.text = [NSString stringWithFormat:@"Name: %@",[[CaseFilesArr valueForKey:@"name"] objectAtIndex:indexPath.row]];
    
    NSMutableAttributedString *timetext =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.lblname.attributedText];
    [timetext addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [cell.lblname setAttributedText: timetext];
    
    cell.cellbgview.layer.cornerRadius = 12;
    cell.cellbgview.layer.borderWidth = 1;
    cell.cellbgview.layer.shadowColor = [UIColor colorWithRed:224.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1].CGColor;
    cell.cellbgview.layer.shadowOffset = CGSizeMake(3, 3);
    cell.cellbgview.layer.shadowOpacity = 0.8;
    cell.cellbgview.layer.shadowRadius = 0.8;
    cell.cellbgview.layer.masksToBounds = NO;
    cell.cellbgview.layer.borderColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1].CGColor;
    
   cell.cellbgview.backgroundColor = [UIColor colorWithRed:64.0f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:1];

    
    cell.openButton.layer.cornerRadius = 12;
    cell.viewButton.layer.cornerRadius = 12;
    [cell updateFocusIfNeeded];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [self performSegueWithIdentifier:@"CaseFileShowVC" sender:self];
}


@end
