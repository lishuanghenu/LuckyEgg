//
//  LSEggDetailVC.m
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailVC.h"
#import "LSEggDetailCell.h"
#import "LSEggDetailNavView.h"
#import "Masonry.h"

#define kLSEggDetailVCWidthPadding (15)

@interface LSEggDetailVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) LSEggDetailNavView *navView;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) UILabel *firstPoetryLabel;
@property (nonatomic, strong) UILabel *secondPoetryLabel;

@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *windLabel;
@property (nonatomic, strong) UILabel *liveLabel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *weatherArray;

@end

@implementation LSEggDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    [self loadData:@""];
}

#pragma mark ----- Private  -----

- (void)buildUI
{
    [self.tableHeaderView addSubview:self.firstPoetryLabel];
    [self.tableHeaderView addSubview:self.secondPoetryLabel];
    [self.tableHeaderView addSubview:self.temperatureLabel];
    [self.tableHeaderView addSubview:self.windLabel];
    [self.tableHeaderView addSubview:self.liveLabel];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navView];
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.firstPoetryLabel.frame = CGRectMake(screenWidth - 10 - 44, 64 + 44
                                             ,30 , 210);
    self.secondPoetryLabel.frame = CGRectMake(screenWidth - 10 - 44 - 44 - 20, 64 + 44 + 30
                                             ,30 , 210);
    
    self.liveLabel.frame = CGRectMake(kLSEggDetailVCWidthPadding, screenHeight - 20 - 18, 200, 18);
    self.windLabel.frame = CGRectMake(kLSEggDetailVCWidthPadding, self.liveLabel.frame.origin.y - 10 - 18, 200, 18);
    self.temperatureLabel.frame = CGRectMake(kLSEggDetailVCWidthPadding, self.windLabel.frame.origin.y - 10 - 100, 300, 100);
    
    self.tableHeaderView.frame = CGRectMake(0, 0, screenWidth, screenHeight);

    self.tableView.tableHeaderView = self.tableHeaderView;
    
    self.navView.frame = CGRectMake(0, 20, screenWidth, 44);
}


#pragma mark

- (void)loadData:(id)data
{
    self.liveLabel.text = @"空气好，可以外出活动";
    self.windLabel.text = @"风呼呼的吹";
    self.temperatureLabel.text = @"26°";
    self.firstPoetryLabel.text = @"明月松间照";
    self.secondPoetryLabel.text = @"清泉石上流";
    [self.navView loadData:@""];
}

#pragma mark ----- TableView Delegate  -----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
    return self.weatherArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSEggDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[LSEggDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell loadData:@""];
    return cell;
}


#pragma mark


#pragma mark ----- Lazy Init  -----

- (UILabel *)firstPoetryLabel
{
    if (!_firstPoetryLabel) {
        _firstPoetryLabel = [UILabel new];
        _firstPoetryLabel.font = [UIFont systemFontOfSize:30];
        _firstPoetryLabel.backgroundColor = [UIColor redColor];
        _firstPoetryLabel.textColor = [UIColor blackColor];
        _firstPoetryLabel.numberOfLines = 0;
        _firstPoetryLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _firstPoetryLabel;
}

- (UILabel *)secondPoetryLabel
{
    if (!_secondPoetryLabel) {
        _secondPoetryLabel = [UILabel new];
        _secondPoetryLabel.font = [UIFont systemFontOfSize:30];
        _secondPoetryLabel.textColor = [UIColor blackColor];
        _secondPoetryLabel.numberOfLines = 0;
        _secondPoetryLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _secondPoetryLabel;
}

- (UILabel *)temperatureLabel
{
    if (!_temperatureLabel) {
        _temperatureLabel = [UILabel new];
        _temperatureLabel.font = [UIFont systemFontOfSize:80];
        _temperatureLabel.textColor = [UIColor blackColor];
    }
    return _temperatureLabel;
}


- (UILabel *)windLabel
{
    if (!_windLabel) {
        _windLabel = [UILabel new];
    }
    return _windLabel;
}

- (UILabel *)liveLabel
{
    if (!_liveLabel) {
        _liveLabel = [UILabel new];
    }
    return _liveLabel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollsToTop = NO;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

- (UIView *)tableHeaderView
{
    if (!_tableHeaderView) {
        _tableHeaderView = [UIView new];
        _tableHeaderView.backgroundColor = [UIColor clearColor];
    }
    return _tableHeaderView;
}


- (LSEggDetailNavView *)navView
{
    if (!_navView) {
        _navView = [LSEggDetailNavView new];
    }
    return _navView;
}

#pragma mark

@end
