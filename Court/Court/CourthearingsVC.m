//
//  CourthearingsVC.m
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "CourthearingsVC.h"

#import "PSProfileStepper.h"

@interface CourthearingsVC ()
{
    int index;
}
@property (nonatomic, strong) IBOutlet PSProfileStepper *stepperView;
@property (nonatomic, strong) IBOutlet UILabel *progressLabelIndex;
@end

@implementation CourthearingsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(  0,80 , -1.5f, 80);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(headerViewLabel.bounds, shadowInsets)];
    headerViewLabel.layer.shadowColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1].CGColor;
    headerViewLabel.layer.shadowOffset = CGSizeMake(0, 3);
    headerViewLabel.layer.shadowOpacity = 0.8;
    headerViewLabel.layer.shadowRadius = 0.8;
    headerViewLabel.layer.shadowPath    = shadowPath.CGPath;
    headerViewLabel.layer.masksToBounds = NO;
    
    index = 0;
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.stepperView.index]];
    [self.stepperView setIndex:2 animated:YES];

    NSMutableDictionary *courtDetailDic = [[NSMutableDictionary alloc]init];
  
    
    courtDetailArr = [[NSMutableArray alloc]init];
    for (int i=0; i < 2; i++) {
        
        [courtDetailDic setObject:@"Mitesh" forKey:@"name"];
        [courtDetailDic setObject:@"3 Block" forKey:@"arrangement"];
        [courtDetailDic setObject:@"200" forKey:@"deposite"];
        [courtDetailDic setObject:@"1" forKey:@"preTrialConference"];
        [courtDetailArr addObject:courtDetailDic];
    }
    [tbl_courthearing reloadData];
}

- (IBAction)changeSliderValue:(PSProfileStepper*)sender {
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)sender.index]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return courtDetailArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourthearingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"courthearingCell"];
   
    cell.namelbl.text = [NSString stringWithFormat:@"Name: %@",[[courtDetailArr valueForKey:@"name"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.namelbl.attributedText];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [cell.namelbl setAttributedText: text];
    
     cell.arrangementlbl.text = [NSString stringWithFormat:@"Arraignment: %@",[[courtDetailArr valueForKey:@"arrangement"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *arrangetext =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.arrangementlbl.attributedText];
    [arrangetext addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 12)];
    [cell.arrangementlbl setAttributedText: arrangetext];
    
     cell.pretrialConferencelbl.text = [NSString stringWithFormat:@"Pre-Trial Conference: %@",[[courtDetailArr valueForKey:@"preTrialConference"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *pretext =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.pretrialConferencelbl.attributedText];
    [pretext addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 21)];
    [cell.pretrialConferencelbl setAttributedText: pretext];
    
    
     cell.depositionlbl.text = [NSString stringWithFormat:@"Deposite: %@",[[courtDetailArr valueForKey:@"deposite"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *depositetext =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.depositionlbl.attributedText];
    [depositetext addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,9)];
    [cell.depositionlbl setAttributedText: depositetext];
    
    //64-224-208
    cell.cellbgview.layer.cornerRadius = 12;
    cell.cellbgview.layer.borderWidth = 1;
    cell.cellbgview.layer.shadowColor = [UIColor colorWithRed:224.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1].CGColor;
    cell.cellbgview.layer.shadowOffset = CGSizeMake(3, 3);
    cell.cellbgview.layer.shadowOpacity = 0.8;
    cell.cellbgview.layer.shadowRadius = 0.8;
    cell.cellbgview.layer.masksToBounds = NO;
    cell.cellbgview.layer.borderColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1].CGColor;
    
    NSLog(@"%@",[[courtDetailArr valueForKey:@"name"] objectAtIndex:indexPath.row]);
    cell.cellbgview.backgroundColor = [UIColor colorWithRed:64.0f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:1];
    
    [cell updateFocusIfNeeded];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"CommunityServiceTrackerVC" sender:self];
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
@end
