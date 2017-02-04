//
//  CommunityServiceTrackerViewController.m
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "CommunityServiceTrackerViewController.h"
#import "PSProfileStepper.h"
@interface CommunityServiceTrackerViewController ()
{
    int index;
}
@property (nonatomic, strong) IBOutlet PSProfileStepper *stepperView;
@property (nonatomic, strong) IBOutlet UILabel *progressLabelIndex;
@end

@implementation CommunityServiceTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(  0,80 , -1.5f, 80);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(headerViewBG.bounds, shadowInsets)];
    headerViewBG.layer.shadowColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1].CGColor;
    headerViewBG.layer.shadowOffset = CGSizeMake(0, 3);
    headerViewBG.layer.shadowOpacity = 0.8;
    headerViewBG.layer.shadowRadius = 0.8;
    headerViewBG.layer.shadowPath    = shadowPath.CGPath;
    headerViewBG.layer.masksToBounds = NO;
    
    
    index = 1;
    // Do any additional setup after loading the view, typically from a nib.
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.stepperView.index]];
    [self.stepperView setIndex:20 animated:YES];
    
    // Do any additional setup after loading the view.
    NSMutableDictionary *courtDetailDic = [[NSMutableDictionary alloc]init];
    
    communitiesDetailArr = [[NSMutableArray alloc]init];
    for (int i=0; i < 2; i++) {
        
        [courtDetailDic setObject:@"Mitesh" forKey:@"name"];
        [courtDetailDic setObject:@"10" forKey:@"time"];
       
        [communitiesDetailArr addObject:courtDetailDic];
    }
    [tbl_communityServiceTracker reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return communitiesDetailArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityServiceTrackerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"communityservicetrackingCell"];
    
    cell.namecommunitieslbl.text = [NSString stringWithFormat:@"Name: %@",[[communitiesDetailArr valueForKey:@"name"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.namecommunitieslbl.attributedText];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [cell.namecommunitieslbl setAttributedText: text];
    
    
    cell.timecommunitylbl.text = [NSString stringWithFormat:@"Time: %@",[[communitiesDetailArr valueForKey:@"time"] objectAtIndex:indexPath.row]];
    NSMutableAttributedString *timetext =
    [[NSMutableAttributedString alloc]initWithAttributedString: cell.timecommunitylbl.attributedText];
    [timetext addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [cell.timecommunitylbl setAttributedText: timetext];
    
    
    cell.cellbgview.layer.cornerRadius = 12;
    cell.cellbgview.layer.borderWidth = 1;
    cell.cellbgview.layer.shadowColor = [UIColor colorWithRed:224.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1].CGColor;
    cell.cellbgview.layer.shadowOffset = CGSizeMake(3, 3);
    cell.cellbgview.layer.shadowOpacity = 0.8;
    cell.cellbgview.layer.shadowRadius = 0.8;
    cell.cellbgview.layer.masksToBounds = NO;
    cell.cellbgview.layer.borderColor = [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1].CGColor;
    
    
    cell.cellbgview.backgroundColor = [UIColor colorWithRed:64.0f/255.0f green:224.0f/255.0f blue:208.0f/255.0f alpha:1];

    
    [cell updateFocusIfNeeded];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"CaseFileVC" sender:self];
}

-(IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
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
