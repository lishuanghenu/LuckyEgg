//
//  LSEggDetailVM.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailVM.h"
#import <AFNetworking/AFNetworking.h>
#import "LSEggDetailModel.h"
#import "LSEggLocationManager.h"


@interface LSEggDetailVM ()

@end

@implementation LSEggDetailVM

- (void)loadDataWithCityId:(NSString *)cityId
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"version":@"v1",
                           @"cityid":cityId.length ? cityId:@"",
                           };
    // parameters 参数字典
    [manager GET:@"https://www.tianqiapi.com/api/" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // task 我们可以通过task拿到响应头
        // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
        if (responseObject) {
            LSEggDetailModel *model = [LSEggDetailModel yy_modelWithJSON:responseObject];
            self.detailModel = model;
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // error 错误信息
    }];
}




@end
