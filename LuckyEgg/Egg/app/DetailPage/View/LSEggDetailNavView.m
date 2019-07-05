//
//  LSEggDetailNavView.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailNavView.h"
#import "Masonry.h"
#import <ReactiveObjC.h>
#import "LSEggNavigationManager.h"
#import "LSEggLocationManager.h"

@interface LSEggDetailNavView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *addImageView;
@property (nonatomic, strong) UIImageView *settingImageView;

@end

@implementation LSEggDetailNavView

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.addImageView];
    [self addSubview:self.settingImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@200);
        make.height.equalTo(@22);
    }];
    
    [self.settingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self).offset(-10);
        make.width.and.height.equalTo(@44);
    }];
    
}

#pragma mark ----- Public  -----

- (void)loadData:(id)data
{
    self.titleLabel.text = (id)data;
}

#pragma mark

- (void)touchSetting
{
//    [[LSEggNavigationManager sharedNavigator] showSettingVC];
    @weakify(self);
    [[LSEggLocationManager sharedLocationManager] locationStringWithBlock:^(NSString * _Nullable localtionString) {
        @strongify(self);
        if (localtionString.length) {
            self.titleLabel.text = localtionString;
        }
    }];
}


#pragma mark ----- LazyInit  -----

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _titleLabel;
}

- (UIImageView *)addImageView
{
    if (!_addImageView) {
        _addImageView = [UIImageView new];
    }
    return _addImageView;
}

- (UIImageView *)settingImageView
{
    if (!_settingImageView) {
        _settingImageView = [UIImageView new];
        _settingImageView.backgroundColor = [UIColor redColor];
        _settingImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchSetting)];
        [_settingImageView addGestureRecognizer:tap];
    }
    return _settingImageView;
}

#pragma mark

@end
