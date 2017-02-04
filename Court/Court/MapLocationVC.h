//
//  MapLocationVC.h
//  Court
//
//  Created by iSquare infoTech on 1/31/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapLocationVC.h"
#import <MapKit/MapKit.h>
#import "CHeader.h"
@interface MapLocationVC : UIViewController
{
    IBOutlet UIView *headerViewBG;
}

-(IBAction)backBtnPressed:(id)sender;
@end
