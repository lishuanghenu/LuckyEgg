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

@interface LSEggHomePageVC () <LSEggContainerViewProtocol>
{
    CGRect _screenBounds;
}
@property (nonatomic, strong) LSEggContainerView *containerView;
@property (nonatomic, strong) NSArray *contentViewControllers;

@property (nonatomic, strong) NSArray * dataArray;

@property (nonatomic, strong) UIImageView *homeBgImageView;

@end

@implementation LSEggHomePageVC

#pragma mark  ----- Life Cycle -----
- (void)viewDidLoad {
    [super viewDidLoad];
    _screenBounds = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.homeBgImageView];
    self.homeBgImageView.frame = _screenBounds;
    [self.view addSubview:self.containerView];
    [self reloadData];
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
    self.dataArray = @[@"上海",@"武汉",@"信阳"];
    NSMutableArray *tempVCArray = [NSMutableArray new];
    NSMutableArray *tempViewArray = [NSMutableArray new];
    for (int i = 0 ; i < self.dataArray.count; i++) {
        LSEggDetailVC *detail = [LSEggDetailVC new];
        detail.view.frame = _screenBounds;
        detail.view.backgroundColor = [UIColor clearColor];
        [tempVCArray addObject:detail];
        [self addChildViewController:detail];
        [tempViewArray addObject:detail.view];
    }
    self.contentViewControllers = [tempVCArray copy];
    [self.containerView setContentViews:[tempViewArray copy]];
    [self.containerView setNeedsLayout];
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
        _homeBgImageView.image = [UIImage imageNamed:@"1.jpg"];
    }
    return _homeBgImageView;
}
@end
