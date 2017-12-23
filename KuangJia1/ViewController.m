//
//  ViewController.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "ViewController.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableViewController];
}


- (void)initTableViewController{
    //tabbar上的控制器
    NSArray *classNameViewController = @[@"VC1",@"VC2",@"VC3",@"VC4",@"VC5",@"VC6",@"VC7",@"VC8",@"VC9",@"VC10",@"VC11",@"VC12",@"VC13",@"VC14",@"VC15"];
    //未选中的图片
    NSArray * images = @[@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1",@"首页-1"];
    //选中的图片
    NSArray * selectImages =  @[@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页",@"首页"];
    //控制器标题
    NSArray * titArr = @[@"VC1",@"VC2",@"VC3",@"VC4",@"VC5",@"VC6",@"VC7",@"VC8",@"VC9",@"VC10",@"VC11",@"VC12",@"VC13",@"VC14",@"VC15"];
    
    NSMutableArray * viewControllers = [NSMutableArray array];
    [classNameViewController enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *classVC = [NSClassFromString(obj) new];
        BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:classVC];
        classVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:titArr[idx] image:[[UIImage imageNamed:images[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:nav];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateNormal];
        classVC.title = titArr[idx];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB(50, 170, 227)} forState:UIControlStateSelected];
        
    }];
    
    BaseTabBarController * tabBarVC = [BaseTabBarController new];
    tabBarVC.viewControllers = viewControllers;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = tabBarVC;
    [window makeKeyAndVisible];
    
    //设置"更多"tabbar上的文字
    if(tabBarVC.moreNavigationController){
        UITabBar *tb = tabBarVC.moreNavigationController.tabBarController.tabBar;
        UIView *tbb=[[tb subviews] lastObject];
        
        UIView *v=[[tbb subviews]objectAtIndex:1];
        NSString* str= @"自定义";
        
        CGSize sc=[str sizeWithFont:[UIFont systemFontOfSize:10.0f]];
        v.frame=CGRectMake(v.frame.origin.x, v.frame.origin.y, sc.width, v.frame.size.height);
        [[[tbb subviews]lastObject] setText:str];
    }
}



@end
