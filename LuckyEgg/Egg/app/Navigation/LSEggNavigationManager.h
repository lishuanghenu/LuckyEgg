//
//  LSEggNavigationManager.h
//  Egg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSEggNavigationManager : NSObject

@property (nonatomic, strong) UINavigationController *navigationController;

+ (LSEggNavigationManager *)sharedNavigator;


- (void)showSearchVC;

- (void)showSettingVC;

@end

NS_ASSUME_NONNULL_END
