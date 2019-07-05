//
//  LSEggUserLoacltionModel.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSEggUserLoacltionModel : LSEggBaseModel
@property (nonatomic, assign) BOOL     isDefault;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityid;
@property (nonatomic, assign) BOOL    loadDefaultSuccess;
@end

NS_ASSUME_NONNULL_END
