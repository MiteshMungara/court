//
//  CHeader.h
//  Court
//
//  Created by iSquare infoTech on 1/28/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#ifndef CHeader_h
#define CHeader_h

#define appDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

#define Alert(title, msg,viewController) { UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action") style:UIAlertActionStyleDefault handler:nil];[alertController addAction:okAction]; [viewController presentViewController:alertController animated:YES completion:nil];}

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


#define web_URL @"https:///charityvine.com"

#define BASE_URL [NSString stringWithFormat:@"%@/api/",web_URL]

#import <AFNetworking/AFNetworking.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "AppDelegate.h"
#import <LDProgressView/LDProgressView.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <DXCustomCallout_ObjC/DXAnnotationView.h>
#import <DXCustomCallout_ObjC/DXAnnotationSettings.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <JTAlertView/JTAlertView.h>





//[weightField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//
//[feetField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//
//[inchesField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

#endif /* CHeader_h */
