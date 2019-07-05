//
//  LSEggLocationManager.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^LocaltionStringBlock)(NSString * _Nullable localtionString);


NS_ASSUME_NONNULL_BEGIN
@interface LSEggLocationManager : NSObject

@property (nonatomic, strong,readonly) CLLocationManager *locationManager;

+ (LSEggLocationManager *)sharedLocationManager;

- (void)locationStringWithBlock:(LocaltionStringBlock)block;


@end

NS_ASSUME_NONNULL_END
