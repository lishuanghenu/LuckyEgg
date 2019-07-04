//
//  LSEggDetailNavView.h
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol LSEggDetailNavViewProtocol <NSObject>

- (void)touchSettingView;

@end


@interface LSEggDetailNavView : UIView
@property (nonatomic, weak) id <LSEggDetailNavViewProtocol> delegate;

- (void)loadData:(id)data;

@end

NS_ASSUME_NONNULL_END
