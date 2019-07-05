//
//  LSEggDetailModel.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSEggBaseModel.h"
#import "LSEggDayWeatherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSEggDetailModel : LSEggBaseModel

@property (nonatomic, strong) NSString *cityid;
@property (nonatomic, strong) NSString *update_time;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *cityEn;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *countryEn;
@property (nonatomic, strong) NSArray *data;


@end

NS_ASSUME_NONNULL_END
