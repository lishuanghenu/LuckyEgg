//
//  LSEggHomeVCVM.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/5.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSEggHomeVCVM : NSObject

@property (nonatomic, strong) NSArray *userLocaltionArray;

- (void)loadData;
@end

NS_ASSUME_NONNULL_END
