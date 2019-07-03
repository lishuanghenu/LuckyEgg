//
//  LSEggContainerView.h
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol  LSEggContainerViewProtocol <NSObject>

- (void)lsEggContainerViewDidSelectIndex:(NSInteger)index;

@end


@interface LSEggContainerView : UIView

@property (nonatomic, weak) id <LSEggContainerViewProtocol> delegate;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSArray *contentViews;
@property (nonatomic, readonly) UIScrollView *scrollView;

@end

NS_ASSUME_NONNULL_END
