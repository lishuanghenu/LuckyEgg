//
//  LSEggDetailVC.h
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LSEggUserLoacltionModel;
@interface LSEggDetailVC : UIViewController

- (void)loadLocationModel:(LSEggUserLoacltionModel *)localtionModel;

@end

NS_ASSUME_NONNULL_END
