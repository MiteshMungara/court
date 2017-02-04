//
//  CourthearingCell.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourthearingCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UILabel *namelbl, *arrangementlbl, *pretrialConferencelbl, *depositionlbl, *hearinglbl;

@property(strong,nonatomic) IBOutlet UIView *cellbgview;
@end
