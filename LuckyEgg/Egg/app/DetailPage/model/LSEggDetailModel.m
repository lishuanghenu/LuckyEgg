//
//  LSEggDetailModel.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailModel.h"


@implementation LSEggDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"data" : [LSEggDayWeatherModel class]};
}

@end
