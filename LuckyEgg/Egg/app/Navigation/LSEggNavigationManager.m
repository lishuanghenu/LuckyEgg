//
//  LSEggNavigationManager.m
//  Egg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggNavigationManager.h"
#import "LSEggSettingVC.h"
#import "LSEggSearchVC.h"

@implementation LSEggNavigationManager

+ (LSEggNavigationManager *)sharedNavigator
{
    static LSEggNavigationManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[LSEggNavigationManager alloc] init];
    });
    return shared;
}

#pragma mark ----- Public  -----
- (void)setNavigationController:(UINavigationController *)navigationController
{
    _navigationController = navigationController;
}


- (void)showSearchVC
{
    LSEggSearchVC *searchVC = [LSEggSearchVC new];
    [self.navigationController presentViewController:searchVC animated:YES completion:^{
        
    }];
}

- (void)showSettingVC
{
    LSEggSettingVC *settingVC = [LSEggSettingVC new];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.homeViewController presentViewController:settingVC animated:YES completion:^{
            
        }];
    });
    
}

#pragma mark



@end
