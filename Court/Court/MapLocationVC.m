//
//  MapLocationVC.m
//  Court
//
//  Created by iSquare infoTech on 1/31/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "MapLocationVC.h"
#import <DXCustomCallout_ObjC/DXAnnotationView.h>
#import "PSProfileStepper.h"
@interface DXAnnotation : NSObject <MKAnnotation>


@property(nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
@interface MapLocationVC ()<MKMapViewDelegate>
{
    int index;
}
@property (nonatomic, strong) IBOutlet PSProfileStepper *stepperView;
@property (nonatomic, strong) IBOutlet UILabel *progressLabelIndex;
@property(weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapLocationVC

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
    
    index = 5;
    
    [self.progressLabelIndex setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.stepperView.index]];
    
    [self.stepperView setIndex:100 animated:YES];
    
    
    DXAnnotation *annotation1 = [DXAnnotation new];
    annotation1.coordinate = CLLocationCoordinate2DMake(12.9667, 77.5667);
    [self.mapView addAnnotation:annotation1];
    
    DXAnnotation *ann2 = [DXAnnotation new];
    ann2.coordinate = CLLocationCoordinate2DMake(44.518640, 11.362665);
    
    DXAnnotation *ann3 = [DXAnnotation new];
    ann3.coordinate = CLLocationCoordinate2DMake(44.521318, 11.374080);
    
    DXAnnotation *ann4 = [DXAnnotation new];
    ann4.coordinate = CLLocationCoordinate2DMake(44.500746, 11.345394);
    
    DXAnnotation *ann5 = [DXAnnotation new];
    ann5.coordinate = CLLocationCoordinate2DMake(44.490537, 11.358033);
    
    DXAnnotation *ann6 = [DXAnnotation new];
    ann6.coordinate = CLLocationCoordinate2DMake(44.504082, 11.354256);
    
    [self.mapView addAnnotation:ann2];
    [self.mapView addAnnotation:ann3];
    [self.mapView addAnnotation:ann4];
    [self.mapView addAnnotation:ann5];
    [self.mapView addAnnotation:ann6];
    
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(ann2.coordinate, 10000, 10000)];
    
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[DXAnnotation class]]) {
        
       UIImageView *pinView = nil;
        
        UIView *calloutView = nil;
        
        DXAnnotationView *annotationView = (DXAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:NSStringFromClass([DXAnnotationView class])];
        
        if (!annotationView) {
            pinView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin"]];
            calloutView = [[[NSBundle mainBundle] loadNibNamed:@"myView" owner:self options:nil] firstObject];
            
            annotationView = [[DXAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:NSStringFromClass([DXAnnotationView class])
                                                                  pinView:pinView
                                                              calloutView:calloutView
                                                                 settings:[DXAnnotationSettings defaultSettings]];
        }else {
            
            //Changing PinView's image to test the recycle
          
           pinView = (UIImageView *)annotationView.pinView;
            pinView.image = [UIImage imageNamed:@"car-blue-icon"];
        }
        
        
        return annotationView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view isKindOfClass:[DXAnnotationView class]]) {
        [((DXAnnotationView *)view)hideCalloutView];
        view.layer.zPosition = -1;
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view isKindOfClass:[DXAnnotationView class]]) {
        [((DXAnnotationView *)view)showCalloutView];
        view.layer.zPosition = 0;
    }
}

-(IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
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

@end

@implementation DXAnnotation

@end
