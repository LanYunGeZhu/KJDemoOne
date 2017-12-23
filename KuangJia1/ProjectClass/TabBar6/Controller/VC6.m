//
//  VC6.m
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC6.h"

@interface VC6 ()

@end

@implementation VC6

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"键盘遮挡弹起";

    //IQKeyboardManager是iOS中解决键盘弹起遮挡UITextField/UITextView的一种很实用的工具。无需输入任何代码,不需要额外的设置。使用IQKeyboardManager的你只需要将源文件添加到项目。利用cocoapod导入即可
    
    //使用方法
    
    //导入IQKeyboardManager后，默认所有的页面都有了这个功能，如果你在哪一个界面不想有这个效果
     //1.可以在当前界面控制器的生命周期方法中进行设置：
//    - (void)viewWillAppear:(BOOL)animated{
//        [super viewWillAppear:animated];
//        [IQKeyboardManager sharedManager].enable = NO;
//    }
//    - (void)viewWillDisappear:(BOOL)animated{
//        [super viewWillDisappear:animated];
//        [IQKeyboardManager sharedManager].enable = YES;
//    }
    //2.或者在 AppDelegate中注册方法：
//    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//        [[IQKeyboardManager sharedManager] disableInViewControllerClass:[ViewController class]];
//        return YES;
//    }
    
    
    //在键盘上会自动添加一个工具条，工具条上有左箭头和右箭头用来切换的输入文本框
    //如果不使用只需要设置 [IQKeyboardManager sharedManager].enableAutoToolbar = NO;

    
    //设置点击背景收回键盘。
    //[IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;

    
    
    //如果你的视图有导航栏，你不想上移View时导航栏消失，你也可以进行相应设置：
    //如果你使用的是storyboard or xib，只需将当前视图视图控制器中的UIView class变为UIScrollView。
    //如果你使用的是代码，你就需要覆盖UIViewController中的'-(void)loadView' 方法：
//    -(void)loadView
//    {
//        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//        self.view = scrollView;
//    }

}


@end
