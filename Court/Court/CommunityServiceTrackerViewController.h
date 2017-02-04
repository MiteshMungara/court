//
//  CommunityServiceTrackerViewController.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHeader.h"
#import "CommunityServiceTrackerCell.h"
@interface CommunityServiceTrackerViewController : UIViewController
{
    IBOutlet UITableView *tbl_communityServiceTracker;
    NSMutableArray *communitiesDetailArr;
    IBOutlet UIView *headerViewBG;
}

-(IBAction)backBtnPressed:(id)sender;
@end
