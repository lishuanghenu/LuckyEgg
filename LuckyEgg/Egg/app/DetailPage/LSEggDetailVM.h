//
//  LSEggDetailVM.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSEggDetailModel;
@interface LSEggDetailVM : NSObject
@property (nonatomic, strong) LSEggDetailModel *detailModel;

- (void)loadDataWithCityId:(NSString *)cityId;

@end

NS_ASSUME_NONNULL_END
