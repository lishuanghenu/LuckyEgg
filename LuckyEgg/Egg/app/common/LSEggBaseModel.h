//
//  LSEggBaseModel.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSEggBaseModel : NSObject

/// 描述model属性在json数据中的字段名映射关系
/// 1. 支持model属性名对应多个json字段名, 可以参照BiliBannerModel中写法
/// 2. 支持model属性名对应json数据中key path
+ (NSDictionary *)modelCustomPropertyMapper;

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass;

@end

NS_ASSUME_NONNULL_END
