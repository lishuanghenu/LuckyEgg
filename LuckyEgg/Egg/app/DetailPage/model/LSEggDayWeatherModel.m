//
//  LSEggDayWeatherModel.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDayWeatherModel.h"

@implementation LSEggHourWeatherModel

@end

@implementation LSEggDayWeatherModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{
             @"tem_max" : @"tem1",
             @"tem_min" : @"tem2",
             @"tem_now" : @"tem"
             };
}

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"hours" : LSEggHourWeatherModel.class};
}


@end
