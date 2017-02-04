//
//  CaseFileCell.h
//  Court
//
//  Created by iSquare infoTech on 1/30/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseFileCell : UITableViewCell

@property(strong,nonatomic) IBOutlet UIView *cellbgview;
@property(strong,nonatomic) IBOutlet UILabel *lblname;
@property(strong,nonatomic) IBOutlet UIButton *viewButton, *openButton;

@end
