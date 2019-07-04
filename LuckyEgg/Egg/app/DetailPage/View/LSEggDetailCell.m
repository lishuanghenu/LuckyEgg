//
//  LSEggDetailCell.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/3.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailCell.h"
#import "Masonry.h"

@interface LSEggDetailCell ()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;

@end


@implementation LSEggDetailCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.weatherLabel];
    [self.contentView addSubview:self.temperatureLabel];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.height.equalTo(@14);
        make.width.equalTo(@100);
    }];
    
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.height.equalTo(@14);
        make.width.equalTo(@50);
    }];
    
    [self.temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@14);
        make.width.equalTo(@100);
    }];
}


- (void)loadData:(id)data
{
    self.dateLabel.text = @"星期一";
    self.weatherLabel.text = @"多云";
    self.temperatureLabel.text = @"23~26度";
}


#pragma mark ----- Lazy init  -----

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [UILabel new];
    }
    return _dateLabel;
}

- (UILabel *)weatherLabel
{
    if (!_weatherLabel) {
        _weatherLabel = [UILabel new];
    }
    return _weatherLabel;
}

- (UILabel *)temperatureLabel
{
    if (!_temperatureLabel) {
        _temperatureLabel = [UILabel new];
        _temperatureLabel.textAlignment = NSTextAlignmentRight;
    }
    return _temperatureLabel;
}

#pragma mark


@end
