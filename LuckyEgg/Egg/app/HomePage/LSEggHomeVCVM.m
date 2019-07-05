//
//  LSEggHomeVCVM.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggHomeVCVM.h"
#import "LSEggUserLoacltionModel.h"
#import <ReactiveObjC.h>
#import "LSEggLocationManager.h"
#import "LSEggFMDBManager.h"

@interface LSEggHomeVCVM ()

@property (nonatomic, strong) LSEggUserLoacltionModel *defaultLocaltion;


@end

@implementation LSEggHomeVCVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userLocaltionArray = [NSArray new];
        
        @weakify(self);
        [RACObserve(self, defaultLocaltion) subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            if (self.defaultLocaltion) {
                NSMutableArray *dataArray = [[NSMutableArray alloc] initWithArray:self.userLocaltionArray];
                [dataArray insertObject:self.defaultLocaltion atIndex:0];
                self.userLocaltionArray = [dataArray copy];
            }
        }];
    }
    return self;
}

- (void)loadData
{
    /// 当前地址获取
    [self getUserDefaultLocaltion];
    /// 其他想要关注的地址
}


- (void)getUserDefaultLocaltion
{
    @weakify(self);
    [[LSEggLocationManager sharedLocationManager] locationStringWithBlock:^(NSString * _Nullable localtionString) {
        @strongify(self);
        if (localtionString.length) {
           NSString *cityid = [[LSEggFMDBManager sharedFMDBManager] getCityIdWithName:localtionString];
            LSEggUserLoacltionModel *temp = [LSEggUserLoacltionModel new];
            temp.isDefault = YES;
            temp.loadDefaultSuccess = YES;
            temp.cityName = localtionString;
            temp.cityid = cityid;
            self.defaultLocaltion = temp;
        }
    }];
}



@end
