//
//  BaseTabBarController.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tabBar.tintColor = [UIColor groupTableViewBackgroundColor] ;
    
    //设置"more"tabbar界面导航栏
    [self.moreNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"我的背景"] forBarMetrics:UIBarMetricsDefault];
    self.moreNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.moreNavigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
}




@end
