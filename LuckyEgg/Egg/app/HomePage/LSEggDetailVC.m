//
//  LSEggDetailVC.m
//  LSEgg
//
//  Created by 李爽 on 2019/7/2.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggDetailVC.h"

@interface LSEggDetailVC ()

@end

@implementation LSEggDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 100, 200, 100);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
