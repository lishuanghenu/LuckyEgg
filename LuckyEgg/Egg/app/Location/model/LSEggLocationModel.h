//
//  LSEggLocationModel.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSEggLocationModel : NSObject
@property (nonatomic, strong) NSString *city_id;
@property (nonatomic, strong) NSString *cityEn;
@property (nonatomic, strong) NSString *cityZh;
@property (nonatomic, strong) NSString *provinceEn;
@property (nonatomic, strong) NSString *provinceZh;
@property (nonatomic, strong) NSString *countryEn;
@property (nonatomic, strong) NSString *countryZh;
@property (nonatomic, strong) NSString *leaderEn;
@property (nonatomic, strong) NSString *leaderZh;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@end

NS_ASSUME_NONNULL_END
