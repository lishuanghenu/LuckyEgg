//
//  LSEggDayWeatherModel.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSEggHourWeatherModel : LSEggBaseModel
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *wea;
@property (nonatomic, strong) NSString *tem;
@property (nonatomic, strong) NSString *win;
@property (nonatomic, strong) NSString *win_speed;

@end

@interface LSEggDayWeatherModel : LSEggBaseModel
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *week;
@property (nonatomic, strong) NSString *wea; // 天气
@property (nonatomic, assign) NSInteger air;// 空气质量
@property (nonatomic, assign) NSInteger humidity; // 湿度
@property (nonatomic, strong) NSString *air_level;
@property (nonatomic, strong) NSString *air_tips;
@property (nonatomic, strong) NSString *tem_max; //tem1 最高温度
@property (nonatomic, strong) NSString *tem_min; // tem2 最低温度
@property (nonatomic, strong) NSString *tem_now; // tem 当前温度
@property (nonatomic, strong) NSArray *win; // 风向
@property (nonatomic, strong) NSString *win_speed;// 风力
@property (nonatomic, strong) NSArray *hours; // 分时天气
@property (nonatomic, strong) NSArray *index; // 其他建议


@end

NS_ASSUME_NONNULL_END
