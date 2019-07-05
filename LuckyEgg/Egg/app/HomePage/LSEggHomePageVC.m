//
//  LSEggHomePageVC.m
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggHomePageVC.h"
#import "LSEggDetailVC.h"
#import "LSEggContainerView.h"
#import "LSEggSettingVC.h"
#import "LSEggHomeVCVM.h"
#import "LSEggUserLoacltionModel.h"
#import <ReactiveObjC.h>

@interface LSEggHomePageVC () <LSEggContainerViewProtocol>

@property (nonatomic, assign) CGRect screenBounds;
@property (nonatomic, strong) LSEggContainerView *containerView;
@property (nonatomic, strong) NSArray *contentViewControllers;

@property (nonatomic, strong) UIImageView *homeBgImageView;

@property (nonatomic, strong) LSEggHomeVCVM *viewModel;

@end

@implementation LSEggHomePageVC

#pragma mark  ----- Life Cycle -----
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [LSEggHomeVCVM new];
    
    _screenBounds = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.homeBgImageView];
    self.homeBgImageView.frame = _screenBounds;
    [self.view addSubview:self.containerView];
    [self.viewModel loadData];
    
    @weakify(self);
    [RACObserve(self.viewModel, userLocaltionArray) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        NSMutableArray *tempVCArray = [NSMutableArray new];
        NSMutableArray *tempViewArray = [NSMutableArray new];
        for (int i = 0 ; i < self.viewModel.userLocaltionArray.count;i++) {
            LSEggDetailVC *detail = [LSEggDetailVC new];
            [detail loadLocationModel:self.viewModel.userLocaltionArray[i]];
            detail.view.frame = self.screenBounds;
            detail.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.0];
            [tempVCArray addObject:detail];
            [self addChildViewController:detail];
            [tempViewArray addObject:detail.view];
        }
        self.contentViewControllers = [tempVCArray copy];
        [self.containerView setContentViews:[tempViewArray copy]];
        [self.containerView setNeedsLayout];
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
#pragma mark


#pragma mark -----  Private Methed -----

- (void)reloadData
{
    [self.viewModel loadData];
}
#pragma mark


#pragma mark ----- Public Methed -----
- (void)needReloadData
{
    [self reloadData];
}
#pragma mark


#pragma mark ----- LSEggContainerViewProtocol  -----

- (void)lsEggContainerViewDidSelectIndex:(NSInteger)index
{
    [self.homeBgImageView.layer removeAnimationForKey:@"a"];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg",index]];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.homeBgImageView.layer addAnimation:transition forKey:@"a"];
    [self.homeBgImageView setImage:image];
}

#pragma mark

#pragma mark ----- Lazy Methods -----

- (LSEggContainerView *)containerView
{
    if (!_containerView) {
        _containerView = [LSEggContainerView new];
        _containerView.frame = _screenBounds;
        _containerView.backgroundColor = [UIColor clearColor];
        _containerView.delegate = self;
    }
    return _containerView;
}

- (UIImageView *)homeBgImageView
{
    if (!_homeBgImageView) {
        _homeBgImageView = [UIImageView new];
        _homeBgImageView.image = [UIImage imageNamed:@"2.jpg"];
    }
    return _homeBgImageView;
}
@end
