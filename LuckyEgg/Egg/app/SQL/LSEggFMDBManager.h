//
//  LSEggFMDBManager.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSEggFMDBManager : NSObject

+ (LSEggFMDBManager *)sharedFMDBManager;
/// 创建生成地址库表
- (void)localtionTableInit;


- (NSArray *)getLocalAdressList;


- (NSString *)getCityIdWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
