//
//  LSEggContainerView.m
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggContainerView.h"

@interface LSEggContainerView () <UIScrollViewDelegate>
@property (nonatomic, strong, readwrite) UIScrollView *scrollView;

@end

@implementation LSEggContainerView

- (void)dealloc
{
    self.scrollView.delegate = nil;
}

#pragma mark ----- Init  -----

- (instancetype)init
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
    [self addSubview:self.scrollView];
}

#pragma mark

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(viewWidth * [_contentViews count], viewHeight);
    
    self.scrollView.contentOffset = CGPointMake(self.currentIndex * viewWidth, 0);
    for (NSUInteger index = 0; index < [_contentViews count]; index++) {
        UIView *contentView = _contentViews[index];
        contentView.frame = CGRectMake(viewWidth * index, 0, viewWidth, viewHeight);
    }
}

#pragma mark ----- Pubilc Methed  -----

- (void)setContentViews:(NSArray *)contentViews
{
    for (UIView *view in contentViews) {
        if (!view) {
            return;
        }
        if (![view isKindOfClass:[UIView class]]) {
            return;
        }
    }
    
    for (UIView *view in _contentViews) {
        [view removeFromSuperview];
    }
    
    for (UIView *contentView in contentViews) {
        [self.scrollView addSubview:contentView];
    }
    _contentViews = contentViews;
}


#pragma mark


#pragma mark ----- scrollDelegate  -----

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = (NSUInteger)(scrollView.contentOffset.x / CGRectGetWidth(scrollView.bounds));
    if (index >=0 && index < _contentViews.count && index != self.currentIndex ) {
        self.currentIndex = index;
        [self didChangeSelectIndex:index animated:NO];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self scrollViewDidEndDecelerating:scrollView];
    }
}

#pragma mark - Observer
- (void)didChangeSelectIndex:(NSUInteger)selectedIndex animated:(BOOL)animated
{
    if (animated) {
        self.userInteractionEnabled = NO;
        __weak LSEggContainerView *wself = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong LSEggContainerView *sself = wself;
            sself.userInteractionEnabled = YES;
        });
    }
    [self.scrollView setContentOffset:CGPointMake(selectedIndex * CGRectGetWidth(self.scrollView.bounds), 0) animated:animated];
    if (self.delegate && [self.delegate respondsToSelector:@selector(lsEggContainerViewDidSelectIndex:)]) {
        [self.delegate lsEggContainerViewDidSelectIndex:selectedIndex];
    }
}
#pragma mark


#pragma mark ----- LazyInit  -----
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.scrollsToTop = NO;
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

#pragma mark

@end
