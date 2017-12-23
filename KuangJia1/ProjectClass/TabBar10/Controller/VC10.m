//
//  VC10.m
//  KuangJia1
//
//  Created by MrSong on 17/7/31.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC10.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface VC10 ()<MAMapViewDelegate>

@property (strong, nonatomic) MAMapView *mapView;

@end

@implementation VC10

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //插入地图
    [self addMapView];
}

- (void)addMapView{
    
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    ///初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeNone;
    _mapView.distanceFilter = 1000;
    self.mapView.userLocation.title = @"您的位置在这里";
    _mapView.zoomLevel = 16;
    _mapView.delegate = self;
    ///把地图添加至view
    
    MAUserLocationRepresentation *represent = [[MAUserLocationRepresentation alloc] init];
    represent.showsAccuracyRing = YES;
    represent.showsHeadingIndicator = YES;
    represent.image = [UIImage imageNamed:@"gerendingwei"];
    [self.mapView updateUserLocationRepresentation:represent];
    
    
    CLLocationCoordinate2D ra = _mapView.userLocation.coordinate;
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = ra;
    annotation.title = @"标题";
    annotation.subtitle = @"子标题";
    [self.mapView addAnnotation:annotation];
    
}

//地图将要缩放
- (void)mapView:(MAMapView *)mapView mapWillZoomByUser:(BOOL)wasUserAction{

//    [self showArea];
}
//设置显示区域
- (void)showArea{
    CGFloat aaa = 2000;//上下一千米 左右一千米
    //坐标
    CLLocationCoordinate2D coord2D = _mapView.userLocation.location.coordinate;
    //显示区域（中心点、上下左右范围）
    MACoordinateRegion region = MACoordinateRegionMakeWithDistance(coord2D, aaa*_mapView.zoomLevel, aaa*_mapView.zoomLevel);
    MACoordinateRegion autoRegion = [_mapView regionThatFits:region];
    //设置显示区域
    [_mapView setRegion:autoRegion animated:YES];
}
// 当手势开始（拖拽，放大，缩小，双击）
- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
    CLLocationCoordinate2D coords = _mapView.userLocation.location.coordinate;
    
    //判断坐标是否在MapView显示范围内：
    CLLocationDegrees leftDegrees = mapView.region.center.longitude -(mapView.region.span.longitudeDelta / 2.0);
    CLLocationDegrees rightDegrees = mapView.region.center.longitude +(mapView.region.span.longitudeDelta / 2.0);
    CLLocationDegrees bottomDegrees = mapView.region.center.latitude -(mapView.region.span.latitudeDelta / 2.0);
    CLLocationDegrees topDegrees = mapView.region.center.latitude +(mapView.region.span.latitudeDelta / 2.0);
    
    if (leftDegrees > rightDegrees) { // Int’l Date Line in View
        leftDegrees = -180.0 - leftDegrees;
        if (coords.longitude > 0) // coords to West of Date Line
            coords.longitude = -180.0 - coords.longitude;
    }
    if (leftDegrees <= coords.longitude && coords.longitude <= rightDegrees && bottomDegrees <= coords.latitude && coords.latitude <= topDegrees) {
        // 坐标在范围内
    }
}

- (MAAnnotationView *) mapView:(MAMapView *)theMapView viewForAnnotation:(id <MAAnnotation>) annotation {
    static NSString *placemarkIdentifier = @"自定义大头针";
    if ([annotation isKindOfClass:[MAAnnotationView class]]) {
        MAAnnotationView *annotationView = [theMapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        if (annotationView == nil) {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:placemarkIdentifier];
            annotationView.image = [UIImage imageNamed:@"blood_orange.png"];
        }
        else
            annotationView.annotation = annotation;
        return annotationView;
    }
    return nil;
}

@end
