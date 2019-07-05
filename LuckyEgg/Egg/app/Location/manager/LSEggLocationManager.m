//
//  LSEggLocationManager.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggLocationManager.h"

@interface LSEggLocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong,readwrite) CLLocationManager *locationManager;
@property (nonatomic, copy) LocaltionStringBlock localtionBlock;

@end


@implementation LSEggLocationManager
#pragma mark ----- init  -----

+ (LSEggLocationManager *)sharedLocationManager
{
    static LSEggLocationManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[LSEggLocationManager alloc] init];
    });
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 初始化定位管理器
        _locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        _locationManager.delegate = self;
        // 设置定位精确度到千米
        _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
    }
    return self;
}

#pragma mark

-(void)startLocating
{
    // 取得定位权限，有两个方法，取决于你的定位使用情况
    // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
    // 这句话ios8以上版本使用。
    if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [self.locationManager requestWhenInUseAuthorization];
    } else if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        [self.locationManager requestAlwaysAuthorization];
    }
    // 开始定位
    [self.locationManager startUpdatingLocation];
}

/* 定位完成后 回调 */
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *newLocation = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = newLocation.coordinate;
    //  经纬度
    NSLog(@"---x:%f---y:%f",coordinate.latitude,coordinate.longitude);
    
    [manager stopUpdatingLocation];   //停止定位
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            //获取当前城市
//            NSString *city = placemark.locality;
//            if (!city) {
//                //注意：四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                city = placemark.administrativeArea;
//            }
            NSString * subCity = placemark.subLocality;
            NSArray *array = [subCity componentsSeparatedByString:@"区"];
            NSString *subCityStr = array[0];
            if (self.localtionBlock) {
                self.localtionBlock(subCityStr);
            }
        }
        else if (error == nil && [array count] == 0) {
            NSLog(@"没有结果返回.");
        }
        else if (error != nil)  {
            //NSLog(@"An error occurred = %@", error);
        }
    }];
}


#pragma mark ----- Public  -----

- (void)locationStringWithBlock:(LocaltionStringBlock)block
{
    self.localtionBlock = block;
    [self startLocating];
}

#pragma mark
@end
